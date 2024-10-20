import { db } from "../../utils/db.server";

export const login = async (email: string, password: string) => {
  const user = await db.user.findUnique({
    where: {
      email,
    },
  });
  return user;
};
