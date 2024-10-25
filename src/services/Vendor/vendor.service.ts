import { ShopStatus } from "@prisma/client";
import { db } from "../../utils/db.server";
import { paginationCustomResult } from "../../Others/paginationCustomResult";

export const getVendors = async ({
  status,
  pageNumber,
  rowPerPage,
  pagination,
}: {
  status?: ShopStatus;
  pageNumber?: number;
  rowPerPage?: number;
  pagination?: boolean;
}) => {
  //pagination
  const pageNumbers = pageNumber ? parseInt(pageNumber.toString()) : 1;
  const resultPerPage = rowPerPage ? parseInt(rowPerPage.toString()) : 10;

  const [result, total] = await Promise.all([
    db.vendor.findMany({
      where: {
        ...(status && { isActive: status }),
      },
      include: {
        users: {
          include: {
            worker: {
              select: { role: true },
            },
            admin: {
              select: { role: true },
            },
            otherUsers: {
              select: { role: true },
            },
          },
          omit: {
            createdAt: true,
            updatedAt: true,
            password: true,
          },
        },
      },
      ...(pagination
        ? {
            take: resultPerPage,
            skip: (pageNumbers - 1) * resultPerPage,
          }
        : {}),
    }),
    pagination
      ? db.vendor.count({
          where: {
            ...(status && { isActive: status }),
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

//getSingleVendor
export const getSingleVendor = async (id: string) => {
  return await db.vendor.findFirst({
    where: {
      id,
    },
    include: {
      users: {
        include: {
          worker: {
            select: { role: true },
          },
          admin: {
            select: { role: true },
          },
          otherUsers: {
            select: { role: true },
          },
        },
        omit: {
          createdAt: true,
          updatedAt: true,
          password: true,
        },
      },
    },
  });
};
