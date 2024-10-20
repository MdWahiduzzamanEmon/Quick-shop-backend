import express from "express";
import type { Request, Response, NextFunction } from "express";
import { getAdministrator } from "../../../services/Users/administrator/administrator.service";
import { showResponse } from "../../../constant/showResponse";

export const administratorRoute = express.Router();

// Get all administratorRoute
administratorRoute.get(
  "/administrator",
  async (req: Request, res: Response, next: NextFunction) => {
    try {
      const users = await getAdministrator();
      return showResponse(res, {
        message: "Administrator fetched successfully",
        data: users,
      });
    } catch (error: any) {
      next(error);
    }
  }
);
