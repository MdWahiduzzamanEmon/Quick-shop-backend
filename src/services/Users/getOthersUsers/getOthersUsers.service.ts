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

//get single customer by id
export const getSingleCustomerByID = async (customerID: string) => {
  return await db.otherUsers.findFirst({
    where: {
      id: customerID,
    },
    include: {
      User: {
        select: {
          id: true,
          email: true,
          username: true,
          mobile: true,
        },
      },
    },
  });
};
