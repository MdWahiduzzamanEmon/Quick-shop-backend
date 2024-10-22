import { Role } from "@prisma/client";
import { db } from "../../utils/db.server";

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
          role: true,
        },
      },
      worker: {
        select: {
          role: true,
        },
      },
    },
  });

  const role = user?.otherUsers ? user?.otherUsers?.role : user?.worker?.role;
  const { otherUsers, worker, ...userWithoutOtherUsers } = user ?? {};

  return role ? { ...userWithoutOtherUsers, role } : false;
};

//register (general user+retailer)

export const register = async (
  email: string,
  mobile: number,
  firstName: string,
  lastName: string,
  username: string,
  password: string,
  profile_picture: string,
  role: Role
) => {
  const user = await db.user.create({
    data: {
      email,
      mobile: mobile.toString(),
      username,
      password,
      otherUsers: {
        create: {
          firstName,
          lastName,
          ...(profile_picture && { profile_picture }),
          ...(role && { role }),
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
}: any) => {
  const workerRes = await db.user.create({
    data: {
      email,
      password,
      username,
      mobile,
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

  //syncronasly update worker employeeId : EM-{current_year}{current_month}{current_date}
  const employeeID = `EM-${new Date().getFullYear()}${new Date().getMonth()}${new Date().getDate()}-${
    workerRes.worker?.order
  }`;

  Promise.all([
    db.worker.update({
      where: {
        id: workerRes.worker?.id,
      },
      data: {
        employeeID,
        order: {
          increment: 1,
        },
      },
    }),
  ]);

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
