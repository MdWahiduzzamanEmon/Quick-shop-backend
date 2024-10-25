import express from "express";
import type { Request, Response, NextFunction } from "express";
import { getOthersUsers } from "../../../services/Users/getOthersUsers/getOthersUsers.service";
import { showResponse } from "../../../constant/showResponse";
import { verifyTokenMiddleware } from "../../../Others/JWT";
import {
  getEmployees,
  getSingleEmployeeByID,
} from "../../../services/Users/employees/employees.service";
import { User_status } from "@prisma/client";

export const employeesRoute = express.Router();

// Get all othersUsers

export type EmployeeQuery = {
  status?: User_status;
  pageNumber?: number;
  rowPerPage?: number;
  pagination?: boolean;
};

const getOthersUsersHandler: express.RequestHandler = async (
  _req: Request,
  res: Response,
  next: NextFunction
) => {
  const reqData = _req as any;
  try {
    const { status, pageNumber, rowPerPage, pagination } =
      reqData?.query as EmployeeQuery;
    const users = await getEmployees({
      status,
      pageNumber,
      rowPerPage,
      pagination,
    });
    showResponse(res, {
      message: "Employees fetched successfully",
      data: users,
    });
  } catch (error: any) {
    next(error);
  }
};

employeesRoute.get("/employees", verifyTokenMiddleware, getOthersUsersHandler);

//getSingleEmployeeByID
const getSingleEmployeeByIDHandler: express.RequestHandler = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  try {
    const { employeeID } = req.params;

    const user = await getSingleEmployeeByID(employeeID);

    if (!user) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Employee not found with this ID",
      });
      return;
    }

    //http cache
    // res.setHeader("Cache-Control", "public, max-age=86400 must-revalidate"); // 1 day

    showResponse(res, {
      message: "Employee fetched successfully",
      data: user,
    });
  } catch (error: any) {
    next(error);
  }
};

employeesRoute.get(
  "/employees/:employeeID",
  verifyTokenMiddleware,
  getSingleEmployeeByIDHandler
);
