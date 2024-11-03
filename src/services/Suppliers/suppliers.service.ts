import { User_status } from "@prisma/client";
import { generateUniqueID } from "../../Others/OTP/otp";
import { paginationCustomResult } from "../../Others/paginationCustomResult";
import { SupplierBody, supplierQuery } from "../../routes/Suppliers/suppliers";
import { db } from "../../utils/db.server";

//check exist supplier
export const checkSupplier = async ({
  supplierId,
  vendorId,
  supplierName,
}: {
  supplierName?: string;
  vendorId: string;
  supplierId?: string;
}) => {
  // Normalize the supplier name by converting it to lowercase
  const normalizedSupplierName = supplierName && supplierName.toLowerCase();

  // Search for any supplier that has a similar name
  const existingSupplier = await db.supplier.findFirst({
    where: {
      ...(normalizedSupplierName && {
        supplierName: {
          equals: normalizedSupplierName,
          mode: "insensitive", // Case-insensitive search
        },
      }),
      ...(supplierId && { id: supplierId }),
      vendor: {
        some: {
          id: vendorId,
        },
      },
    },
  });

  return existingSupplier;
};

//get all suppliers
export const getAllSuppliers = async ({
  status,
  pageNumber,
  rowPerPage,
  pagination,
  supplierUniqueId,
  vendorId,
}: supplierQuery) => {
  //pagination
  const pageNumbers = pageNumber ? parseInt(pageNumber.toString()) : 1;
  const resultPerPage = rowPerPage ? parseInt(rowPerPage.toString()) : 10;
  const [result, total] = await Promise.all([
    db.supplier.findMany({
      where: {
        ...(status && { isActive: status }),
        ...(supplierUniqueId && { employeeID: supplierUniqueId }),
        vendor: {
          some: {
            id: vendorId,
          },
        },
      },
      orderBy: {
        createdAt: "desc",
      },

      omit: {
        updatedAt: true,
      },
      ...(pagination
        ? {
            take: resultPerPage,
            skip: (pageNumbers - 1) * resultPerPage,
          }
        : {}),
    }),
    pagination
      ? db.supplier.count({
          where: {
            ...(status && { isActive: status }),
            ...(vendorId && {
              vendor: {
                some: {
                  id: vendorId,
                },
              },
            }),
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

export const createSupplier = async ({
  supplierName,
  srName,
  srContactNo,
  srWhatsappNo,
  dealerName,
  dealerContactNo,
  dealerEmail,
  dealerAddress,
  vendorId,
  companyLogo,
  srPhoto,
}: SupplierBody) => {
  return await db.supplier.create({
    data: {
      supplierUniqueId: generateUniqueID("SUP"), // Add this line
      supplierName,
      srName,
      srContactNo,
      srWhatsappNo,
      dealerName,
      dealerContactNo,
      dealerEmail,
      dealerAddress,
      vendor: {
        connect: {
          id: vendorId,
        },
      },
      companyLogo,
      srPhoto,
    },
  });
};

//updateSupplierById
export const updateSupplierById = async ({
  supplierId,
  data,
  vendorId,
}: {
  supplierId: string;
  data: SupplierBody;
  vendorId: string;
}) => {
  return await db.supplier.update({
    where: {
      id: supplierId,
      vendor: {
        some: {
          id: vendorId,
        },
      },
    },
    data: {
      ...data,
    },
  });
};

//updateSupplierStatus
export const updateSupplierStatus = async ({
  supplierId,
  status,
  vendorId,
}: {
  supplierId: string;
  status: User_status;
  vendorId: string;
}) => {
  return await db.supplier.update({
    where: {
      id: supplierId,
      vendor: {
        some: {
          id: vendorId,
        },
      },
    },
    data: {
      isActive: status,
    },
  });
};

//deleteSupplierById
export const deleteSupplierById = async ({
  supplierId,
  vendorId,
}: {
  supplierId: string;
  vendorId: string;
}) => {
  return await db.supplier.delete({
    where: {
      id: supplierId,
      vendor: {
        some: {
          id: vendorId,
        },
      },
    },
  });
};
