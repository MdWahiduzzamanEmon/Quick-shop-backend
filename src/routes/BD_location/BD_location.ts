import express from "express";
import type { Request, Response, NextFunction } from "express";
import {
  getDistrictsData,
  getDivisionsData,
  getUnionsData,
  getUpazilasData,
} from "../../services/bd_locations/bd_locations.service";
import { showResponse } from "../../constant/showResponse";
import errorMessage from "../../Others/ErrorMessage/errorMessage";
import { getFromCache, StoreInCache } from "../../Redis/redis";

export const bd_locationsRoute = express.Router();

//divisions data

const divisionsDataHandler = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  try {
    const { name: divisionName, bn_name: bnDivisionName } = req.query as any;
    // console.log(typeof divisionName, bnDivisionName);
    const divisions = await getDivisionsData({
      divisionName,
      bnDivisionName,
    });

    await StoreInCache("divisions", "divisions", divisions);
    showResponse(res, {
      message: "Divisions fetched successfully",
      data: divisions,
    });
  } catch (error: any) {
    errorMessage(res, error, next);
  }
};

bd_locationsRoute.get("/divisions", divisionsDataHandler);

//Districts data

const districtsDataHandler = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  try {
    const {
      name: districtName,
      bn_name: bnDistrictName,
      division_id,
    } = req.query as any;

    const districts = await getDistrictsData({
      districtName,
      bnDistrictName,
      division_id,
    });

    showResponse(res, {
      message: "Districts fetched successfully",
      data: districts,
    });
  } catch (error: any) {
    errorMessage(res, error, next);
  }
};

bd_locationsRoute.get("/districts", districtsDataHandler);

// Upazilas data

const upazilasDataHandler = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  try {
    const {
      name: upazilaName,
      bn_name: bnUpazilaName,
      district_id,
    } = req.query as any;

    const upazilas = await getUpazilasData({
      upazilaName,
      bnUpazilaName,
      district_id,
    });

    showResponse(res, {
      message: "Upazilas fetched successfully",
      data: upazilas,
    });
  } catch (error: any) {
    errorMessage(res, error, next);
  }
};

bd_locationsRoute.get("/upazilas", upazilasDataHandler);

// unions data

const unionsDataHandler = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  try {
    const {
      upazila_id,
      name: unionName,
      bn_name: bnUnionName,
    } = req.query as any;

    const unions = await getUnionsData({
      unionName,
      bnUnionName,
      upazila_id,
    });

    showResponse(res, {
      message: "Unions fetched successfully",
      data: unions,
    });
  } catch (error: any) {
    errorMessage(res, error, next);
  }
};

bd_locationsRoute.get("/unions", unionsDataHandler);
