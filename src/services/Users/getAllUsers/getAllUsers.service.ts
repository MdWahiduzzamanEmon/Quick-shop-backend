import { db } from "../../../utils/db.server";

export const getAllUsers = async () => {
  const users = await db.user.findMany({
    omit: {
      createdAt: true,
      updatedAt: true,
    },
    include: {
      otherUsers: {
        omit: {
          password: true,
        },
      },
      worker: {
        omit: {
          password: true,
        },
      },
    },
  });
  return users;
};
