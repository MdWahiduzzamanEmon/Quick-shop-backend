import { product_status } from "@prisma/client";
import { db } from "../../utils/db.server";
import { paginationCustomResult } from "../../Others/paginationCustomResult";
import { CREATE_PRODUCT_TYPE } from "../../routes/Products/products";

export const getAllProducts = async (
  pageNumber?: number,
  rowPerPage?: number,
  pagination?: boolean,
  status?: product_status,
  vendorId?: string
) => {
  //pagination
  const pageNumbers = pageNumber ? parseInt(pageNumber.toString()) : 1;
  const resultPerPage = rowPerPage ? parseInt(rowPerPage.toString()) : 10;
  const [result, total] = await Promise.all([
    db.product.findMany({
      where: {
        ...(status && { isActive: status }),
        ...(vendorId && { vendorId }),
      },
      ...(pagination && {
        skip: (pageNumbers - 1) * resultPerPage,
        take: resultPerPage,
      }),
      omit: {
        categoryId: true,
        createdById: true,
        createdAt: true,
        updatedAt: true,
      },
      include: {
        product_category: {
          select: {
            id: true,
            product_category_name: true,
          },
        },
        createdBy: {
          select: {
            id: true,
            email: true,
            mobile: true,
            username: true,
          },
        },
        product_images: {
          select: {
            id: true,
            image: true,
            isActive: true,
          },
        },
      },
      orderBy: {
        createdAt: "desc",
      },
    }),
    pagination
      ? db.product.count({
          where: {
            ...(status && { isActive: status }),
            ...(vendorId && { vendorId }),
          },
        })
      : Promise.resolve(0),
  ]);

  if (!pagination) return result;

  const res = paginationCustomResult({
    pageNumbers,
    resultPerPage,
    result,
    totalResultCount: total,
  });

  return res;
};

//getSingleProduct
export const getSingleProduct = async (
  productId: string,
  vendorId?: string
) => {
  const product = await db.product.findUnique({
    where: {
      id: productId,
      vendorId,
    },
    omit: {
      categoryId: true,
      createdById: true,
      createdAt: true,
      updatedAt: true,
    },
    include: {
      product_category: {
        select: {
          id: true,
          product_category_name: true,
        },
      },
      createdBy: {
        select: {
          id: true,
          email: true,
          mobile: true,
          username: true,
        },
      },
      product_images: {
        select: {
          id: true,
          image: true,
          isActive: true,
        },
      },
    },
  });

  return product;
};

//createProduct

export const createProduct = async ({
  product_name,
  description,
  product_quantity,
  delivery_charge,
  vendorId,
  product_category_id,
  createdById,
  product_images,
}: CREATE_PRODUCT_TYPE) => {
  const product = await db.product.create({
    data: {
      product_name,
      description,
      product_quantity_type: product_quantity,
      delivery_charge_type: delivery_charge,
      vendorId,
      categoryId: product_category_id,
      createdById,
      ...(product_images && {
        product_images: {
          createMany: {
            data: product_images,
          },
        },
      }),
    },
  });

  return product;
};

//getMultipleProducts
export const getMultipleProducts = async (
  productIds: string[],
  vendorId?: string
) => {
  const products = await db.product.findMany({
    where: {
      id: {
        in: productIds,
      },
      vendorId,
    },
    omit: {
      categoryId: true,
      createdById: true,
      createdAt: true,
      updatedAt: true,
    },
    include: {
      product_images: {
        select: {
          image: true,
        },
      },
    },
  });
  return products;
};

//editProduct

export const editProduct = async (
  productId: string,
  vendorId: string,
  productData: CREATE_PRODUCT_TYPE
) => {
  const product = await db.product.update({
    where: {
      id: productId,
      vendorId,
    },
    data: {
      product_name: productData.product_name,
      description: productData.description,
      product_quantity_type: productData.product_quantity,
      delivery_charge_type: productData.delivery_charge,
      categoryId: productData.product_category_id,
      ...(productData.product_images && {
        product_images: {
          createMany: {
            data: productData.product_images,
          },
        },
      }),
    },
  });

  return product;
};

// activeInactiveProduct
export const activeInactiveProduct = async (
  status: product_status,
  productId: string,
  vendorId: string
) => {
  const product = await db.product.update({
    where: {
      id: productId,
      vendorId,
    },
    data: {
      isActive: status,
    },
  });

  return product;
};

//deleteSingleProduct

export const deleteSingleProduct = async (
  productId: string,
  vendorId: string
) => {
  const product = await db.product.delete({
    where: {
      id: productId,
      vendorId,
    },
  });

  return product;
};

//deleteMultipleProduct
export const deleteMultipleProduct = async (
  product_ids: string[],
  vendorId: string
) => {
  const product = await db.product.deleteMany({
    where: {
      id: {
        in: product_ids,
      },
      vendorId,
    },
  });

  return product;
};

// =============================================== product images ===============================================
//getProductImages

export const getProductImages = async (productId: string, vendorId: string) => {
  const images = await db.product_image.findMany({
    where: {
      productId,
      product: {
        vendorId,
      },
    },
  });

  return images;
};
//get product image product_image_id
export const getSingleProductImage = async (
  product_image_id: string,
  vendorId: string
) => {
  const product = await db.product_image.findFirst({
    where: {
      id: product_image_id,
      product: {
        vendorId,
      },
    },
  });

  return product;
};

//getMultipleProductImages

export const getMultipleProductImages = async (
  product_image_ids: string[],
  vendorId: string
) => {
  const product = await db.product_image.findMany({
    where: {
      id: {
        in: product_image_ids,
      },
      product: {
        vendorId,
      },
    },
  });

  return product;
};

//deleteProductImages
export const deleteProductImages = async (
  product_image_id: string,
  vendorId: string
) => {
  const product = await db.product_image.delete({
    where: {
      id: product_image_id,
      product: {
        vendorId,
      },
    },
  });

  return product;
};

//delete multiple product images
export const deleteMultipleProductImages = async (
  product_image_ids: string[],
  vendorId: string
) => {
  const product = await db.product_image.deleteMany({
    where: {
      id: {
        in: product_image_ids,
      },
      product: {
        vendorId,
      },
    },
  });

  return product;
};