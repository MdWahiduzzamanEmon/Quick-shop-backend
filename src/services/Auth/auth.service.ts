import { db } from "../../utils/db.server";

export const checkUserExist = async (email?: string, mobile?: number) => {
  const user = await db.otherUsers.findFirst({
    where: {
      OR: [{ email }, { mobile: String(mobile) }],
    },
    omit: {
      createdAt: true,
      updatedAt: true,
    },
  });
  return user;
};
