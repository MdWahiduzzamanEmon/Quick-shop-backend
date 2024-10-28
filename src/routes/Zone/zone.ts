import express from "express";
import type { Request, Response, NextFunction } from "express";
import { showResponse } from "../../constant/showResponse";
import errorMessage from "../../Others/ErrorMessage/errorMessage";
import { verifyTokenMiddleware } from "../../Others/JWT";
import {
  createZone,
  deleteZone,
  getZoneById,
  getZones,
  updateZone,
} from "../../services/Zone/zone.service";
import { Zone_status } from "@prisma/client";

export const zoneRoute = express.Router();

//create zone
zoneRoute.post("/zones", verifyTokenMiddleware, createZoneHandler);
//get all zone
zoneRoute.get("/zones", verifyTokenMiddleware, getAllZoneHandler);
//get single zone
zoneRoute.get("/zones/:id", verifyTokenMiddleware, getSingleZoneHandler);
// //update zone
zoneRoute.put("/zones/:id", verifyTokenMiddleware, updateZoneHandler);
// //delete zone
zoneRoute.delete("/zones/:id", verifyTokenMiddleware, deleteZoneHandler);

//get all zone
async function getAllZoneHandler(
  req: Request,
  res: Response,
  next: NextFunction
) {
  try {
    const { status } = req.query as {
      status: Zone_status;
    };

    if (status && !(status in Zone_status)) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Invalid status",
      });
      return;
    }

    const zones = await getZones(status);

    showResponse(res, {
      message: "Zones fetched successfully",
      data: zones,
    });
  } catch (error: any) {
    errorMessage(res, error, next);
  }
}

//get single zone
async function getSingleZoneHandler(
  req: Request,
  res: Response,
  next: NextFunction
) {
  try {
    const { id } = req.params as { id: string };
    const zone = await getZoneById(id);
    showResponse(res, {
      message: "Zone fetched successfully",
      data: zone,
    });
  } catch (error: any) {
    errorMessage(res, error, next);
  }
}

//create zone

export type CreateZoneData = {
  village_name: string;
  ward_no: string;
  zone_name: string;
  contact_no?: string;
  whatsapp_no?: string;
  division_id: number;
  district_id: number;
  upazila_id: number;
  union_id?: number;
  operatorId?: string;
  representatives?: string[];
  riders?: string[];
  createdById: string;
  vendorId: string;
};

async function createZoneHandler(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const reqData = req as any;
  try {
    const { role, id: userId, vendorId } = reqData.user;

    if (role !== "ADMIN") {
      showResponse(res, {
        status: 403,
        success: false,
        message: "Forbidden access",
      });
      return;
    }

    const {
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
    } = reqData.body;

    if (
      !village_name ||
      !ward_no ||
      !zone_name ||
      !division_id ||
      !district_id ||
      !upazila_id
    ) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Missing required fields",
      });
      return;
    }

    const data: CreateZoneData = {
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
      createdById: userId,
      vendorId,
    };

    const zone = await createZone(data);

    if (!zone) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Zone already exists",
      });
      return;
    }
    showResponse(res, {
      message: "Zone created successfully",
      data: zone,
    });
  } catch (error: any) {
    errorMessage(res, error, next);
  }
}

//update zone
async function updateZoneHandler(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const reqData = req as any;
  try {
    const { role } = reqData.user;

    if (role !== "ADMIN") {
      showResponse(res, {
        status: 403,
        success: false,
        message: "Forbidden access",
      });
      return;
    }

    const { id } = req.params as { id: string };
    const {
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
    } = req.body as any;
    const zone = await updateZone(id, {
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
    });

    if (!zone) {
      showResponse(res, {
        status: 404,
        success: false,
        message: "Zone not found",
      });
      return;
    }
    showResponse(res, {
      message: "Zone updated successfully",
      data: zone,
    });
  } catch (error: any) {
    errorMessage(res, error, next);
  }
}

//delete zone

async function deleteZoneHandler(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const reqData = req as any;
  try {
    const { role } = reqData.user;

    if (role !== "ADMIN") {
      showResponse(res, {
        status: 403,
        success: false,
        message: "Forbidden access",
      });
      return;
    }

    const { id } = req.params as { id: string };
    const zone = await deleteZone(id);
    if (!zone) {
      showResponse(res, {
        status: 404,
        success: false,
        message: "Zone not found",
      });
      return;
    }
    showResponse(res, {
      message: "Zone deleted successfully",
      data: zone,
    });
  } catch (error: any) {
    errorMessage(res, error, next);
  }
}
