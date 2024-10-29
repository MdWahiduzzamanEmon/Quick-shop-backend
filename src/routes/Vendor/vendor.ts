import express from "express";
import type { Request, Response, NextFunction, RequestHandler } from "express";
import { verifyTokenMiddleware } from "../../Others/JWT";
import {
  createVendor,
  getSingleVendor,
  getVendors,
} from "../../services/Vendor/vendor.service";
import { showResponse } from "../../constant/showResponse";
import errorMessage from "../../Others/ErrorMessage/errorMessage";
import { ShopStatus } from "@prisma/client";

export const vendorRoute = express.Router();

// Get all vendors

const getVendorsHandler: express.RequestHandler = async (
  _req: Request,
  res: Response,
  next: NextFunction
) => {
  const reqData = _req as any;
  const { user } = reqData;
  try {
    if (user?.role !== "ADMIN") {
      showResponse(res, {
        status: 403,
        success: false,
        message: "Unauthorized access.Only Admin can perform this action",
      });
      return;
    }
    const { status, pageNumber, rowPerPage, pagination, adminUserId } =
      reqData?.query;

    if (status && !(status in ShopStatus)) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Please provide valid status",
      });
      return;
    }

    if (user?.id !== adminUserId) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Not a valid user or admin user id is missing",
      });
      return;
    }

    const vendors = await getVendors({
      status,
      pageNumber,
      rowPerPage,
      pagination,
      adminUserId,
    });
    res.setHeader("Cache-Control", "public, max-age=3600 must-revalidate"); // 1 hour

    showResponse(res, {
      message: "Vendors fetched successfully",
      data: vendors,
    });
  } catch (error: any) {
    errorMessage(res, error, next);
  }
};

vendorRoute.get("/vendors", verifyTokenMiddleware, getVendorsHandler);

// Get single vendor
const getSingleVendorHandler: express.RequestHandler = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const { id } = req.params as { id: string };
  const { user } = req as any;
  try {
    if (user?.role !== "ADMIN") {
      showResponse(res, {
        status: 403, // Forbidden
        success: false,
        message: "Unauthorized access.Only Admin can perform this action",
      });
      return;
    }
    if (typeof id !== "string") {
      throw new Error("id must be a string");
    }

    const vendor = await getSingleVendor({
      id,
    });
    showResponse(res, {
      message: "Vendor fetched successfully",
      data: vendor,
    });
  } catch (error: any) {
    errorMessage(res, error, next);
  }
};

vendorRoute.get("/vendors/:id", verifyTokenMiddleware, getSingleVendorHandler);

// Create vendor

const createVendorHandler: express.RequestHandler = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const reqData = req as any;
  const { user } = reqData;
  try {
    if (user?.role !== "ADMIN") {
      showResponse(res, {
        status: 403,
        success: false,
        message: "Unauthorized access.Only Admin can perform this action",
      });
      return;
    }

    if (Object.keys(reqData?.body).length === 0) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Please provide vendor data",
      });
    }

    const { name, address, phone, adminId } = reqData?.body;

    if (user?.id !== adminId) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Not a valid admin user",
      });
      return;
    }

    // check if vendor already exists
    const vendor = await getSingleVendor({
      name,
    });

    if (vendor) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Vendor already exists",
      });
      return;
    }

    // create vendor
    const body = {
      name,
      address,
      phone,
      adminId,
    };
    const newVendor = await createVendor(body);

    if (!newVendor) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Failed to create vendor",
      });
      return;
    }

    showResponse(res, {
      status: 201,
      message: "Vendor created successfully",
      data: newVendor,
    });
  } catch (error: any) {
    errorMessage(res, error, next);
  }
};

vendorRoute.post("/vendors", verifyTokenMiddleware, createVendorHandler);
