import express, { Request, Response, NextFunction } from "express";
import { showResponse } from "../../../constant/showResponse";
import { verifyTokenMiddleware } from "../../../Others/JWT";
import { getAdminUser } from "../../../services/Users/Admin/admin.service";

export const adminRoute = express.Router();

// Get all users

const getAdminHandler: express.RequestHandler = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const { user } = req as any;
  try {
    if (user?.role !== "ADMIN") {
      showResponse(res, {
        status: 403,
        success: false,
        message: "Unauthorized access",
      });
      return;
    }
    const users = await getAdminUser();
    showResponse(res, {
      message: "Admin Users fetched successfully",
      data: users,
    });
    return;
  } catch (error: any) {
    next(error);
  }
};

adminRoute.get("/admin", verifyTokenMiddleware, getAdminHandler);
