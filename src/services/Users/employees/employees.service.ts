import { User_status } from "@prisma/client";
import { db } from "../../../utils/db.server";
import { paginationCustomResult } from "../../../Others/paginationCustomResult";
import { EmployeeQuery } from "../../../routes/users/employees/employees";

export const getEmployees = async ({
  status,
  pageNumber,
  rowPerPage,
  pagination,
}: EmployeeQuery) => {
  //pagination
  const pageNumbers = pageNumber ? parseInt(pageNumber.toString()) : 1;
  const resultPerPage = rowPerPage ? parseInt(rowPerPage.toString()) : 10;

  const [result, total] = await Promise.all([
    db.worker.findMany({
      where: {
        ...(status && { isActive: status }),
      },
      omit: {
        createdAt: true,
        updatedAt: true,
      },
      ...(pagination
        ? {
            take: resultPerPage,
            skip: (pageNumbers - 1) * resultPerPage,
          }
        : {}),
    }),
    pagination
      ? db.worker.count({
          where: {
            ...(status && { isActive: status }),
          },
        })
      : Promise.resolve(0),
  ]);

  if (!pagination) return result;

  const res = paginationCustomResult({
    pageNumbers,
    resultPerPage,
    result,
    totalResultCount: total,
  });

  return res;
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
