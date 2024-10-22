import { db } from "../../../utils/db.server";

export const getOthersUsers = async () => {
  const users = await db.otherUsers.findMany({
    omit: {
      createdAt: true,
      updatedAt: true,
    },
  });
  return users;
};
