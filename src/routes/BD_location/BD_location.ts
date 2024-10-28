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

export const bd_locationsRoute = express.Router();

//divisions data

const divisionsDataHandler = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  try {
    const divisions = await getDivisionsData();
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
    const districts = await getDistrictsData();
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
    const upazilas = await getUpazilasData();
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
    const unions = await getUnionsData();
    showResponse(res, {
      message: "Unions fetched successfully",
      data: unions,
    });
  } catch (error: any) {
    errorMessage(res, error, next);
  }
};

bd_locationsRoute.get("/unions", unionsDataHandler);
