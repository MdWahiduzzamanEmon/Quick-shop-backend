import express from "express";
import type { Request, Response, NextFunction } from "express";
import { getOthersUsers } from "../../../services/Users/getOthersUsers/getOthersUsers.service";
import { showResponse } from "../../../constant/showResponse";
import { verifyTokenMiddleware } from "../../../Others/JWT";
import {
  getEmployees,
  getEmployeesByRole,
  getSingleEmployeeByID,
  updateEmployee,
} from "../../../services/Users/employees/employees.service";
import { User_status, WorkerRole } from "@prisma/client";
import errorMessage from "../../../Others/ErrorMessage/errorMessage";
import {
  unlinkFile,
  uploadMiddleware,
} from "../../../Others/File/fileUploadController";

export const employeesRoute = express.Router();

// Get all othersUsers

export type EmployeeQuery = {
  status?: User_status;
  pageNumber?: number;
  rowPerPage?: number;
  pagination?: boolean;
  employeeUniqueID?: string;
  vendorId: string;
  role?: WorkerRole;
  employeeId?: string;
};

const getOthersUsersHandler: express.RequestHandler = async (
  _req: Request,
  res: Response,
  next: NextFunction
) => {
  const reqData = _req as any;
  try {
    const { vendorId, employeeId, role: TOKEN_ROLE } = reqData?.user;
    // console.log("vendorId", reqData?.user);
    const {
      status,
      pageNumber,
      rowPerPage,
      pagination,
      employeeUniqueID,
      role,
    } = reqData?.query as EmployeeQuery;

    if (role && !(role in WorkerRole)) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Invalid User Role",
      });
      return;
    }

    const body = {
      status,
      pageNumber,
      rowPerPage,
      pagination,
      employeeUniqueID,
      vendorId,
      role,
      ...(TOKEN_ROLE !== "ADMIN" && employeeId && { employeeId }),
    };

    const users = await getEmployees(body);
    showResponse(res, {
      message: "Employees fetched successfully",
      data: users,
    });
  } catch (error: any) {
    errorMessage(res, error, next);
  }
};

employeesRoute.get("/employees", verifyTokenMiddleware, getOthersUsersHandler);

//getSingleEmployeeByID
const getSingleEmployeeByIDHandler: express.RequestHandler = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const reqData = req as any;
  try {
    const { employeeID } = reqData.params;
    const { vendorId } = reqData?.user;

    const user = await getSingleEmployeeByID(employeeID, vendorId);

    if (!user) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Employee not found with this ID",
      });
      return;
    }

    //http cache
    // res.set("Cache-Control", "public, max-age=86400 must-revalidate"); // 1 day

    showResponse(res, {
      message: "Employee fetched successfully",
      data: user,
    });
  } catch (error: any) {
    errorMessage(res, error, next);
  }
};

employeesRoute.get(
  "/employees/:employeeID",
  verifyTokenMiddleware,
  getSingleEmployeeByIDHandler
);

//employess short list by role

const getEmployeesByRoleHandler: express.RequestHandler = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const reqData = req as any;
  try {
    const { vendorId } = reqData?.user;
    const { role } = reqData?.query;

    if (!role) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Role is required",
      });
      return;
    }

    if (role && !(role in WorkerRole)) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Invalid User Role",
      });
      return;
    }

    const users = await getEmployeesByRole({
      vendorId,
      role: role as WorkerRole,
    });

    showResponse(res, {
      message: "Employees short list fetched successfully",
      data: users,
    });
  } catch (error: any) {
    errorMessage(res, error, next);
  }
};

employeesRoute.get(
  "/employees-role/short-list",
  verifyTokenMiddleware,
  getEmployeesByRoleHandler
);

//editEmployee
// fatherName: string;
//     fullName: string;
//     whatsapp: string;
//     NID: string;
//     education: string;
//     bankName: string;
//     branchName: string;
//     accountNumber: string;
//     mobileBanking: string;
//     mobileBankingNumber: string;
//     address: string;
//     zipCode: string;
const editEmployeeHandler: express.RequestHandler = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const reqData = req as any;
  try {
    const { employeeID } = req.params;
    const { vendorId } = reqData?.user;
    const {
      fullName,
      fatherName,
      whatsapp,
      NID,
      education,
      bankName,
      branchName,
      accountNumber,
      mobileBanking,
      mobileBankingNumber,
      address,
      zipCode,
    } = reqData?.body;
    // for (let i = 0; i < reqData?.fileUrl?.length; i++) {
    //   await unlinkFile(reqData?.fileUrl[i]?.publicId as unknown as any);
    // }
    const profile_picture = reqData?.fileUrl?.[0] as string;

    const user = (await getSingleEmployeeByID(employeeID, vendorId)) as any;
    if (!user) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Employee not found with this ID",
      });

      for (let i = 0; i < reqData?.fileUrl?.length; i++) {
        await unlinkFile(reqData?.fileUrl[i]?.publicId as unknown as any);
      }

      return;
    }

    if (user?.profile_picture) {
      await unlinkFile(user?.profile_picture?.publicId as unknown as any);
    }

    const updatedUser = await updateEmployee(employeeID, {
      fullName,
      fatherName,
      whatsapp,
      NID,
      education,
      bankName,
      branchName,
      accountNumber,
      mobileBanking,
      mobileBankingNumber,
      address,
      zipCode,
      ...(profile_picture && { profile_picture }),
    });

    if (!updatedUser) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Employee update failed",
      });
      return;
    }

    showResponse(res, {
      message: "Employee updated successfully",
      data: updatedUser,
    });
  } catch (error: any) {
    for (let i = 0; i < reqData?.fileUrl?.length; i++) {
      await unlinkFile(reqData?.fileUrl[i]?.publicId as unknown as any);
    }

    errorMessage(res, error, next);
  }
};

employeesRoute.put(
  "/employee-update/:employeeID",
  uploadMiddleware,
  verifyTokenMiddleware,
  editEmployeeHandler
);
