import express from "express";
import type { Request, Response, NextFunction } from "express";
import { getOthersUsers } from "../../../services/Users/getOthersUsers/getOthersUsers.service";
import { showResponse } from "../../../constant/showResponse";
import { verifyTokenMiddleware } from "../../../Others/JWT";

export const othersUsersRoute = express.Router();

// Get all othersUsers

const getOthersUsersHandler: express.RequestHandler = async (
  _req: Request,
  res: Response,
  next: NextFunction
) => {
  try {
    const users = await getOthersUsers();
    showResponse(res, {
      message: "Users fetched successfully",
      data: users,
    });
  } catch (error: any) {
    next(error);
  }
};

othersUsersRoute.get(
  "/others-users",
  verifyTokenMiddleware,
  getOthersUsersHandler
);
