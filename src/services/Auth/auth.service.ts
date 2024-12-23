import { Role } from "@prisma/client";
import { db } from "../../utils/db.server";
import { generateUniqueID } from "../../Others/OTP/otp";

export const checkSuperAdminExist = async (
  email?: string,
  mobile?: number,
  username?: string
) => {
  const admin = await db.superAdmin.findFirst({
    where: {
      OR: [{ email }, { mobile: mobile?.toString() }, { username }],
    },

    omit: {
      createdAt: true,
      updatedAt: true,
    },
  });

  return admin;
};

export const checkUserExist = async (
  email?: string,
  mobile?: number,
  username?: string
) => {
  const user = await db.user.findFirst({
    where: {
      OR: [{ email }, { mobile: mobile?.toString() }, { username }],
    },
    omit: {
      createdAt: true,
      updatedAt: true,
    },
    include: {
      otherUsers: {
        select: {
          id: true,
          role: true,
        },
      },
      worker: {
        select: {
          id: true,
          role: true,
        },
      },
      admin: {
        select: {
          id: true,
          role: true,
        },
      },
    },
  });

  const role = user?.otherUsers
    ? user?.otherUsers?.role
    : user?.worker
    ? user?.worker?.role
    : user?.admin?.role;

  const customerId = user?.otherUsers?.id || null;
  const employeeId = user?.worker?.id || null;
  const adminId = user?.admin?.id || null;

  const { otherUsers, worker, admin, ...userWithoutOtherUsers } = user ?? {};

  return role
    ? {
        ...userWithoutOtherUsers,
        customerId,
        adminId,
        employeeId,
        role,
      }
    : false;
};

//register (general user+retailer)

export const customerRegister = async (
  email: string,
  mobile: number,
  firstName: string,
  lastName: string,
  username: string,
  password: string,
  profile_picture: string,
  role: Role,
  vendorId: string
) => {
  const user = await db.user.create({
    data: {
      email,
      mobile: mobile.toString(),
      username,
      password,
      vendorId,

      otherUsers: {
        create: {
          firstName,
          lastName,
          userUniqueId: generateUniqueID("CS"),
          ...(profile_picture && { profile_picture }),
          ...(role && { role }),
        },
      },
    },
    include: {
      otherUsers: {
        select: {
          id: true,
          order: true,
        },
      },
    },
  });

  return user;
};

//worker create (operator+raider+representative)

export const workerRegister = async ({
  fullName,
  username,
  role,
  fatherName,
  whatsapp,
  mobile,
  NID,
  education,
  bankName,
  branchName,
  accountNumber,
  mobileBanking,
  mobileBankingNumber,
  address,
  zipCode,
  email,
  password,
  profile_picture,
  NIDImage,
  TOKEN_VENDOR_ID,
}: any) => {
  const workerRes = await db.user.create({
    data: {
      email,
      password,
      username,
      mobile,
      vendorId: TOKEN_VENDOR_ID,
      worker: {
        create: {
          fullName,
          role,
          fatherName,
          whatsapp,
          NID,
          education,
          bankName,
          branchName,
          accountNumber,
          mobileBanking,
          mobileBankingNumber,
          address,
          zipCode,
          employeeID: generateUniqueID("EM"),
          ...(profile_picture && { profile_picture }),
          ...(NIDImage && { NIDImage }),
        },
      },
    },
    include: {
      worker: {
        select: {
          id: true,
          order: true,
        },
      },
    },
  });

  return workerRes;
};

//delete worker

export const deleteUser = async (id: string) => {
  const deletedWorker = await db.user.delete({
    where: {
      id,
    },
  });
  return deletedWorker;
};
