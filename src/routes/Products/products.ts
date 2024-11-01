import express from "express";
import type { Request, Response, NextFunction, RequestHandler } from "express";
import { verifyTokenMiddleware } from "../../Others/JWT";
import errorMessage from "../../Others/ErrorMessage/errorMessage";
import { showResponse } from "../../constant/showResponse";
import {
  delivery_charge_type,
  product_quantity_type,
  product_status,
} from "@prisma/client";
import {
  activeInactiveProduct,
  activeInactiveProductImage,
  createProduct,
  createProductImage,
  deleteMultipleProduct,
  deleteMultipleProductImages,
  deleteProductImages,
  deleteSingleProduct,
  editProduct,
  getAllProducts,
  getMultipleProductImages,
  getMultipleProducts,
  getProductImages,
  getSingleProduct,
  getSingleProductImage,
} from "../../services/Products/products.service";
import {
  unlinkFile,
  uploadMiddleware,
} from "../../Others/File/fileUploadController";
import { client } from "../../server";
import { generateETag } from "../../Others/OTP/otp";

export const productsRouter = express.Router();

//get all products handler

const getAllProductsHandler: RequestHandler = async (
  req: Request,
  res: Response,
  next: NextFunction
): Promise<void> => {
  const reqData = req as any;
  try {
    const { user, vendorId } = reqData;
    if (user?.role !== "ADMIN" && user?.role !== "OPERATOR") {
      showResponse(res, {
        status: 403,
        message: "Forbidden. Only Admin can access this route",
      });
      return;
    }
    const {
      pageNumber = 1,
      rowPerPage = 10,
      pagination,
      status,
      product_code,
    } = reqData.query as any;

    if (status && !(status in product_status)) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Please provide valid status",
      });
      return;
    }

    // Construct Redis cache key dynamically based on parameters in use
    const cacheKeyComponents = [
      `products:${vendorId}`,
      `page:${pageNumber}`,
      `rows:${rowPerPage}`,
    ];
    if (status) cacheKeyComponents.push(`status:${status}`);
    if (product_code) cacheKeyComponents.push(`product_code:${product_code}`);
    const cacheKey = cacheKeyComponents.join(":");

    // Check Redis cache
    const cachedProducts = await client.get(cacheKey);
    if (cachedProducts) {
      const parsedProducts = JSON.parse(cachedProducts);

      // Generate ETag based on cached data
      const etag = generateETag(parsedProducts);

      // Check if client's ETag matches the current ETag
      if (req.headers["if-none-match"] === etag) {
        res.status(304).end(); // Not Modified
        return;
      }

      // Set ETag header and respond with cached data
      res.set("ETag", etag);
      showResponse(res, {
        message: "Products fetched successfully from cache",
        data: parsedProducts,
      });
      return;
    }

    const products = await getAllProducts(
      pageNumber,
      rowPerPage,
      pagination,
      status,
      vendorId,
      product_code
    );

    // Set cache
    await client.set(cacheKey, JSON.stringify(products), "EX", 60); // Cache for 60 seconds
    // Generate ETag based on new data and set it in the response
    const etag = generateETag(products);
    res.set("ETag", etag);

    showResponse(res, {
      message: "Products fetched successfully",
      data: products,
    });
  } catch (error: any) {
    errorMessage(res, error, next);
  }
};

productsRouter.get("/products", verifyTokenMiddleware, getAllProductsHandler);

//get single product handler

const getSingleProductHandler: RequestHandler = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const reqData = req as any;
  try {
    const { id } = req.params as { id: string };
    const { vendorId } = reqData?.user;
    const { product_code } = reqData.query as any;
    const product = await getSingleProduct(id, vendorId, product_code);
    showResponse(res, {
      message: "Single Product fetched successfully",
      data: product,
    });
  } catch (error: any) {
    errorMessage(res, error, next);
  }
};

productsRouter.get(
  "/products/:id",
  verifyTokenMiddleware,
  getSingleProductHandler
);

//create product category

export type CREATE_PRODUCT_TYPE = {
  product_name: string;
  description?: string;
  product_quantity: product_quantity_type;
  delivery_charge: delivery_charge_type;
  vendorId: string;
  product_category_id: string;
  createdById: string;
  product_images?: {
    image: any;
  }[];
};

