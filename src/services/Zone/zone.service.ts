import { Zone_status } from "@prisma/client";
import { db } from "../../utils/db.server";
import { CreateZoneData } from "../../routes/Zone/zone";

export const getZones = async (status?: Zone_status) => {
  return await db.zone.findMany({
    where: {
      ...(status && { isActive: status }),
    },
  });
};

export const getZoneById = async (id: string | number) => {
  return await db.zone.findUnique({
    where: {
      id: typeof id === "string" ? parseInt(id, 10) : id,
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
      ward_no,
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
  id: string | number,
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
    riders,
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
    riders?: string[];
  }
) => {
  return await db.zone.update({
    where: {
      id: typeof id === "string" ? parseInt(id, 10) : id,
    },
    data: {
      village_name,
      ward_no,
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
    },
  });
};

//deleteZone
export const deleteZone = async (id: string | number) => {
  return await db.zone.delete({
    where: {
      id: typeof id === "string" ? parseInt(id, 10) : id,
    },
  });
};
