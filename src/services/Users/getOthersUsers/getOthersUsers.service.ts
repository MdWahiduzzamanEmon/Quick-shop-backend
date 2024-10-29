import { paginationCustomResult } from "../../../Others/paginationCustomResult";
import { OtherUserQuery } from "../../../routes/users/othersUsers/othersUsers";
import { db } from "../../../utils/db.server";

export const getOthersUsers = async ({
  status,
  pageNumber,
  rowPerPage,
  pagination,
}: OtherUserQuery) => {
  const pageNumbers = pageNumber ? parseInt(pageNumber.toString()) : 1;
  const resultPerPage = rowPerPage ? parseInt(rowPerPage.toString()) : 10;

  const [result, total] = await Promise.all([
    db.otherUsers.findMany({
      ...(pagination && {
        skip: (pageNumbers - 1) * resultPerPage,
        take: resultPerPage,
      }),
      include: {
        User: {
          select: {
            username: true,
            mobile: true,
            email: true,
          },
        },
      },

      omit: {
        createdAt: true,
        updatedAt: true,
      },
      orderBy: {
        createdAt: "desc",
      },
      ...(status && { where: { isActive: status } }),
    }),
    pagination
      ? db.otherUsers.count({
          ...(status && { where: { isActive: status } }),
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
