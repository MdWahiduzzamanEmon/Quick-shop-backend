import express, { Request, Response, NextFunction } from "express";
import { getAllUsers } from "../../../services/Users/getAllUsers/getAllUsers.service";
import { showResponse } from "../../../constant/showResponse";
import { verifyTokenMiddleware } from "../../../Others/JWT";

export const allUsersRoute = express.Router();

// Get all users

const getAllUsersHandler: express.RequestHandler = async (
  _req: Request,
  res: Response,
  next: NextFunction
) => {
  const { user } = _req as any;
  try {
    if (user?.role !== "ADMIN") {
      showResponse(res, {
        status: 403,
        success: false,
        message: "Unauthorized access.Only Admin can perform this action",
      });
      return;
    }
    const users = await getAllUsers();
    showResponse(res, {
      message: "All Users fetched successfully",
      data: users,
    });
    return;
  } catch (error: any) {
    next(error);
  }
};

allUsersRoute.get("/all-users", verifyTokenMiddleware, getAllUsersHandler);
