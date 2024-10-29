import express, { Request, Response, NextFunction } from "express";
import { showResponse } from "../../../constant/showResponse";
import { verifyTokenMiddleware } from "../../../Others/JWT";
import { getAdminUser } from "../../../services/Users/Admin/admin.service";
import errorMessage from "../../../Others/ErrorMessage/errorMessage";

export const adminRoute = express.Router();

// Get all users

const getAdminHandler: express.RequestHandler = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const { user } = req as any;
  console.log(user);
  try {
    if (user?.role !== "ADMIN" && user?.role !== "SUPER_ADMIN") {
      // check if user is ADMIN or SUPER_ADMIN👈
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
    errorMessage(res, error, next);
  }
};

adminRoute.get("/admin", verifyTokenMiddleware, getAdminHandler);
