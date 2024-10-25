import { ShopStatus } from "@prisma/client";
import { db } from "../../utils/db.server";

export const getVendors = async ({ status }: { status?: ShopStatus }) => {
  return await db.vendor.findMany({
    where: {
      ...(status && { isActive: status }),
    },
    include: {
      users: {
        omit: {
          createdAt: true,
          updatedAt: true,
          password: true,
        },
      },
    },
  });
};

//getSingleVendor
export const getSingleVendor = async (id: string) => {
  return await db.vendor.findFirst({
    where: {
      id,
    },
    include: {
      users: {
        omit: {
          createdAt: true,
          updatedAt: true,
          password: true,
        },
      },
    },
  });
};
