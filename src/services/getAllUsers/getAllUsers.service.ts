import { db } from "../../utils/db.server";

export const getAllUsers = async () => {
  const users = await db.user.findMany({
    include: {
      administrator: true,
      otherUsers: true,
      logginInfo: true,
    },
  });
  return users;
};
