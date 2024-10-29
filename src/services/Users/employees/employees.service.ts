import { User_status } from "@prisma/client";
import { db } from "../../../utils/db.server";
import { paginationCustomResult } from "../../../Others/paginationCustomResult";
import { EmployeeQuery } from "../../../routes/users/employees/employees";

export const getEmployees = async ({
  status,
  pageNumber,
  rowPerPage,
  pagination,
  employeeUniqueID,
  vendorId,
}: EmployeeQuery) => {
  //pagination
  const pageNumbers = pageNumber ? parseInt(pageNumber.toString()) : 1;
  const resultPerPage = rowPerPage ? parseInt(rowPerPage.toString()) : 10;

  const [result, total] = await Promise.all([
    db.worker.findMany({
      where: {
        ...(status && { isActive: status }),
        ...(employeeUniqueID && { employeeID: employeeUniqueID }),
        ...(vendorId && {
          user: {
            vendorId,
          },
        }),
      },
      include: {
        user: {
          select: {
            username: true,
            mobile: true,
            email: true,
          },
        },
      },
      omit: {
        createdAt: true,
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
      ? db.worker.count({
          where: {
            ...(status && { isActive: status }),
            ...(vendorId && {
              user: {
                vendorId,
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

//get single employee
export const getSingleEmployeeByID = async (
  employeeID: string,
  vendorId: string
) => {
  return await db.worker.findFirst({
    where: {
      id: employeeID,
      user: {
        vendorId,
      },
    },
    omit: {
      createdAt: true,
      updatedAt: true,
      userId: true,
    },
    include: {
      user: {
        select: {
          id: true,
          email: true,
          username: true,
          mobile: true,
        },
      },
    },
  });
};

//edit employee
export const updateEmployee = async (
  employeeID: string,
  data: {
    fatherName: string;
    fullName: string;
    whatsapp: string;
    NID: string;
    education: string;
    bankName: string;
    branchName: string;
    accountNumber: string;
    mobileBanking: string;
    mobileBankingNumber: string;
    address: string;
    zipCode: string;
    profile_picture?: any;
  }
) => {
  return await db.worker.update({
    where: {
      id: employeeID,
    },
    data: {
      fatherName: data.fatherName,
      fullName: data.fullName,
      whatsapp: data.whatsapp,
      NID: data.NID,
      education: data.education,
      bankName: data.bankName,
      branchName: data.branchName,
      accountNumber: data.accountNumber,
      mobileBanking: data.mobileBanking,
      mobileBankingNumber: data.mobileBankingNumber,
      address: data.address,
      zipCode: data.zipCode,
      ...(data.profile_picture && { profile_picture: data.profile_picture }),
    },
  });
};