const createProductHandler: RequestHandler = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const reqData = req as any;
  try {
    const { role, vendorId, id: USER_ID } = reqData?.user;
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
        message: "Please provide product details",
      });
      await reqData?.fileUrl.forEach(async (file: any) => {
        await unlinkFile(file?.publicId);
      });
      return;
    }

    const {
      product_name,
      description,
      product_quantity,
      delivery_charge,
      product_category_id,
    } = req.body;

    if (!product_category_id) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Please provide product category id",
      });
      await reqData?.fileUrl.forEach(async (file: any) => {
        await unlinkFile(file?.publicId);
      });
      return;
    }

    if (!(product_quantity in product_quantity_type)) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Please provide valid product quantity type",
      });
      await reqData?.fileUrl.forEach(async (file: any) => {
        await unlinkFile(file?.publicId);
      });
      return;
    }

    if (!(delivery_charge in delivery_charge_type)) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Please provide valid delivery charge type",
      });
      await reqData?.fileUrl.forEach(async (file: any) => {
        await unlinkFile(file?.publicId);
      });
      return;
    }

    const body: CREATE_PRODUCT_TYPE = {
      product_name,
      description,
      product_quantity,
      delivery_charge,
      vendorId: vendorId,
      product_category_id,
      createdById: USER_ID,
    };

    const { fileUrl } = reqData || {};
    if (fileUrl?.length > 0) {
      body.product_images = fileUrl.map((file: any) => {
        return { image: file };
      });
    }

    await createProduct(body);
    showResponse(res, {
      status: 201,
      message: "Product created successfully",
    });

    return;
  } catch (error: any) {
    await reqData?.fileUrl.forEach(async (file: any) => {
      await unlinkFile(file?.publicId);
    });
    errorMessage(res, error, next);
  }
};

productsRouter.post(
  "/products",
  verifyTokenMiddleware,
  uploadMiddleware,
  createProductHandler
);

//edit product

const editProductHandler: RequestHandler = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const reqData = req as any;
  try {
    const { id: productId } = req.params as { id: string };

    const { role, vendorId, id: USER_ID } = reqData?.user;
    if (role !== "ADMIN" && role !== "OPERATOR") {
      showResponse(res, {
        status: 403,
        message:
          "Forbidden access.You are not authorized to perform this action",
      });
      return;
    }

    const {
      product_name,
      description,
      product_quantity,
      delivery_charge,
      product_category_id,
    } = req.body;

    const { fileUrl } = reqData || {};

    if (!product_category_id) {
      showResponse(res, {
        status: 400,
        message: "Please provide product category id",
      });
      if (fileUrl?.length > 0) {
        await fileUrl.forEach(async (file: any) => {
          await unlinkFile(file?.publicId);
        });
      }
      return;
    }

    if (product_quantity && !(product_quantity in product_quantity_type)) {
      showResponse(res, {
        status: 400,
        message: "Please provide valid product quantity type",
      });
      if (fileUrl?.length > 0) {
        await fileUrl.forEach(async (file: any) => {
          await unlinkFile(file?.publicId);
        });
      }
      return;
    }

    if (delivery_charge && !(delivery_charge in delivery_charge_type)) {
      showResponse(res, {
        status: 400,
        message: "Please provide valid delivery charge type",
      });
      if (fileUrl?.length > 0) {
        await fileUrl.forEach(async (file: any) => {
          await unlinkFile(file?.publicId);
        });
      }
      return;
    }

    // first check if product exists
    const existProduct = (await getSingleProduct(productId, vendorId)) as any;
    if (!existProduct) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Product not found",
      });
      return;
    }

    const body: CREATE_PRODUCT_TYPE = {
      product_name,
      description,
      product_quantity,
      delivery_charge,
      vendorId: vendorId,
      product_category_id,
      createdById: USER_ID,
    };

    if (fileUrl?.length > 0) {
      body.product_images = fileUrl.map((file: any) => {
        return { image: file };
      });
    }

    const product = await editProduct(productId, vendorId, body);

    if (!product) {
      showResponse(res, {
        status: 404,
        message: "Product not found",
      });
      if (fileUrl?.length > 0) {
        await fileUrl.forEach(async (file: any) => {
          await unlinkFile(file?.publicId);
        });
      }
      return;
    }

    showResponse(res, {
      message: "Product updated successfully",
    });

    if (fileUrl?.length > 0 && existProduct?.product_images?.length > 0) {
      await existProduct?.product_images.forEach(async (image: any) => {
        if (image?.image?.publicId) {
          await unlinkFile(image?.image?.publicId);
        }
      });
    }
  } catch (error: any) {
    if (reqData?.fileUrl?.length > 0) {
      await reqData?.fileUrl.forEach(async (file: any) => {
        await unlinkFile(file?.publicId);
      });
    }
    errorMessage(res, error, next);
  }
};

productsRouter.put(
  "/products/:id",
  verifyTokenMiddleware,
  uploadMiddleware,
  editProductHandler
);

//active inactive product category

const activeInactiveProductHandler: RequestHandler = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const reqData = req as any;
  try {
    const { vendorId, id: USER_ID } = reqData?.user;
    if (reqData?.user?.role !== "ADMIN" && reqData?.user?.role !== "OPERATOR") {
      showResponse(res, {
        status: 403,
        success: false,
        message:
          "Forbidden access.you are not authorized to perform this action",
      });
      return;
    }

    const { productID } = req.params;

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

    const result = await activeInactiveProduct(status, productID, vendorId);

    if (!result) {
      throw new Error("Error updating product status");
    }

    showResponse(res, {
      message: "Product updated successfully to " + status,
    });

    return;
  } catch (error: any) {
    errorMessage(res, error, next);
  }
};

