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
  getCategoryNameList,
  getMultipleProductCategory,
  getSingleProductCategory,
  updateProductCategory,
} from "../../services/product_category/product_category.service";
import {
  unlinkFile,
  uploadMiddleware,
} from "../../Others/File/fileUploadController";
import { product_status } from "@prisma/client";
import { generateETag } from "../../Others/OTP/otp";

export const product_categoryRoute = express.Router();

// Get all product_category

const getCategoryHandler: RequestHandler = async (
  _req: Request,
  res: Response,
  next: NextFunction
) => {
  const reqData = _req as any;

  try {
    const { user, vendorId } = reqData;
    if (user?.role !== "ADMIN") {
      showResponse(res, {
        status: 403,
        message: "Forbidden. Only Admin can access this route",
      });
      return;
    }

    const { pageNumber, rowPerPage, pagination, status } = reqData.query as any;

    if (status && !(status in product_status)) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Please provide valid status",
      });
      return;
    }

    const categories = await getAllProductCategory(
      pageNumber,
      rowPerPage,
      pagination,
      status,
      vendorId
    );

    // Generate ETag based on new data and set it in the response
    const etag = generateETag(categories);
    res.setHeader("ETag", `"${etag}"`);

    const ifNoneMatchValue = _req.headers["if-none-match"];

    // Check if the client has the latest data
    if (ifNoneMatchValue === `"${etag}"`) {
      // 304 Not Modified
      res.status(304).end();
      return;
    }

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
  const reqData = req as any;
  const { categoryID } = req.params;
  try {
    const { vendorId } = reqData?.user;
    const category = await getSingleProductCategory(categoryID, vendorId);
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
  vendorId: string;
  createdById: string;
};

