import { db } from "../../../utils/db.server";

export const getAllUsers = async () => {
  const users = await db.user.findMany({
    omit: {
      createdAt: true,
      updatedAt: true,
      password: true,
    },
    include: {
      otherUsers: true,
      worker: true,
    },
  });
  return users;
};
