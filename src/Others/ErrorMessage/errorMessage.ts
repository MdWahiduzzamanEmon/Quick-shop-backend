import { NextFunction, Request, Response } from "express";

const errorMessage = (res: Response, error: any, next: NextFunction) => {
  console.log("Error:", error);
  if (error.code === "P2002") {
    return res.status(400).json({
      message: "Cannot insert duplicate value.",
      error: error.meta.target,
    });
  }

  if (error.code === "P2025") {
    return res.status(400).json({
      message: "Cannot update record because it is not found.",
      error: error.meta.cause,
    });
  }

  if (error.code === "P2003") {
    return res.status(400).json({
      message: "No record found",
      // "projectExpenses_projectId_fkey (index)"
      error: error.meta.field_name?.includes("fkey")
        ? error.meta.field_name?.split("_")?.[1] + " does not exist"
        : error.meta.field_name,
    });
  }

  return next(error);
};

export default errorMessage;
