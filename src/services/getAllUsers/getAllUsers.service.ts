import { db } from "../../utils/db.server";

export const getAllUsers = async () => {
  const users = await db.user.findMany({
    omit: {
      createdAt: true,
      updatedAt: true,
    },
    include: {
      administrator: {
        omit: {
          password: true,
        },
      },
      otherUsers: {
        omit: {
          password: true,
        },
      },
      loggin_history: true,
    },
  });
  return users;
};
