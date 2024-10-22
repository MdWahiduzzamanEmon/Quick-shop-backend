import express from "express";
import type { Request, Response, NextFunction } from "express";
import { showResponse } from "../../../constant/showResponse";
import { getLoginHistory } from "../../../services/History/LoginHistory/loginHistory.service";
import { verifyTokenMiddleware } from "../../../Others/JWT";
import { getCache, setCache } from "../../../Redis";

export const loginHistoryRoute = express.Router();

// Get login history

// export type LoginHistoryQuery = {
//   last_login: boolean;
//   pageNumber: number;
//   rowPerPage: number;
//   pagination: boolean;
// };

// const getLoginHistoryHandler: express.RequestHandler = async (
//   _req: Request,
//   res: Response,
//   next: NextFunction
// ) => {
//   try {
//     const { last_login, pageNumber, rowPerPage, pagination } =
//       _req.query as unknown as LoginHistoryQuery;

//     //set in redis store
//     const cachedData = await getFromCache("login_history", "login_history");

//     if (cachedData) {
//       showResponse(res, {
//         message: "Login History fetched successfully",
//         data: cachedData,
//       });
//       return;
//     }

//     const history = await getLoginHistory({
//       last_login,
//       pageNumber,
//       rowPerPage,
//       pagination,
//     });

//     //store in redis
//     StoreInCache("login_history", "login_history", history);

//     // http cache for 30 sec
//     res.set("Cache-Control", "public, max-age=30, must-revalidate");

//     showResponse(res, {
//       message: "Login History fetched successfully",
//       data: history,
//     });
//   } catch (error: any) {
//     next(error);
//   }
// };

// Types for queries and response
export type LoginHistoryQuery = {
  last_login?: boolean;
  pageNumber?: number;
  rowPerPage?: number;
  pagination?: boolean;
};

export interface IShowResponseData {
  message: string;
  data: any;
  paginationInfo?: IPaginationInfo;
}

export interface IPaginationInfo {
  pageNumber: number;
  rowPerPage: number;
  totalItems: number;
  totalPages: number;
  hasNextPage: boolean;
  hasPreviousPage: boolean;
}

const getLoginHistoryHandler: express.RequestHandler = async (
  _req: Request,
  res: Response,
  next: NextFunction
) => {
  try {
    // Extract query parameters and provide default values
    const {
      last_login = false,
      pageNumber = 1,
      rowPerPage = 10,
      pagination = false,
    } = _req.query as unknown as LoginHistoryQuery;

    // Create a unique cache key based on query parameters
    const cacheKey = `login_history:${pagination}:${pageNumber}:${rowPerPage}`;
    const cachedData = getCache(cacheKey);

    console.log(cachedData, "cachedData");

    if (cachedData) {
      // If data is found in cache, return it
      showResponse(res, {
        message: "Login History fetched successfully from cache",
        data: cachedData.data,
        paginationInfo: cachedData.paginationInfo,
      });
      return;
    }

    // Fetch paginated login history from the service
    const historyResponse = await getLoginHistory({
      last_login,
      pageNumber,
      rowPerPage,
      pagination,
    });

    // Extract pagination-related data if pagination is enabled
    const {
      result: historyData,
      totalResultCount,
      pageNumbers,
      resultPerPage,
    } = pagination
      ? historyResponse
      : { result: historyResponse, totalResultCount: 0 };

    // Construct pagination info if pagination is enabled
    const paginationInfo: IPaginationInfo | undefined = pagination
      ? {
          pageNumber: pageNumbers,
          rowPerPage: resultPerPage,
          totalItems: totalResultCount,
          totalPages: Math.ceil(totalResultCount / resultPerPage),
          hasNextPage:
            pageNumbers < Math.ceil(totalResultCount / resultPerPage),
          hasPreviousPage: pageNumbers > 1,
        }
      : undefined;

    // Store the result in the in-memory cache
    setCache(cacheKey, { data: historyData, paginationInfo }); // Cache for 30 seconds

    // HTTP cache for 30 seconds
    res.set("Cache-Control", "public, max-age=30, must-revalidate");

    // Send response using showResponse with correct typing
    showResponse(res, {
      message: "Login History fetched successfully",
      data: historyData,
      paginationInfo,
    });
  } catch (error: any) {
    next(error);
  }
};

loginHistoryRoute.get(
  "/login-history",
  verifyTokenMiddleware,
  getLoginHistoryHandler
);
