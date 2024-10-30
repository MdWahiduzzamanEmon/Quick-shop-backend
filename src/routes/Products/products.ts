import express from "express";
import type { Request, Response, NextFunction, RequestHandler } from "express";
import { verifyTokenMiddleware } from "../../Others/JWT";
import errorMessage from "../../Others/ErrorMessage/errorMessage";
import { showResponse } from "../../constant/showResponse";

export const productsRouter = express.Router();

//get all products handler

const getAllProductsHandler: RequestHandler = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  try {
  } catch (error) {
    next(error);
  }
};

productsRouter.get("/products", verifyTokenMiddleware, getAllProductsHandler);

//get single product handler
