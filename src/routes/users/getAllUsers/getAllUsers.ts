import express, { Request, Response, NextFunction } from "express";
import { getAllUsers } from "../../../services/Users/getAllUsers/getAllUsers.service";
import { showResponse } from "../../../constant/showResponse";
import { verifyTokenMiddleware } from "../../../Others/JWT";
import { User_status } from "@prisma/client";

export const allUsersRoute = express.Router();

// Get all users
export type AllUserQuery = {
  status?: User_status;
  pageNumber?: number;
  rowPerPage?: number;
  pagination?: boolean;
};

const getAllUsersHandler: express.RequestHandler = async (
  _req: Request,
  res: Response,
  next: NextFunction
) => {
  const reqData = _req as any;
  const { user } = reqData;
  try {
    if (user?.role !== "ADMIN" && user?.role !== "SUPER_ADMIN") {
      showResponse(res, {
        status: 403,
        success: false,
        message: "Unauthorized access.Only Admin can perform this action",
      });
      return;
    }

    const { status, pageNumber, rowPerPage, pagination } =
      reqData?.query as AllUserQuery;

    const users = await getAllUsers({
      status,
      pageNumber,
      rowPerPage,
      pagination,
    });
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
