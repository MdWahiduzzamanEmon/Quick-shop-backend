import express from "express";
import type { Request, Response, NextFunction } from "express";
import { getOthersUsers } from "../../../services/Users/getOthersUsers/getOthersUsers.service";
import { showResponse } from "../../../constant/showResponse";
import { verifyTokenMiddleware } from "../../../Others/JWT";

export const othersUsersRoute = express.Router();

// Get all othersUsers

const getCustomersHandler: express.RequestHandler = async (
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
    const users = await getOthersUsers();
    showResponse(res, {
      message: "Users fetched successfully",
      data: users,
    });
  } catch (error: any) {
    next(error);
  }
};

othersUsersRoute.get("/customers", verifyTokenMiddleware, getCustomersHandler);


