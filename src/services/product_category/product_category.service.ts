import { product_status } from "@prisma/client";
import { paginationCustomResult } from "../../Others/paginationCustomResult";
import { db } from "../../utils/db.server";
import { setCategoryType } from "../../routes/product_category/product_category";

export const getAllProductCategory = async (
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
    db.product_category.findMany({
      where: {
        ...(status && { isActive: status }),
        ...(vendorId && { vendorId }),
      },
      ...(pagination && {
        skip: (pageNumbers - 1) * resultPerPage,
        take: resultPerPage,
      }),
      omit: {
        createdAt: true,
        updatedAt: true,
      },
      orderBy: {
        createdAt: "desc",
      },
    }),
    pagination
      ? db.product_category.count({
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

//create multiple product category

export const createMultipleProductCategory = async (
  categories: setCategoryType[]
) => {
  return await db.product_category.createMany({
    data: categories,
    skipDuplicates: true,
  });
};

//get single product category

export const getSingleProductCategory = async (
  categoryID: string,
  vendorId: string
) => {
  return await db.product_category.findFirst({
    where: {
      id: categoryID,
      vendorId: vendorId,
    },
  });
};

//update product category

export const updateProductCategory = async (
  categoryID: string,
  categoryData: setCategoryType,
  vendorId: string
) => {
  return await db.product_category.update({
    where: {
      id: categoryID,
      vendorId: vendorId,
    },
    data: categoryData,
  });
};

//delete product category

export const deleteProductCategory = async (
  categoryID: string,
  vendorId: string
) => {
  return await db.product_category.delete({
    where: {
      id: categoryID,
      vendorId: vendorId,
    },
  });
};

//delete multiple product category

export const deleteMultipleProductCategory = async (
  categoryIDs: string[],
  vendorId: string
) => {
  return await db.product_category.deleteMany({
    where: {
      vendorId: vendorId,
      id: {
        in: categoryIDs,
      },
    },
  });
};

//active inactive product category

export const activeInactiveProductCategory = async (
  status: product_status,
  categoryID: string,
  vendorId: string
) => {
  return await db.product_category.update({
    where: {
      id: categoryID,
      vendorId: vendorId,
    },
    data: {
      isActive: status,
    },
  });
};

export const getMultipleProductCategory = async (
  categoryIDs: string[],
  vendorId: string
) => {
  return await db.product_category.findMany({
    where: {
      id: {
        in: categoryIDs,
      },
      vendorId: vendorId,
    },
  });
};

// get all product category name and id list for dropdown
export const getCategoryNameList = async (vendorId: string) => {
  return await db.product_category.findMany({
    where: {
      vendorId: vendorId,
    },
    select: {
      id: true,
      product_category_name: true,
    },
  });
};
