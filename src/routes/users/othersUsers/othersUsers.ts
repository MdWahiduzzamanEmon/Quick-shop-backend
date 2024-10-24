import express from "express";
import type { Request, Response, NextFunction } from "express";
import {
  getOthersUsers,
  getSingleCustomerByID,
} from "../../../services/Users/getOthersUsers/getOthersUsers.service";
import { showResponse } from "../../../constant/showResponse";
import { verifyTokenMiddleware } from "../../../Others/JWT";

export const othersUsersRoute = express.Router();

// Get all othersUsers

const getCustomersHandler: express.RequestHandler = async (
  _req: Request,
  res: Response,
  next: NextFunction
) => {
  try {
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

//getSingleCustomerByID

const getSingleCustomerByIDHandler: express.RequestHandler = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  try {
    const { customerID } = req.params;

    const user = await getSingleCustomerByID(customerID);

    if (!user) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Customer not found with this ID",
      });
      return;
    }

    //http cache
    // res.setHeader("Cache-Control", "public, max-age=86400 must-revalidate"); // 1 day

    showResponse(res, {
      message: "User fetched successfully",
      data: user,
    });
  } catch (error: any) {
    next(error);
  }
};

othersUsersRoute.get(
  "/customers/:customerID",
  verifyTokenMiddleware,
  getSingleCustomerByIDHandler
);
