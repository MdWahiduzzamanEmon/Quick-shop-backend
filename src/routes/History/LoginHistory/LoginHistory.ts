import express from "express";
import type { Request, Response, NextFunction } from "express";
import { showResponse } from "../../../constant/showResponse";
import {
  getLoginHistory,
  getSingleLoginHistory,
} from "../../../services/History/LoginHistory/loginHistory.service";
import { verifyTokenMiddleware } from "../../../Others/JWT";
import { setInitialArray, getListFromRedis } from "../../../Redis";
import errorMessage from "../../../Others/ErrorMessage/errorMessage";

export const loginHistoryRoute = express.Router();

// Get login history

export type LoginHistoryQuery = {
  last_login: boolean;
  pageNumber: number;
  rowPerPage: number;
  pagination: boolean;
};

const getLoginHistoryHandler: express.RequestHandler = async (
  _req: Request,
  res: Response,
  next: NextFunction
): Promise<void> => {
  try {
    const { last_login, pageNumber, rowPerPage, pagination } =
      _req.query as unknown as LoginHistoryQuery;

    //redis cache

    const cachedData = await getListFromRedis("login-history");
    if (cachedData && !pagination && !last_login) {
      showResponse(res, {
        message: "Login History fetched successfully from cache",
        data: cachedData,
      });
      return;
    }

    const history = (await getLoginHistory({
      last_login,
      pageNumber,
      rowPerPage,
      pagination,
    })) as any;

    // console.log(history, "history");

    // http cache for 30 sec
    res.set("Cache-Control", "public, max-age=30, must-revalidate");

    //redis cache
    if (!pagination) {
      await setInitialArray("login-history", history);
    }
    showResponse(res, {
      message: "Login History fetched successfully",
      data: history,
    });
    return;
  } catch (error: any) {
    errorMessage(res, error, next);
  }
};

loginHistoryRoute.get(
  "/login-history",
  verifyTokenMiddleware,
  getLoginHistoryHandler
);

// Get login history for user

const getSingleLoginHistoryHandler: express.RequestHandler = async (
  req: Request,
  res: Response,
  next: NextFunction
): Promise<void> => {
  const reqData = req as any;
  try {
    const { id: userId } = reqData?.user as {
      id: string;
    };

    const { last_login } = req.query as unknown as {
      last_login: boolean;
    };

    if (!last_login && typeof last_login !== "boolean") {
      throw new Error("last_login must be a boolean value");
    }

    const history = (await getSingleLoginHistory(userId, last_login)) as any;
    showResponse(res, {
      message: "Login History fetched successfully",
      data: history,
    });
  } catch (error: any) {
    next(error);
  }
};

loginHistoryRoute.get(
  "/user-login-history",
  verifyTokenMiddleware,
  getSingleLoginHistoryHandler
);