const createProductCategoryHandler: RequestHandler = async (
  _req: Request,
  res: Response,
  next: NextFunction
) => {
  const reqData = _req as any;

  try {
    const { role, vendorId: TOKEN_VENDOR_ID, id: userId } = reqData?.user || {};
    // console.log(reqData?.body);

    //if role customer,retailer,or supplier then show 403
    if (role !== "ADMIN" && role !== "OPERATOR") {
      showResponse(res, {
        status: 403,
        success: false,
        message:
          "Forbidden access.You are not authorized to perform this action",
      });

      await reqData?.fileUrl.forEach(async (file: any) => {
        await unlinkFile(file?.publicId);
      });
      return;
    }

    if (Object.keys(reqData?.body).length === 0) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Please provide product_categories data",
      });
      await reqData?.fileUrl.forEach(async (file: any) => {
        await unlinkFile(file?.publicId);
      });
      return;
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
        vendorId: TOKEN_VENDOR_ID,
        createdById: userId,
        ...(role === "ADMIN" && { isActive: product_status.ACTIVE }),
      });
    });

    const result = await createMultipleProductCategory(newData);

    if (!result) {
      throw new Error("Error creating product categories");
    }

    showResponse(res, {
      status: 201,
      message: `${result?.count} product categories created successfully`,
    });
  } catch (error: any) {
    // await unlinkFile(reqData?.fileUrl?.[0]?.filename);
    reqData?.fileUrl.forEach(async (file: any) => {
      await unlinkFile(file?.publicId);
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
  const reqData = req as any;
  const { categoryID } = reqData?.params || {};
  const { vendorId: TOKEN_VENDOR_ID, role } = reqData?.user || {};
  try {
    //if role customer,retailer,or supplier then show 403
    if (role !== "ADMIN" && role !== "OPERATOR") {
      showResponse(res, {
        status: 403,
        success: false,
        message:
          "Forbidden access.You are not authorized to perform this action",
      });
      return;
    }

    const bodyData = reqData?.body as setCategoryType;
    const files = reqData?.fileUrl || [];

    // console.log(bodyData);

    if (Object.keys(bodyData)?.length === 0 && files?.length === 0) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Please provide product_categories data",
      });
      return;
    }

    // first check if category exists
    const existCategory = (await getSingleProductCategory(
      categoryID,
      TOKEN_VENDOR_ID
    )) as any;
    if (!existCategory) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Category not found",
      });
      return;
    }

    const newData: setCategoryType = {
      product_category_name: bodyData?.product_category_name,
      description: bodyData?.description,
      vendorId: TOKEN_VENDOR_ID,
      ...(files && { image: files[0] }),
    };

    const result = await updateProductCategory(
      categoryID,
      newData,
      TOKEN_VENDOR_ID
    );

    if (!result) {
      throw new Error("Error updating product category");
    }

    showResponse(res, {
      message: "Category updated successfully",
    });

    // Delete old image file if it exists
    if (files?.length > 0 && existCategory?.image?.publicId) {
      await unlinkFile(existCategory.image.publicId);
    }
  } catch (error: any) {
    // Attempt to clean up any uploaded files on error
    if (reqData?.fileUrl?.[0]?.publicId) {
      await unlinkFile(reqData.fileUrl[0].publicId);
    }
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
    const { vendorId } = reqData?.user;
    if (reqData?.user?.role !== "ADMIN") {
      showResponse(res, {
        status: 403,
        success: false,
        message: "Unauthorized access.Only Admin can perform this action",
      });
      return;
    }

    //first check if category exists
    const category = (await getSingleProductCategory(
      categoryID,
      vendorId
    )) as any;
    if (!category) {
      throw new Error("Category does not exist");
    }

    const result = await deleteProductCategory(categoryID, vendorId);

    if (!result) {
      throw new Error("Error deleting product category");
    }

    showResponse(res, {
      message: "Category deleted successfully",
    });

    await unlinkFile(category?.image?.publicId);
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
    const { vendorId } = reqData?.user;
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

    //first check if category exists
    const categories = (await getMultipleProductCategory(ids, vendorId)) as any;
    if (categories?.length !== ids?.length) {
      throw new Error("Some categories do not exist");
    }

    const result = await deleteMultipleProductCategory(ids, vendorId);

    if (!result) {
      throw new Error("Error deleting product category");
    }

    showResponse(res, {
      message: "Categories deleted successfully",
    });

    for (const category of categories) {
      await unlinkFile(category?.image?.publicId);
    }
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
    const { vendorId } = reqData?.user;
    if (reqData?.user?.role !== "ADMIN" && reqData?.user?.role !== "OPERATOR") {
      showResponse(res, {
        status: 403,
        success: false,
        message:
          "Forbidden access.you are not authorized to perform this action",
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

    const result = await activeInactiveProductCategory(
      status,
      categoryID,
      vendorId
    );

    if (!result) {
      throw new Error("Error updating product category status");
    }

    showResponse(res, {
      message: "Category updated successfully to " + status,
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

//get product category only name list for dropdown
const getCategoryNameListHandler: RequestHandler = async (
  _req: Request,
  res: Response,
  next: NextFunction
) => {
  const reqData = _req as any;

  try {
    const { user, vendorId } = reqData;
    const { status } = reqData.query as any;
    if (user?.role !== "ADMIN" && user?.role !== "OPERATOR") {
      showResponse(res, {
        status: 403,
        message: "Forbidden. You are not authorized to perform this action",
      });
      return;
    }

    if (status && !(status in product_status)) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Please provide valid status",
      });
      return;
    }
    //set cookie cash for 30 sec
    res.set("Cache-Control", "public, max-age=30,must-revalidate");
    const result = await getCategoryNameList(vendorId, status);
    showResponse(res, {
      message: "Category name list fetched successfully",
      data: result,
    });
  } catch (error: any) {
    errorMessage(res, error, next);
  }
};

product_categoryRoute.get(
  "/product-category/name-list/dropdown",
  verifyTokenMiddleware,
  getCategoryNameListHandler
);
