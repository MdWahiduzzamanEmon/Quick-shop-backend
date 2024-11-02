import express from "express";
import type { Request, Response, NextFunction, RequestHandler } from "express";
import { verifyTokenMiddleware } from "../../Others/JWT";
import errorMessage from "../../Others/ErrorMessage/errorMessage";
import { showResponse } from "../../constant/showResponse";
import {
  checkSupplier,
  createSupplier,
} from "../../services/Suppliers/suppliers.service";
import {
  unlinkFile,
  uploadMiddleware,
} from "../../Others/File/fileUploadController";
import { emailRegex } from "../../constant";

export const suppliersRouter = express.Router();

suppliersRouter.get(
  "/suppliers",
  verifyTokenMiddleware,
  getAllSuppliersHandler
);
suppliersRouter.get(
  "/suppliers/:id",
  verifyTokenMiddleware,
  getSupplierByIdHandler
);
suppliersRouter.post(
  "/create-supplier",
  verifyTokenMiddleware,
  uploadMiddleware,
  createSupplierHandler
);
suppliersRouter.put(
  "/suppliers/:id",
  verifyTokenMiddleware,
  updateSupplierHandler
);
suppliersRouter.delete(
  "/suppliers/:id",
  verifyTokenMiddleware,
  deleteSupplierHandler
);

function getAllSuppliersHandler(
  req: Request,
  res: Response,
  next: NextFunction
) {}

//get single supplier
async function getSupplierByIdHandler(
  req: Request,
  res: Response,
  next: NextFunction
) {}

export type SupplierBody = {
  supplierName: string;
  srName: string;
  srContactNo: string;
  srWhatsappNo: string;
  dealerName: string;
  dealerContactNo: string;
  dealerEmail: string;
  dealerAddress: string;
  vendorId: string;
  companyLogo?: any;
  srPhoto?: any;
};
//create supplier
async function createSupplierHandler(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const reqData = req as any;
  try {
    const { vendorId: TOKEN_VENDOR_ID, role } = reqData?.user;

    //check if user is an admin
    if (role !== "ADMIN") {
      showResponse(res, {
        status: 403,
        message: "Forbidden! You are not authorized to perform this action",
      });
      return;
    }

    const {
      supplierName,
      srName,
      dealerName,
      srContactNo,
      srWhatsappNo,
      dealerContactNo,
      dealerEmail,
      dealerAddress,
      vendorId,
    } = reqData.body;

    if (
      !supplierName ||
      !srName ||
      !dealerName ||
      !srContactNo ||
      !srWhatsappNo ||
      !dealerContactNo ||
      !dealerEmail ||
      !dealerAddress ||
      !vendorId
    ) {
      showResponse(res, {
        status: 400,
        message: "All fields are required",
        requiredFields: [
          "supplierName",
          "srName",
          "dealerName",
          "srContactNo",
          "srWhatsappNo",
          "dealerContactNo",
          "dealerEmail",
          "dealerAddress",
          "vendorId",
        ],
      });
      for (let i = 0; i < reqData?.fileUrl?.length; i++) {
        await unlinkFile(reqData?.fileUrl[i]?.publicId as unknown as any);
      }
      return;
    }

    if (!vendorId) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Please provide vendor id",
      });
      return;
    }

    if (TOKEN_VENDOR_ID !== vendorId) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Please provide valid vendor id",
      });
      return;
    }

    //email
    if (dealerEmail && !emailRegex.test(dealerEmail)) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Please provide a valid email",
      });
      return;
    }

    const body: SupplierBody = {
      supplierName,
      srName,
      srContactNo,
      srWhatsappNo,
      dealerName,
      dealerContactNo,
      dealerEmail,
      dealerAddress,
      vendorId,
    };

    const supplierExist = (await checkSupplier(supplierName)) as any;

    if (supplierExist) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Supplier already exists",
      });
      for (let i = 0; i < reqData?.fileUrl?.length; i++) {
        await unlinkFile(reqData?.fileUrl[i]?.publicId as unknown as any);
      }
      return;
    }

    for (let i = 0; i < reqData?.fileUrl?.length; i++) {
      if (
        reqData?.fileUrl[i]?.fieldName !== "companyLogo" &&
        reqData?.fileUrl[i]?.fieldName !== "srPhoto"
      ) {
        showResponse(res, {
          status: 400,
          success: false,
          message: "Please provide valid file field name",
        });
        for (let i = 0; i < reqData?.fileUrl?.length; i++) {
          await unlinkFile(reqData?.fileUrl[i]?.publicId as unknown as any);
        }
        return;
      }

      body[reqData?.fileUrl[i]?.fieldName as keyof typeof body] = {
        url: reqData?.fileUrl[i]?.url,
        filename: reqData?.fileUrl[i]?.filename,
        extension: reqData?.fileUrl[i]?.extension,
        size: reqData?.fileUrl[i]?.size,
      };
    }

    const supplier = await createSupplier(body);
    if (!supplier) {
      for (let i = 0; i < reqData?.fileUrl?.length; i++) {
        await unlinkFile(reqData?.fileUrl[i]?.publicId as unknown as any);
      }
      showResponse(res, {
        status: 400,
        success: false,
        message: "Failed to create supplier",
      });
      return;
    }

    showResponse(res, {
      status: 201,
      message: "Supplier created successfully",
    });
  } catch (error: any) {
    errorMessage(res, error, next);

    for (let i = 0; i < reqData?.fileUrl?.length; i++) {
      await unlinkFile(reqData?.fileUrl[i]?.publicId as unknown as any);
    }
  }
}

//update supplier
async function updateSupplierHandler(
  req: Request,
  res: Response,
  next: NextFunction
) {}

//delete supplier
async function deleteSupplierHandler(
  req: Request,
  res: Response,
  next: NextFunction
) {}
