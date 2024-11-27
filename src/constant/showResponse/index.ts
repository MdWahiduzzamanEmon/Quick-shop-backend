import type { Response } from "express";

export type IShowResponseData = {
  success?: boolean;
  status?: number;
  message: string;
  data?: any;
  paginationInfo?: any;
  [key: string]: any;
};

export const showResponse = (
  res: Response,
  {
    success = true,
    status = 200,
    message,
    data,
    paginationInfo,
    ...rest
  }: IShowResponseData
) => {
  return res?.status(status)?.json({
    success: status === 200 ? true : status === 201 ? true : false,
    status,
    message,
    data,
    ...rest,
    ...(paginationInfo && { paginationInfo }),
  });
};
