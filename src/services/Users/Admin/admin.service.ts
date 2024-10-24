import { db } from "../../../utils/db.server";

export const getAdminUser = async () => {
  return await db.user.findMany({
    where: {
      admin: {
        is: {
          role: "ADMIN",
        },
      },
    },
    omit: {
      createdAt: true,
      updatedAt: true,
      password: true,
    },
    include: {
      admin: true,
    },
  });
};
