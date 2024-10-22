import { paginationCustomResult } from "../../../Others/paginationCustomResult";
import { ILoginHistory } from "../../../routes/Auth/auth";
import { LoginHistoryQuery } from "../../../routes/History/LoginHistory/LoginHistory";
import { db } from "../../../utils/db.server";

export const getLoginHistory = async ({
  last_login,
  pageNumber,
  rowPerPage,
  pagination,
}: LoginHistoryQuery) => {
  //pagination
  const pageNumbers = pageNumber ? parseInt(pageNumber.toString()) : 1;
  const resultPerPage = rowPerPage ? parseInt(rowPerPage.toString()) : 10;

  const [result, total] = await Promise.all([
    db.loggin_history.findMany({
      ...(pagination && {
        skip: (pageNumbers - 1) * resultPerPage,
        take: resultPerPage,
      }),
      include: {
        otherUsers: {
          select: {
            id: true,
            role: true,
            email: true,
            username: true,
            mobile: true,
          },
        },
      },
      omit: {
        createdAt: true,
        updatedAt: true,
        otherUsersId: true,
      },
      orderBy: {
        loginAt: "desc",
      },
      //if last_login then only last success status login history
      ...(last_login && { take: 1, where: { status: "SUCCESS" } }),
    }),
    pagination
      ? db.loggin_history.count({
          ...(last_login && { take: 1, where: { status: "SUCCESS" } }),
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

//create login history

export const createLoginHistory = async (body: ILoginHistory) => {
  const loginHistory = await db.loggin_history.create({
    data: {
      userId: body.userId,
      ipAddress: body.ipAddress,
      device: body.device,
      browser: body.browser,
      os: body.os,
      location: body.location,
      status: body.status,
      otherUsersId: body.otherUsersId,
      note: body.note,
    },
  });

  return loginHistory;
};

//single user login history
export const getSingleLoginHistory = async (
  id: string,
  last_login?: boolean
) => {
  // Set default value for last_login
  const loginHistory = await db.loggin_history.findFirst({
    where: {
      AND: [{ userId: id }, { status: "SUCCESS" }],
    },
    select: {
      id: true,
      userId: true,
      loginAt: true,
      location: true,
      ipAddress: true,
    },
    orderBy: last_login ? { loginAt: "desc" } : undefined, // Order by loginAt if last_login is true
  });

  return loginHistory;
};
