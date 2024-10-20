import express from "express";
import type { Request, Response, NextFunction } from "express";
import { getOthersUsers } from "../../../services/Users/getOthersUsers/getOthersUsers.service";
import { showResponse } from "../../../constant/showResponse";

export const othersUsersRoute = express.Router();

// Get all othersUsers
othersUsersRoute.get(
  "/others-users",
  async (req: Request, res: Response, next: NextFunction) => {
    try {
      const users = await getOthersUsers();
      return showResponse(res, {
        message: "Users fetched successfully",
        data: users,
      });
    } catch (error: any) {
      next(error);
      console.log(error);
    }
  }
);
