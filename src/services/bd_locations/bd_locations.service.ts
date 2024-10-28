import { db } from "../../utils/db.server";

export const getDivisionsData = async () => {
  const divisions = await db.division.findMany({
    orderBy: {
      id: "asc",
    },
  });
  return divisions;
};

//districts

export const getDistrictsData = async () => {
  const districts = await db.district.findMany({
    orderBy: {
      id: "asc",
    },
    include: {
      division: true,
    },
  });
  return districts;
};

//Upazila

export const getUpazilasData = async () => {
  const upazilas = await db.upazila.findMany({
    orderBy: {
      id: "asc",
    },
    include: {
      district: true,
      unions: true,
    },
  });
  return upazilas;
};

//unions

export const getUnionsData = async () => {
  const unions = await db.union.findMany({
    orderBy: {
      id: "asc",
    },
    include: {
      upazila: true,
    },
  });
  return unions;
};
