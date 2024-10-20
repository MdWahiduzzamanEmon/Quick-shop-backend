import { db } from "../../../utils/db.server";

export const getAdministrator = async () => {
  const users = await db.administrator.findMany({
    omit: {
      createdAt: true,
      updatedAt: true,
      password: true,
    },
    include: {
      loggin_history: true,
    },
  });
  return users;
};
