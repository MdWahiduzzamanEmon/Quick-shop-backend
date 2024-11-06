import { Zone_status } from "@prisma/client";
import { db } from "../../utils/db.server";
import { CreateZoneData } from "../../routes/Zone/zone";
import { paginationCustomResult } from "../../Others/paginationCustomResult";

export const getZones = async ({
  zoneId,
  status,
  district_id,
  upazila_id,
  union_id,
  operatorId,
  vendorId,
  pageNumber,
  rowPerPage,
  pagination,
}: {
  zoneId?: string;
  status?: Zone_status;
  district_id?: string;
  upazila_id?: string;
  union_id?: string;
  operatorId?: string;
  vendorId: string;
  pageNumber?: number;
  rowPerPage?: number;
  pagination?: boolean;
}) => {
  //pagination
  const pageNumbers = pageNumber ? parseInt(pageNumber.toString()) : 1;
  const resultPerPage = rowPerPage ? parseInt(rowPerPage.toString()) : 10;
  const [result, total] = await Promise.all([
    db.zone.findMany({
      where: {
        ...(zoneId && {
          id: String(zoneId),
        }),
        ...(status && { isActive: status }),
        ...(district_id && { district_id: Number(district_id) }),
        ...(upazila_id && { upazila_id: Number(upazila_id) }),
        ...(union_id && { union_id: Number(union_id) }),
        ...(operatorId && { operatorId }),
        ...(vendorId && { vendorId }),
      },

      orderBy: {
        createdAt: "desc",
      },
      include: {
        division: {
          select: {
            id: true,
            name: true,
            bn_name: true,
          },
        },
        district: {
          select: {
            id: true,
            name: true,
            bn_name: true,
          },
        },
        upazila: {
          select: {
            id: true,
            name: true,
            bn_name: true,
          },
        },
        union: {
          select: {
            id: true,
            name: true,
            bn_name: true,
          },
        },
        operator: {
          select: {
            id: true,
            fullName: true,
            whatsapp: true,
            employeeID: true,
          },
        },
        representatives: {
          select: {
            id: true,
            fullName: true,
            whatsapp: true,
            employeeID: true,
          },
        },
        riders: {
          select: {
            id: true,
            fullName: true,
            whatsapp: true,
            employeeID: true,
          },
        },
        product_inventory: {
          select: {
            product: {
              select: {
                id: true,
                product_name: true,
                product_code: true,
              },
            },
            quantitySold: true,
            productStockLimit: true,
            stockAvailable: true,
            productCustomerPrice: true,
            productRetailPrice: true,
          },
        },
      },
      omit: {
        createdAt: true,
        updatedAt: true,
        division_id: true,
        district_id: true,
        upazila_id: true,
        union_id: true,
        operatorId: true,
      },
    }),
    pagination
      ? db.zone.count({
          where: {
            ...(zoneId && {
              id: String(zoneId),
            }),
            ...(status && { isActive: status }),
            ...(district_id && { district_id: Number(district_id) }),
            ...(upazila_id && { upazila_id: Number(upazila_id) }),
            ...(union_id && { union_id: Number(union_id) }),
            ...(operatorId && { operatorId }),
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

export const getZoneById = async (id: string, vendorId: string) => {
  return await db.zone.findUnique({
    where: {
      id: String(id),
      vendorId,
    },
    omit: {
      createdAt: true,
      updatedAt: true,
      division_id: true,
      district_id: true,
      upazila_id: true,
      union_id: true,
      operatorId: true,
    },
    include: {
      division: {
        select: {
          id: true,
          name: true,
          bn_name: true,
        },
      },
      district: {
        select: {
          id: true,
          name: true,
          bn_name: true,
        },
      },
      upazila: {
        select: {
          id: true,
          name: true,
          bn_name: true,
        },
      },
      union: {
        select: {
          id: true,
          name: true,
          bn_name: true,
        },
      },
      operator: {
        select: {
          id: true,
          fullName: true,
          whatsapp: true,
          employeeID: true,
        },
      },
      representatives: {
        select: {
          id: true,
          fullName: true,
          whatsapp: true,
          employeeID: true,
        },
      },
      riders: {
        select: {
          id: true,
          fullName: true,
          whatsapp: true,
          employeeID: true,
        },
      },
    },
  });
};

//createZone
export const createZone = async ({
  village_name,
  ward_no,
  zone_name,
  contact_no,
  whatsapp_no,
  division_id,
  district_id,
  upazila_id,
  union_id,
  operatorId,
  representatives,
  riders,
  createdById,
  vendorId,
}: CreateZoneData) => {
  return await db.zone.create({
    data: {
      village_name,
      ward_no: String(ward_no),
      zone_name,
      contact_no,
      whatsapp_no,
      division_id,
      district_id,
      upazila_id,
      union_id,
      vendorId,
      createdById,
      ...(operatorId && { operatorId }),
      ...(representatives && {
        representatives: {
          connect: representatives.map((id) => ({ id })),
        },
      }),
      ...(riders && {
        riders: {
          connect: riders.map((id) => ({ id })),
        },
      }),
    },
  });
};

//update zone
export const updateZone = async (
  id: string,
  {
    village_name,
    ward_no,
    zone_name,
    contact_no,
    whatsapp_no,
    division_id,
    district_id,
    upazila_id,
    union_id,
    operatorId,
    representatives,
    removedRepresentatives,
    riders,
    removedRiders,
  }: {
    village_name?: string;
    ward_no?: string;
    zone_name?: string;
    contact_no?: string;
    whatsapp_no?: string;
    division_id?: number;
    district_id?: number;
    upazila_id?: number;
    union_id?: number;
    operatorId?: string;
    representatives?: string[];
    removedRepresentatives?: string[];
    riders?: string[];
    removedRiders?: string[];
  }
) => {
  return await db.zone.update({
    where: {
      id: String(id),
    },
    data: {
      village_name,
      ward_no: String(ward_no),
      zone_name,
      contact_no,
      whatsapp_no,
      division_id,
      district_id,
      upazila_id,
      union_id,
      ...(operatorId && { operatorId }),
      ...(representatives && {
        representatives: {
          connect: representatives.map((id) => ({ id })),
        },
      }),
      ...(riders && {
        riders: {
          connect: riders.map((id) => ({ id })),
        },
      }),
      ...(removedRepresentatives && {
        representatives: {
          disconnect: removedRepresentatives.map((id) => ({ id })),
        },
      }),
      ...(removedRiders && {
        riders: {
          disconnect: removedRiders.map((id) => ({ id })),
        },
      }),
    },
  });
};

//deleteZone
export const deleteZone = async (id: string) => {
  return await db.zone.delete({
    where: {
      id: String(id),
    },
  });
};

//checkOperatorAssigned
export const checkOperatorAssigned = async ({
  operatorId,
  vendorId,
  representativeId,
  riderId,
}: {
  operatorId: string;
  vendorId: string;
  representativeId?: string;
  riderId?: string;
}) => {
  return await db.zone.findFirst({
    where: {
      vendorId,
      ...(operatorId && { operatorId }),
      ...(representativeId && {
        representatives: {
          some: {
            id: representativeId,
          },
        },
      }),
      ...(riderId && { riders: { some: { id: riderId } } }),
    },
  });
};

export const updateZoneStatus = async (
  vendorId: string,
  id: string,
  status: Zone_status
) => {
  return await db.zone.update({
    where: {
      id: String(id),
      vendorId,
    },
    data: {
      isActive: status,
    },
  });
};

//getZonesNameList
export const getZonesNameList = async ({
  vendorId,
  status,
}: {
  vendorId: string;
  status?: Zone_status;
}) => {
  return await db.zone.findMany({
    where: {
      ...(status && { isActive: status }),
      vendorId,
    },
    select: {
      id: true,
      zone_name: true,
    },
  });
};
