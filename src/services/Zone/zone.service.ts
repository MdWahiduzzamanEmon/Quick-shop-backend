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
