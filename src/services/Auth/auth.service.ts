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

//register

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
