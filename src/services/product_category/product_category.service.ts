import { product_status } from "@prisma/client";
import { paginationCustomResult } from "../../Others/paginationCustomResult";
import { db } from "../../utils/db.server";
import { setCategoryType } from "../../routes/product_category/product_category";

export const getAllProductCategory = async (
  pageNumber?: number,
  rowPerPage?: number,
  pagination?: boolean,
  isActive?: product_status
) => {
  //pagination
  const pageNumbers = pageNumber ? parseInt(pageNumber.toString()) : 1;
  const resultPerPage = rowPerPage ? parseInt(rowPerPage.toString()) : 10;
  const [result, total] = await Promise.all([
    db.product_category.findMany({
      where: {
        ...(isActive && { isActive }),
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
            ...(isActive && { isActive }),
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

export const getSingleProductCategory = async (categoryID: string) => {
  return await db.product_category.findFirst({
    where: {
      id: categoryID,
    },
  });
};

//update product category

export const updateProductCategory = async (
  categoryID: string,
  categoryData: setCategoryType
) => {
  return await db.product_category.update({
    where: {
      id: categoryID,
    },
    data: categoryData,
  });
};


//delete product category

export const deleteProductCategory = async (categoryID: string) => {
  return await db.product_category.delete({
    where: {
      id: categoryID,
    },
  });
};


//delete multiple product category

export const deleteMultipleProductCategory = async (categoryIDs: string[]) => {
  return await db.product_category.deleteMany({
    where: {
      id: {
        in: categoryIDs,
      },
    },
  });
};