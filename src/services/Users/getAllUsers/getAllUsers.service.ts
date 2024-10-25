import { paginationCustomResult } from "../../../Others/paginationCustomResult";
import { AllUserQuery } from "../../../routes/users/getAllUsers/getAllUsers";
import { db } from "../../../utils/db.server";

export const getAllUsers = async ({
  status,
  pageNumber,
  rowPerPage,
  pagination,
}: AllUserQuery) => {
  //pagination
  const pageNumbers = pageNumber ? parseInt(pageNumber.toString()) : 1;
  const resultPerPage = rowPerPage ? parseInt(rowPerPage.toString()) : 10;

  const [result, total] = await Promise.all([
    db.user.findMany({
      ...(pagination && {
        skip: (pageNumbers - 1) * resultPerPage,
        take: resultPerPage,
      }),

      omit: {
        createdAt: true,
        updatedAt: true,
        password: true,
      },
      orderBy: {
        createdAt: "desc",
      },
      ...(status && {
        where: {
          OR: [
            {
              otherUsers: {
                isActive: status,
              },
            },
            {
              worker: {
                isActive: status,
              },
            },
          ],
        },
      }),
    }),
    pagination
      ? db.user.count({
          ...(status && {
            where: {
              OR: [
                {
                  otherUsers: {
                    isActive: status,
                  },
                },
                {
                  worker: {
                    isActive: status,
                  },
                },
              ],
            },
          }),
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
