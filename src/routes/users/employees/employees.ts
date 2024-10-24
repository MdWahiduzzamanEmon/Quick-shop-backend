import express from "express";
import type { Request, Response, NextFunction } from "express";
import { getOthersUsers } from "../../../services/Users/getOthersUsers/getOthersUsers.service";
import { showResponse } from "../../../constant/showResponse";
import { verifyTokenMiddleware } from "../../../Others/JWT";
import {
  getEmployees,
  getSingleEmployeeByID,
} from "../../../services/Users/employees/employees.service";

export const employeesRoute = express.Router();

// Get all othersUsers

const getOthersUsersHandler: express.RequestHandler = async (
  _req: Request,
  res: Response,
  next: NextFunction
) => {
  try {
    const users = await getEmployees();
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
