import express from "express";
import type { Request, Response, NextFunction } from "express";
import { getAllUsers } from "../../services/Users/getAllUsers/getAllUsers.service";

export const allUsersRoute = express.Router();

// Get all users
allUsersRoute.get(
  "/all-users",
  async (req: Request, res: Response, next: NextFunction) => {
    try {
      const users = await getAllUsers();
      if (!users) {
        return res.status(404).json({
          success: false,
          status: 404,
          message: "Users not found",
        });
      }
      return res.status(200).json({
        success: true,
        status: 200,
        message: "Users fetched successfully",
        data: users,
      });
    } catch (error: any) {
      next(error);
    }
  }
);
