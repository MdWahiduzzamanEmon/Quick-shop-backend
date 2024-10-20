import express from "express";
import type { Request, Response, NextFunction } from "express";
import { showResponse } from "../../../constant/showResponse";
import { getLoginHistory } from "../../../services/History/LoginHistory/loginHistory.service";

export const loginHistoryRoute = express.Router();

// Get login history

const getLoginHistoryHandler: express.RequestHandler = async (
  _req: Request,
  res: Response,
  next: NextFunction
) => {
  try {
    const history = await getLoginHistory();
    showResponse(res, {
      message: "Login History fetched successfully",
      data: history,
    });
  } catch (error: any) {
    next(error);
  }
};

loginHistoryRoute.get("/login-history", getLoginHistoryHandler);
