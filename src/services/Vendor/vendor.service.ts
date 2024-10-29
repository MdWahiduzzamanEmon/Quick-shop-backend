import { ShopStatus } from "@prisma/client";
import { db } from "../../utils/db.server";
import { paginationCustomResult } from "../../Others/paginationCustomResult";

export const getVendors = async ({
  status,
  pageNumber,
  rowPerPage,
  pagination,
  superAdminId,
}: {
  status?: ShopStatus;
  pageNumber?: number;
  rowPerPage?: number;
  pagination?: boolean;
  superAdminId?: string;
}) => {
  //pagination
  const pageNumbers = pageNumber ? parseInt(pageNumber.toString()) : 1;
  const resultPerPage = rowPerPage ? parseInt(rowPerPage.toString()) : 10;

  const [result, total] = await Promise.all([
    db.vendor.findMany({
      where: {
        ...(status && { isActive: status }),
        ...(superAdminId && {
          superAdminId,
        }),
      },
      include: {
        users: {
          where: {
            admin: {
              role: "ADMIN",
            },
          },
          select: {
            email: true,
            username: true,
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
export const getSingleVendor = async ({
  id,
  name,
}: {
  id?: string;
  name?: string;
}) => {
  return await db.vendor.findFirst({
    where: {
      ...(id && { id }),
      ...(name && { name }),
    },
    include: {
      users: {
        include: {
          worker: {
            select: { role: true },
          },

          otherUsers: {
            select: { role: true },
          },
          admin: {
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

//create vendor

export const createVendor = async ({
  name,
  address,
  phone,
  superAdminId,
  vendor_image,
  vendorAdmin_username,
  vendorAdmin_mobile,
  vendorAdmin_password,
  vendorAdmin_email,
}: {
  name: string;
  address: string;
  phone: string;
  superAdminId: string;
  vendor_image: any;
  vendorAdmin_username: string;
  vendorAdmin_mobile: string;
  vendorAdmin_password: string;
  vendorAdmin_email: string;
}) => {
  const vendorData = await db.vendor.create({
    data: {
      name,
      address,
      phone,
      ...(vendor_image && { vendor_image }),
      superAdminId,
    },
  });

  new Promise(async (resolve) => {
    resolve(
      await db.user.create({
        data: {
          username: vendorAdmin_username,
          mobile: vendorAdmin_mobile,
          password: vendorAdmin_password,
          email: vendorAdmin_email,
          vendorId: vendorData?.id,
          admin: {
            create: {
              role: "ADMIN",
            },
          },
        },
      })
    );
  });

  return vendorData;
};