productsRouter.put(
  "/products/active-inactive/:productID",
  verifyTokenMiddleware,
  activeInactiveProductHandler
);

//delete product
const deleteProductHandler: RequestHandler = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const reqData = req as any;
  try {
    const { vendorId, id: USER_ID } = reqData?.user;
    if (reqData?.user?.role !== "ADMIN" && reqData?.user?.role !== "OPERATOR") {
      showResponse(res, {
        status: 403,
        success: false,
        message:
          "Forbidden access.you are not authorized to perform this action",
      });
      return;
    }
    const { productID } = req.params;

    // first check if product exists
    const existProduct = (await getSingleProduct(productID, vendorId)) as any;
    if (!existProduct) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Product not found",
      });
      return;
    }

    const product = await deleteSingleProduct(productID, vendorId);
    if (!product) {
      showResponse(res, {
        status: 404,
        message: "Product not found",
      });
      return;
    }
    showResponse(res, {
      message: "Product deleted successfully",
    });

    if (existProduct?.product_images?.length > 0) {
      await existProduct?.product_images.forEach(async (image: any) => {
        if (image?.image?.publicId) {
          await unlinkFile(image?.image?.publicId);
        }
      });
    }
  } catch (error: any) {
    errorMessage(res, error, next);
  }
};

productsRouter.delete(
  "/products/single/:productID",
  verifyTokenMiddleware,
  deleteProductHandler
);

//delete Multiple Product

const deleteMultipleProductHandler: RequestHandler = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const reqData = req as any;
  try {
    const { vendorId } = reqData?.user;

    // Authorization check
    if (reqData?.user?.role !== "ADMIN" && reqData?.user?.role !== "OPERATOR") {
      showResponse(res, {
        status: 403,
        success: false,
        message:
          "Forbidden access.you are not authorized to perform this action",
      });
      return;
    }

    // Validate input
    const { ids: productIDs } = reqData?.body as {
      ids: string[];
    };
    if (!productIDs || productIDs?.length === 0) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Please provide product IDs in array",
      });
      return;
    }

    //first check if product exists
    const products = (await getMultipleProducts(productIDs, vendorId)) as any;
    if (products?.length !== productIDs?.length) {
      showResponse(res, {
        status: 404,
        success: false,
        message: "Some products not found",
      });
      return;
    }

    // Delete products
    const result = await deleteMultipleProduct(productIDs, vendorId);
    if (!result) {
      showResponse(res, {
        status: 404,
        message: "Products not found",
      });
      return;
    }

    // Response
    showResponse(res, {
      message: "Products deleted successfully",
    });

    // Remove associated images
    await Promise.all(
      products.map(async (product: any) => {
        if (product?.product_images?.length > 0) {
          await Promise.all(
            product.product_images.map(async (image: any) => {
              if (image?.image?.publicId) {
                await unlinkFile(image.image.publicId);
              }
            })
          );
        }
      })
    );
  } catch (error: any) {
    errorMessage(res, error, next);
  }
};

productsRouter.delete(
  "/products/multiple-delete/",
  verifyTokenMiddleware,
  deleteMultipleProductHandler
);

// ====================== ====================== product images ====================== ======================
//gte product images by product id

const getProductImagesByProductIdHandler: RequestHandler = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const reqData = req as any;
  try {
    const { id } = req.params as { id: string };
    const { vendorId } = reqData?.user;
    const product = await getProductImages(id, vendorId);
    showResponse(res, {
      message: "Product images fetched successfully",
      data: product,
    });
  } catch (error: any) {
    errorMessage(res, error, next);
  }
};

productsRouter.get(
  "/products/images/:id",
  verifyTokenMiddleware,
  getProductImagesByProductIdHandler
);

//delete product images by product id

const deleteProductImagesByProductIdHandler: RequestHandler = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const reqData = req as any;
  try {
    const { id: product_image_id } = req.params as { id: string };
    const { vendorId, role } = reqData?.user;

    if (role !== "ADMIN" && role !== "OPERATOR") {
      showResponse(res, {
        status: 403,
        success: false,
        message:
          "Forbidden access.You are not authorized to perform this action",
      });
      return;
    }

    const isExist = (await getSingleProductImage(
      product_image_id,
      vendorId
    )) as any;

    if (!isExist) {
      showResponse(res, {
        status: 404,
        message: "Product image not found",
      });
      return;
    }

    await deleteProductImages(product_image_id, vendorId);
    showResponse(res, {
      message: "Product image deleted successfully",
    });
    //delete image from cloudinary
    if (isExist?.image?.publicId) {
      await unlinkFile(isExist?.image?.publicId);
    }
  } catch (error: any) {
    errorMessage(res, error, next);
  }
};

