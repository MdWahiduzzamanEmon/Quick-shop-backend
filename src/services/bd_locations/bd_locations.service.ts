import { db } from "../../utils/db.server";

export const getDivisionsData = async ({
  divisionName,
  bnDivisionName,
}: {
  divisionName?: string;
  bnDivisionName?: string;
}) => {
  if (!divisionName && !bnDivisionName) {
    const divisions = await db.division.findMany({
      orderBy: {
        id: "asc",
      },
    });
    return divisions;
  }

  // console.log(divisionName, bnDivisionName);
  const divisions = await db.division.findMany({
    where: {
      OR: [
        {
          name: divisionName,
        },
        {
          bn_name: bnDivisionName,
        },
      ],
    },
    orderBy: {
      id: "asc",
    },
  });
  return divisions;
};

//districts

export const getDistrictsData = async ({
  districtName,
  bnDistrictName,
  division_id,
}: {
  districtName?: string;
  bnDistrictName?: string;
  division_id?: number | string;
}) => {
  //if all are empty
  if (!districtName && !bnDistrictName && !division_id) {
    const districts = await db.district.findMany({
      orderBy: {
        id: "asc",
      },
      include: {
        division: true,
      },
    });
    return districts;
  }

  // if only division_id is exists
  if (!districtName && !bnDistrictName && division_id) {
    const districts = await db.district.findMany({
      where: {
        division_id: parseInt(division_id as string),
      },
      orderBy: {
        id: "asc",
      },
    });
    return districts;
  }

  const districts = await db.district.findMany({
    where: {
      OR: [
        {
          name: districtName,
        },
        {
          bn_name: bnDistrictName,
        },
      ],
    },
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

export const getUpazilasData = async ({
  upazilaName,
  bnUpazilaName,
  district_id,
}: {
  upazilaName?: string;
  bnUpazilaName?: string;
  district_id?: number | string;
}) => {
  if (!upazilaName && !bnUpazilaName && !district_id) {
    const upazilas = await db.upazila.findMany({
      orderBy: {
        id: "asc",
      },
      include: {
        district: true,
      },
    });
    return upazilas;
  }

  // if only district_id is exists
  if (!upazilaName && !bnUpazilaName && district_id) {
    const upazilas = await db.upazila.findMany({
      where: {
        district_id: parseInt(district_id as string),
      },
      orderBy: {
        id: "asc",
      },
    });
    return upazilas;
  }

  // if only upazilaName or bnUpazilaName is exists
  if (upazilaName || bnUpazilaName) {
    const upazilas = await db.upazila.findMany({
      where: {
        OR: [
          {
            name: upazilaName,
          },
          {
            bn_name: bnUpazilaName,
          },
        ],
      },
      orderBy: {
        id: "asc",
      },
    });
    return upazilas;
  }
};

//unions

export const getUnionsData = async ({
  unionName,
  bnUnionName,
  upazila_id,
}: {
  unionName?: string;
  bnUnionName?: string;
  upazila_id?: number | string;
}) => {
  // if all are empty
  if (!unionName && !bnUnionName && !upazila_id) {
    const unions = await db.union.findMany({
      orderBy: {
        id: "asc",
      },
      include: {
        upazila: true,
      },
    });
    return unions;
  }

  // if only upazila_id is exists
  if (!unionName && !bnUnionName && upazila_id) {
    const unions = await db.union.findMany({
      where: {
        upazila_id: parseInt(upazila_id as string),
      },
      orderBy: {
        id: "asc",
      },
    });
    return unions;
  }

  // if only unionName or bnUnionName is exists
  if (unionName || bnUnionName) {
    const unions = await db.union.findMany({
      where: {
        OR: [
          {
            name: unionName,
          },
          {
            bn_name: bnUnionName,
          },
        ],
      },
      orderBy: {
        id: "asc",
      },
    });
    return unions;
  }
};
