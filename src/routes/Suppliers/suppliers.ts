import express from "express";
import type { Request, Response, NextFunction, RequestHandler } from "express";
import { verifyTokenMiddleware } from "../../Others/JWT";
import errorMessage from "../../Others/ErrorMessage/errorMessage";
import { showResponse } from "../../constant/showResponse";

export const suppliersRouter = express.Router();

suppliersRouter.get(
  "/suppliers",
  verifyTokenMiddleware,
  getAllSuppliersHandler
);
suppliersRouter.get(
  "/suppliers/:id",
  verifyTokenMiddleware,
  getSupplierByIdHandler
);
suppliersRouter.post(
  "/create-supplier",
  verifyTokenMiddleware,
  createSupplierHandler
);
suppliersRouter.put(
  "/suppliers/:id",
  verifyTokenMiddleware,
  updateSupplierHandler
);
suppliersRouter.delete(
  "/suppliers/:id",
  verifyTokenMiddleware,
  deleteSupplierHandler
);

function getAllSuppliersHandler(
  req: Request,
  res: Response,
  next: NextFunction
) {}

//get single supplier
async function getSupplierByIdHandler(
  req: Request,
  res: Response,
  next: NextFunction
) {}

//create supplier
async function createSupplierHandler(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const reqData = req as any;
  try {
    const { name } = req.body;
    const { vendorId } = reqData?.user;
    const supplier = await createSupplier(name, vendorId);
    showResponse(res, {
      message: "Supplier created successfully",
      data: supplier,
    });
  } catch (error: any) {
    errorMessage(res, error, next);
  }
}

//update supplier
async function updateSupplierHandler(
  req: Request,
  res: Response,
  next: NextFunction
) {}

//delete supplier
async function deleteSupplierHandler(
  req: Request,
  res: Response,
  next: NextFunction
) {}
