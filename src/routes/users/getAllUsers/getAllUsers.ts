import express from "express";
import type { Request, Response, NextFunction } from "express";
import { getAllUsers } from "../../../services/Users/getAllUsers/getAllUsers.service";
import { showResponse } from "../../../constant/showResponse";

export const allUsersRoute = express.Router();

// Get all users
allUsersRoute.get(
  "/all-users",
  async (req: Request, res: Response, next: NextFunction) => {
    try {
      const users = await getAllUsers();
      return showResponse(res, {
        message: "All Users fetched successfully",
        data: users,
      });
    } catch (error: any) {
      next(error);
    }
  }
);
