import { ILoginHistory } from "../../../routes/Auth/auth";
import { db } from "../../../utils/db.server";

export const getLoginHistory = async (last_login?: boolean) => {
  const res = await db.loggin_history.findMany({
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