productsRouter.delete(
  "/products/single-image/:id",
  verifyTokenMiddleware,
  deleteProductImagesByProductIdHandler
);

//deleteMultipleProductImages

const deleteMultipleProductImagesHandler: RequestHandler = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const reqData = req as any;
  try {
    const { ids: product_image_ids } = req.body;
    const { vendorId, role } = reqData?.user;

    if (role !== "ADMIN" && role !== "OPERATOR") {
      showResponse(res, {
        status: 403,
        success: false,
        message:
          "Forbidden access.You are not authorized to perform this action",
      });
      return;
    }

    if (!product_image_ids) {
      showResponse(res, {
        status: 400,
        message: "Please provide product image ids",
      });
      return;
    }

    //check is array
    if (!Array.isArray(product_image_ids)) {
      showResponse(res, {
        status: 400,
        message: "Please provide product image ids in array",
      });
      return;
    }

    const isExist = (await getMultipleProductImages(
      product_image_ids,
      vendorId
    )) as any;

    if (!isExist) {
      showResponse(res, {
        status: 404,
        message: "Product images not found",
      });
      return;
    }

    if (isExist.length !== product_image_ids.length) {
      showResponse(res, {
        status: 404,
        message: "Some product images not found",
      });
      return;
    }

    await deleteMultipleProductImages(product_image_ids, vendorId);
    showResponse(res, {
      message: "Product images deleted successfully",
    });

    //delete image from cloudinary
    if (isExist?.length > 0) {
      await isExist.forEach(async (image: any) => {
        if (image?.image?.publicId) {
          await unlinkFile(image?.image?.publicId);
        }
      });
    }
    return;
  } catch (error: any) {
    errorMessage(res, error, next);
  }
};

productsRouter.delete(
  "/products/multiple-images",
  verifyTokenMiddleware,
  deleteMultipleProductImagesHandler
);

//product image active inactive

const activeInactiveProductImageHandler: RequestHandler = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const reqData = req as any;
  try {
    const { role, vendorId } = reqData?.user;

    if (role !== "ADMIN" && role !== "OPERATOR") {
      showResponse(res, {
        status: 403,
        success: false,
        message:
          "Forbidden access.You are not authorized to perform this action",
      });
      return;
    }
    const { product_image_id } = req.params as { product_image_id: string };
    const { status } = reqData?.body as {
      status: product_status;
    };
    if (!status && !(status in product_status)) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Please provide valid status ",
      });
      return;
    }
    const isExist = (await getSingleProductImage(
      product_image_id,
      vendorId
    )) as any;
    if (!isExist) {
      showResponse(res, {
        status: 404,
        success: false,
        message: "Product image not found",
      });
      return;
    }
    await activeInactiveProductImage(status, product_image_id, vendorId);
    showResponse(res, {
      success: true,
      message: "Product image status updated successfully",
    });
  } catch (error: any) {
    errorMessage(res, error, next);
  }
};

productsRouter.put(
  "/products/image-status/:product_image_id",
  verifyTokenMiddleware,
  activeInactiveProductImageHandler
);

//create product image by product id

const createProductImageHandler: RequestHandler = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const reqData = req as any;
  try {
    const { role, vendorId } = reqData?.user;
    if (role !== "ADMIN" && role !== "OPERATOR") {
      showResponse(res, {
        status: 403,
        success: false,
        message:
          "Forbidden access.You are not authorized to perform this action",
      });
      return;
    }
    const { product_id } = req.params as { product_id: string };
    if (!product_id) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Please provide product id",
      });
      return;
    }
    const isExist = (await getSingleProduct(product_id, vendorId)) as any;
    if (!isExist) {
      showResponse(res, {
        status: 404,
        success: false,
        message: "Product not found",
      });
      return;
    }

    const { fileUrl } = reqData || {};
    const body = {
      images: fileUrl,
    };

    console.log("body", body);
    const image = await createProductImage(product_id, body);

    if (image?.length === 0) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Product image not created",
      });

      await reqData?.fileUrl.forEach(async (file: any) => {
        await unlinkFile(file?.publicId);
      });
      return;
    }

    showResponse(res, {
      success: true,
      status: 201,
      message: "Product image created successfully",
      data: image,
    });

    return;
  } catch (error: any) {
    await reqData?.fileUrl.forEach(async (file: any) => {
      await unlinkFile(file?.publicId);
    });

    errorMessage(res, error, next);
  }
};

productsRouter.post(
  "/products/create-image/:product_id",
  verifyTokenMiddleware,
  uploadMiddleware,
  createProductImageHandler
);
