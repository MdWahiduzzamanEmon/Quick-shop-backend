import express from "express";
import type { Request, Response, NextFunction } from "express";
import { showResponse } from "../../constant/showResponse";
import errorMessage from "../../Others/ErrorMessage/errorMessage";
import { verifyTokenMiddleware } from "../../Others/JWT";
import {
  checkOperatorAssigned,
  createZone,
  deleteZone,
  getZoneById,
  getZones,
  updateZone,
  updateZoneStatus,
} from "../../services/Zone/zone.service";
import { WorkerRole, Zone_status } from "@prisma/client";
import { generateETag } from "../../Others/OTP/otp";

export const zoneRoute = express.Router();

//create zone
zoneRoute.post("/zones", verifyTokenMiddleware, createZoneHandler);
//get all zone
zoneRoute.get("/zones", verifyTokenMiddleware, getAllZoneHandler);
//get single zone
zoneRoute.get("/zones/:id", verifyTokenMiddleware, getSingleZoneHandler);
// //update zone
zoneRoute.put("/zones/:id", verifyTokenMiddleware, updateZoneHandler);
// //update zone status
zoneRoute.put(
  "/zones/active-inactive/:id",
  verifyTokenMiddleware,
  updateZoneStatusHandler
);
// //delete zone
zoneRoute.delete("/zones/:id", verifyTokenMiddleware, deleteZoneHandler);

//check if a operator has already assigned to a zone
zoneRoute.get(
  "/checkEmployeeAssignedInZone",
  verifyTokenMiddleware,
  checkOperatorAssignedHandler
);

//get all zone
async function getAllZoneHandler(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const reqData = req as any;
  try {
    const { vendorId } = reqData?.user;
    //query
    const {
      status,
      id: zoneId,
      district_id,
      upazila_id,
      union_id,
      operatorId,
      pageNumber,
      rowPerPage,
      pagination,
    } = req.query as {
      status: Zone_status;
      id: string;
      district_id: string;
      upazila_id: string;
      union_id: string;
      operatorId: string;
      pageNumber: string;
      rowPerPage: string;
      pagination: string;
    };

    if (status && !(status in Zone_status)) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Invalid status",
      });
      return;
    }

    const zones = await getZones({
      zoneId,
      status,
      district_id,
      upazila_id,
      union_id,
      operatorId,
      vendorId,
      pageNumber: Number(pageNumber),
      rowPerPage: Number(rowPerPage),
      pagination: Boolean(pagination),
    });

    // Cache for 24 hr, but verify every on each request with no-cache
    res.setHeader("Cache-Control", `max-age=${60 * 60 * 24}, no-cache`);

    // Generate ETag based on new data and set it in the response
    const etag = generateETag(zones);
    res.setHeader("ETag", `"${etag}"`);

    const ifNoneMatchValue = req.headers["if-none-match"];

    // Check if the client has the latest data
    if (ifNoneMatchValue === `"${etag}"`) {
      // 304 Not Modified
      res.status(304).end();
      return;
    }

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
  const reqData = req as any;
  try {
    const { id } = req.params as { id: string };
    const { vendorId } = reqData?.user;
    const zone = await getZoneById(id, vendorId);
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
        message: "Forbidden access! Only admin can create zone",
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
        requiredFields: [
          "village_name",
          "ward_no",
          "zone_name",
          "division_id",
          "district_id",
          "upazila_id",
        ],
      });
      return;
    }

    //need one more check fro. operator id is present thrn that id can be used in rep and rider array. also if rep array is present then that req users can not set as rider array also and vice versa
    if (
      operatorId &&
      (representatives?.includes(operatorId) || riders?.includes(operatorId))
    ) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Operator can not be in rep or rider array",
      });
      return;
    }

    if (representatives?.length > 0 && !operatorId) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Operator id is required for rep array",
      });
      return;
    }

    if (riders?.length > 0 && !operatorId) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Operator id is required for rider array",
      });
      return;
    }

    //if rep but not array
    if (representatives && !Array.isArray(representatives)) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Representatives must be an array",
      });
      return;
    }
    //if rider but not array
    if (riders && !Array.isArray(riders)) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Riders must be an array",
      });
      return;
    }

    const checkRepresntativesInRiders = representatives?.filter((rep: string) =>
      riders?.includes(rep)
    );

    if (riders && checkRepresntativesInRiders?.length > 0) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Rep and rider can not be same",
      });
      return;
    }

    const checkRidersInRep = riders?.filter((rider: string) =>
      representatives?.includes(rider)
    );

    if (representatives && checkRidersInRep?.length > 0) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Rep and rider can not be same",
      });
      return;
    }

    //check if zone already exists

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
      status: 201,
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
        message: "Forbidden access! Only admin can update zone",
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

    //if rep but not array
    if (representatives && !Array.isArray(representatives)) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Representatives must be an array",
      });
      return;
    }
    //if rider but not array
    if (riders && !Array.isArray(riders)) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Riders must be an array",
      });
      return;
    }

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

//check if a operator has already assigned to a zone

async function checkOperatorAssignedHandler(
  req: Request,
  res: Response,
  next: NextFunction
) {
  // console.log("checkOperatorAssignedHandler");

  const reqData = req as any;
  try {
    const { vendorId, role } = reqData?.user;
    const { operatorId, representativeId, riderId, queryFor } =
      reqData?.query as {
        operatorId: string;
        representativeId: string;
        riderId: string;
        queryFor: WorkerRole;
      };

    if (role !== "ADMIN") {
      showResponse(res, {
        status: 403,
        success: false,
        message: "Forbidden access! Only admin can check operator assigned",
      });
      return;
    }

    if (!queryFor && !(queryFor in WorkerRole)) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Invalid query for",
      });
      return;
    }

    if (queryFor === WorkerRole.OPERATOR && !operatorId) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Operator id is required",
      });
      return;
    }

    if (queryFor === WorkerRole.REPRESENTATIVE && !representativeId) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Representative id is required",
      });
      return;
    }

    if (queryFor === WorkerRole.RAIDER && !riderId) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Rider id is required",
      });
      return;
    }

    const isAssigned = await checkOperatorAssigned({
      operatorId,
      representativeId,
      riderId,
      vendorId,
    });
    if (isAssigned) {
      showResponse(res, {
        status: 409,
        success: false,
        message: `This ${queryFor} is already assigned to a zone`,
      });
      return;
    }
    showResponse(res, {
      status: 200,
      success: true,
      message: `This ${queryFor} is not assigned to any zone`,
    });
  } catch (error: any) {
    errorMessage(res, error, next);
  }
}

// updateZoneStatusHandler

async function updateZoneStatusHandler(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const reqData = req as any;
  try {
    const { vendorId, role } = reqData?.user;
    if (role !== "ADMIN") {
      showResponse(res, {
        status: 403,
        success: false,
        message: "Forbidden access",
      });
      return;
    }
    const { id } = req.params as { id: string };
    const { status } = reqData?.body as {
      status: Zone_status;
    };
    if (!status && !(status in Zone_status)) {
      showResponse(res, {
        status: 404,
        success: false,
        message: "Please provide a valid status",
      });
      return;
    }

    const zone = await updateZoneStatus(vendorId, id, status);

    if (!zone) {
      showResponse(res, {
        status: 404,
        success: false,
        message: "Status not updated",
      });
      return;
    }

    showResponse(res, {
      message: `Zone status updated to ${status}`,
    });
    return;
  } catch (error: any) {
    errorMessage(res, error, next);
  }
}
