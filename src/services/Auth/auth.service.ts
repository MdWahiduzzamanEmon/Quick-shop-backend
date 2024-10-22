import { Role } from "@prisma/client";
import { db } from "../../utils/db.server";

export const checkUserExist = async (
  email?: string,
  mobile?: number,
  username?: string
) => {
  const user = await db.otherUsers.findFirst({
    where: {
      OR: [{ email }, { mobile: mobile?.toString() }, { username }],
    },
    omit: {
      createdAt: true,
      updatedAt: true,
      profile_picture: true,
    },
  });
  return user;
};

//check already exist user in worker model

export const checkWorkerExist = async (
  email?: string,
  mobile?: number,
  surname?: string,
  NID?: string,
  whatsapp?: string
) => {
  const worker = await db.worker.findFirst({
    where: {
      OR: [
        { email },
        { mobile: mobile?.toString() },
        { surname },
        { NID },
        { whatsapp },
      ],
    },
    omit: {
      createdAt: true,
      updatedAt: true,
      profile_picture: true,
      NIDImage: true,
    },
  });

  return worker;
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
      otherUsers: {
        create: {
          email,
          mobile: mobile.toString(),
          firstName,
          lastName,
          username,
          password,
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
  surname,
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
      worker: {
        create: {
          fullName,
          surname,
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
  const employeeID = `EM-${new Date().getFullYear()}${new Date().getMonth()}${new Date().getDate()}.${
    workerRes.worker?.order ?? Math.floor(Math.random() * 100)
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
