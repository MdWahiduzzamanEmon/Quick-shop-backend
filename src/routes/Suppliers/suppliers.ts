import express from "express";
import type { Request, Response, NextFunction, RequestHandler } from "express";
import { verifyTokenMiddleware } from "../../Others/JWT";
import errorMessage from "../../Others/ErrorMessage/errorMessage";
import { showResponse } from "../../constant/showResponse";
import {
  checkSupplier,
  createSupplier,
  deleteSupplierById,
  getAllSuppliers,
  updateSupplierById,
  updateSupplierStatus,
} from "../../services/Suppliers/suppliers.service";
import {
  unlinkFile,
  uploadMiddleware,
} from "../../Others/File/fileUploadController";
import { emailRegex } from "../../constant";
import { User_status } from "@prisma/client";

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
  "/update-supplier/:id",
  verifyTokenMiddleware,
  uploadMiddleware,
  updateSupplierHandler
);
suppliersRouter.put(
  "/suppliers/active-inactive/:id",
  verifyTokenMiddleware,
  updateSupplierStatusHandler
);
suppliersRouter.delete(
  "/suppliers/:id",
  verifyTokenMiddleware,
  deleteSupplierHandler
);

export type supplierQuery = {
  status?: User_status;
  pageNumber?: number;
  rowPerPage?: number;
  pagination?: boolean;
  supplierUniqueId?: string;
  vendorId: string;
};

async function getAllSuppliersHandler(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const reqData = req as any;
  try {
    const { vendorId, role: TOKEN_ROLE } = reqData?.user;

    if (
      TOKEN_ROLE !== "ADMIN" &&
      TOKEN_ROLE !== "OPERATOR" &&
      TOKEN_ROLE !== "REPRESENTATIVE"
    ) {
      showResponse(res, {
        status: 403,
        message: "Forbidden! You are not authorized to perform this action",
      });
      return;
    }

    const { status, pageNumber, rowPerPage, pagination, supplierUniqueId } =
      reqData?.query as supplierQuery;

    const users = await getAllSuppliers({
      status,
      pageNumber,
      rowPerPage,
      pagination,
      supplierUniqueId,
      vendorId,
    });
    showResponse(res, {
      message: "Suppliers fetched successfully",
      data: users,
    });
  } catch (error: any) {
    errorMessage(res, error, next);
  }
}

//get single supplier
async function getSupplierByIdHandler(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const reqData = req as any;
  try {
    const { id } = req.params as { id: string };
    const { vendorId } = reqData?.user;
    const supplier = await checkSupplier({
      supplierId: id,
      vendorId,
    });
    showResponse(res, {
      message: "Supplier fetched successfully",
      data: supplier,
    });
  } catch (error: any) {
    errorMessage(res, error, next);
  }
}

export type SupplierBody = {
  supplierName: string;
  srName: string;
  srContactNo: string;
  srWhatsappNo: string;
  dealerName: string;
  dealerContactNo: string;
  dealerEmail: string;
  dealerAddress: string;
  vendorId?: string;
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

    const supplierExist = (await checkSupplier({
      supplierName,
      vendorId,
    })) as any;

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
        publicId: reqData?.fileUrl[i]?.publicId,
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
) {
  const reqData = req as any;
  try {
    const { id } = req.params as { id: string };
    const { vendorId, role: TOKEN_ROLE } = reqData?.user;

    //check if user is an admin
    if (TOKEN_ROLE !== "ADMIN") {
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
    } = reqData.body;

    const body: SupplierBody = {
      supplierName,
      srName,
      srContactNo,
      srWhatsappNo,
      dealerName,
      dealerContactNo,
      dealerEmail,
      dealerAddress,
    };

    //email
    if (dealerEmail && !emailRegex.test(dealerEmail)) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Please provide a valid email",
      });
      return;
    }

    //file upload
    if (reqData?.fileUrl?.length) {
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
          return;
        }
        body[reqData?.fileUrl[i]?.fieldName as keyof typeof body] = {
          url: reqData?.fileUrl[i]?.url,
          filename: reqData?.fileUrl[i]?.filename,
          extension: reqData?.fileUrl[i]?.extension,
          size: reqData?.fileUrl[i]?.size,
          publicId: reqData?.fileUrl[i]?.publicId,
        };
      }
    }

    let data = {};
    //only true values are added to the data object
    for (const key in body) {
      if (body[key as keyof SupplierBody]) {
        data = { ...data, [key]: body[key as keyof SupplierBody] };
      }
    }

    const supplier = await updateSupplierById({
      supplierId: id,
      data: data as SupplierBody,
      vendorId,
    });

    if (!supplier) {
      for (let i = 0; i < reqData?.fileUrl?.length; i++) {
        await unlinkFile(reqData?.fileUrl[i]?.publicId as unknown as any);
      }
      showResponse(res, {
        status: 400,
        success: false,
        message: "Failed to update supplier",
      });
      return;
    }

    showResponse(res, {
      status: 200,
      message: "Supplier updated successfully",
    });
  } catch (error: any) {
    await reqData?.fileUrl.forEach(async (file: any) => {
      await unlinkFile(file?.publicId as unknown as any);
    });
    errorMessage(res, error, next);
  }
}

//delete supplier
async function deleteSupplierHandler(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const reqData = req as any;
  try {
    const { id } = req.params as { id: string };
    const { vendorId, role: TOKEN_ROLE } = reqData?.user;

    //check if user is an admin
    if (TOKEN_ROLE !== "ADMIN") {
      showResponse(res, {
        status: 403,
        message: "Forbidden! You are not authorized to perform this action",
      });
      return;
    }

    const existSupplier = (await checkSupplier({
      supplierId: id,
      vendorId,
    })) as any;

    if (!existSupplier) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Supplier does not exist",
      });
      return;
    }

    const supplier = await deleteSupplierById({
      supplierId: id,
      vendorId,
    });

    if (!supplier) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Failed to delete supplier",
      });
      return;
    }

    showResponse(res, {
      status: 200,
      message: "Supplier deleted successfully",
    });

    await unlinkFile(existSupplier?.companyLogo?.publicId as unknown as any);
    await unlinkFile(existSupplier?.srPhoto?.publicId as unknown as any);
  } catch (error: any) {
    errorMessage(res, error, next);
  }
}

//update supplier status
async function updateSupplierStatusHandler(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const reqData = req as any;
  try {
    const { id } = req.params as { id: string };
    const { status } = reqData.body as { status: User_status };
    const { vendorId, role: TOKEN_ROLE } = reqData?.user;

    // console.log("vendorId", reqData.body);
    //check if user is an admin
    if (TOKEN_ROLE !== "ADMIN") {
      showResponse(res, {
        status: 403,
        message: "Forbidden! You are not authorized to perform this action",
      });
      return;
    }

    if (!status) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Please provide status",
      });
      return;
    }

    if (!(status in User_status)) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Please provide a valid status",
      });
      return;
    }

    const supplier = await updateSupplierStatus({
      supplierId: id,
      status,
      vendorId,
    });

    if (!supplier) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Failed to update supplier status",
      });
      return;
    }

    showResponse(res, {
      status: 200,
      message: `Supplier ${status} successfully`,
    });
  } catch (error: any) {
    errorMessage(res, error, next);
  }
}
