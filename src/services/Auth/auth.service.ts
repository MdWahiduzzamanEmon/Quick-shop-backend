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
    include: {
      otherUsers: {
        select: {
          id: true,
          order: true,
        },
      },
    },
  });

  const userUniqueId = `CS-${new Date().getFullYear()}${new Date().getMonth()}${Math.floor(
    Math.random() * 1000 // 0-999
  )}-${user.otherUsers?.order}`;

  // Use Promise.all to handle concurrent operations
  await Promise.all([
    // Update the userUniqueId in parallel (no need to wait)
    db.otherUsers
      .update({
        where: {
          id: user.otherUsers?.id,
        },
        data: {
          userUniqueId,
          order: {
            increment: 1,
          },
        },
      })
      .catch((error) => {
        // Handle any errors during the update process
        console.error("Error updating userUniqueId:", error);
      }),
  ]);

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
  const employeeID = `EM-${new Date().getFullYear()}${new Date().getMonth()}${Math.floor(
    Math.random() * 1000 // 0-999
  )}-${workerRes.worker?.order}`;

  await Promise.all([
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
    }).catch((error) => {
      // Handle any errors during the update process
      console.error("Error updating employeeID:", error);
    })
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
