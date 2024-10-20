import type { Response } from "express";

export type IShowResponseData = {
  success?: boolean;
  status?: number;
  message: string;
  data?: any;
};

export const showResponse = (
  res: Response,
  { success = true, status = 200, message, data }: IShowResponseData
) => {
  return res.status(status).json({ success, status, message, data });
};
