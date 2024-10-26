import express from "express";
import type { Request, Response, NextFunction } from "express";
import { client } from "../../server";
import { showResponse } from "../../constant/showResponse";

export const getConnectedUsersRoute = express.Router();

// Get all connected users
getConnectedUsersRoute.get(
  "/get-connected-users",
  async (req: Request, res: Response, next: NextFunction) => {
    try {
      const connectedUsers = await client.get("connectedUsers");
      if (connectedUsers) {
        showResponse(res, {
          message: "Connected users fetched successfully",
          data: JSON.parse(connectedUsers),
        });
      }
      return;
    } catch (error) {
      next(error);
    }
  }
);
