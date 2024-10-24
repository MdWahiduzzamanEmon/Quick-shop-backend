import { db } from "../../../utils/db.server";

export const getEmployees = async () => {
  return await db.worker.findMany({
    omit: {
      createdAt: true,
      updatedAt: true,
    },
  });
};

//get single employee
export const getSingleEmployeeByID = async (employeeID: string) => {
  return await db.worker.findFirst({
    where: {
      id: employeeID,
    },
    omit: {
      createdAt: true,
      updatedAt: true,
      userId: true,
    },
    include: {
      user: {
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
