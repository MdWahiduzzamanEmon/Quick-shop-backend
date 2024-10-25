import express from "express";
import type { Request, Response, NextFunction, RequestHandler } from "express";
import { verifyTokenMiddleware } from "../../Others/JWT";
import errorMessage from "../../Others/ErrorMessage/errorMessage";
import { showResponse } from "../../constant/showResponse";
import {
  activeInactiveProductCategory,
  createMultipleProductCategory,
  deleteMultipleProductCategory,
  deleteProductCategory,
  getAllProductCategory,
  getSingleProductCategory,
  updateProductCategory,
} from "../../services/product_category/product_category.service";
import {
  unlinkFile,
  uploadMiddleware,
} from "../../Others/File/fileUploadController";
import { product_status } from "@prisma/client";

export const product_categoryRoute = express.Router();

// Get all product_category

const getCategoryHandler: RequestHandler = async (
  _req: Request,
  res: Response,
  next: NextFunction
) => {
  try {
    const { pageNumber, rowPerPage, pagination, isActive } = _req.query as any;
    const categories = await getAllProductCategory(
      pageNumber,
      rowPerPage,
      pagination,
      isActive
    );
    showResponse(res, {
      message: "Categories fetched successfully",
      data: categories,
    });
  } catch (error: any) {
    errorMessage(res, error, next);
  }
};

product_categoryRoute.get(
  "/product-category",
  verifyTokenMiddleware,
  getCategoryHandler
);

//get single product category

const getSingleProductCategoryHandler: RequestHandler = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const { categoryID } = req.params;
  try {
    const category = await getSingleProductCategory(categoryID);
    showResponse(res, {
      message: "Category fetched successfully",
      data: category,
    });
  } catch (error: any) {
    errorMessage(res, error, next);
  }
};

product_categoryRoute.get(
  "/product-category/:categoryID",
  verifyTokenMiddleware,
  getSingleProductCategoryHandler
);

//multiple create product category

export type setCategoryType = {
  product_category_name: string;
  description: string;
  image: string;
  order: number;
  isActive: product_status;
};

const createProductCategoryHandler: RequestHandler = async (
  _req: Request,
  res: Response,
  next: NextFunction
) => {
  const reqData = _req as any;
  try {
    const { role } = reqData?.user || {};
    // console.log(reqData?.body);

    if (Object.keys(reqData?.body).length === 0) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Please provide product_categories data",
      });
    }

    const bodyData =
      typeof reqData?.body?.product_categories === "string"
        ? JSON.parse(reqData?.body?.product_categories)
        : reqData?.body;
    // console.log(bodyData);

    const files = reqData?.fileUrl || [];

    const newData: setCategoryType[] = [];

    bodyData?.forEach((category: any, index: number) => {
      newData.push({
        product_category_name: category?.product_category_name,
        description: category?.description,
        ...(files && { image: files[index] }),
        order: index + 1,
        ...(role === "ADMIN" && { isActive: product_status.ACTIVE }),
      });
    });

    const result = await createMultipleProductCategory(newData);

    if (!result) {
      throw new Error("Error creating product categories");
    }

    showResponse(res, {
      message: `${result?.count} product categories created successfully`,
    });
  } catch (error: any) {
    // await unlinkFile(reqData?.fileUrl?.[0]?.filename);
    reqData?.fileUrl.forEach(async (file: any) => {
      await unlinkFile(file?.filename);
    });

    errorMessage(res, error, next);
  }
};

product_categoryRoute.post(
  "/product-category",
  verifyTokenMiddleware,
  uploadMiddleware,
  createProductCategoryHandler
);

//update single product category

const updateProductCategoryHandler: RequestHandler = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const { categoryID } = req.params;
  const reqData = req as any;
  try {
    const bodyData = reqData?.body as setCategoryType;
    const files = reqData?.fileUrl || [];

    // console.log(bodyData);

    if (Object.keys(bodyData)?.length === 0) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Please provide product_categories data",
      });
      return;
    }

    const newData: setCategoryType = {
      product_category_name: bodyData?.product_category_name,
      description: bodyData?.description,
      ...(files && { image: files[0] }),
    };

    const result = await updateProductCategory(categoryID, newData);

    if (!result) {
      throw new Error("Error updating product category");
    }

    showResponse(res, {
      message: "Category updated successfully",
    });
  } catch (error: any) {
    await unlinkFile(reqData?.fileUrl?.[0]?.filename);
    errorMessage(res, error, next);
  }
};

product_categoryRoute.put(
  "/product-category/:categoryID",
  verifyTokenMiddleware,
  uploadMiddleware,
  updateProductCategoryHandler
);

//delete product category

const deleteProductCategoryHandler: RequestHandler = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const reqData = req as any;

  const { categoryID } = req.params;
  try {
    if (reqData?.user?.role !== "ADMIN") {
      showResponse(res, {
        status: 403,
        success: false,
        message: "Unauthorized access.Only Admin can perform this action",
      });
      return;
    }

    const result = await deleteProductCategory(categoryID);

    if (!result) {
      throw new Error("Error deleting product category");
    }

    showResponse(res, {
      message: "Category deleted successfully",
    });
  } catch (error: any) {
    errorMessage(res, error, next);
  }
};

product_categoryRoute.delete(
  "/product-category/:categoryID",
  verifyTokenMiddleware,
  deleteProductCategoryHandler
);

//delete multiple product category

const deleteMultipleProductCategoryHandler: RequestHandler = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const reqData = req as any;
  try {
    if (reqData?.user?.role !== "ADMIN") {
      showResponse(res, {
        status: 403,
        success: false,
        message: "Unauthorized access.Only Admin can perform this action",
      });
      return;
    }

    const ids = reqData?.body?.ids;
    if (!ids || ids.length === 0) {
      throw new Error("Ids must be an array of strings");
    }

    const result = await deleteMultipleProductCategory(ids);

    if (!result) {
      throw new Error("Error deleting product category");
    }

    showResponse(res, {
      message: "Categories deleted successfully",
    });
  } catch (error: any) {
    errorMessage(res, error, next);
  }
};

product_categoryRoute.delete(
  "/product-category",
  verifyTokenMiddleware,
  deleteMultipleProductCategoryHandler
);

//active inactive product category

const activeInactiveProductCategoryHandler: RequestHandler = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const reqData = req as any;
  try {
    if (reqData?.user?.role !== "ADMIN") {
      showResponse(res, {
        status: 403,
        success: false,
        message: "Unauthorized access.Only Admin can perform this action",
      });
      return;
    }

    const { categoryID } = req.params;

    const { status } = reqData?.body as {
      status: product_status;
    };
    if (!status) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Please provide status",
      });
      return;
    }

    if (product_status[status] === undefined) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Invalid status",
      });
      return;
    }

    const result = await activeInactiveProductCategory(status, categoryID);

    if (!result) {
      throw new Error("Error updating product category");
    }

    showResponse(res, {
      message: "Category updated successfully",
    });
  } catch (error: any) {
    errorMessage(res, error, next);
  }
};

product_categoryRoute.put(
  "/product-category/active-inactive/:categoryID",
  verifyTokenMiddleware,
  activeInactiveProductCategoryHandler
);
