const errorMessage = (res: any, error: any) => {
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

  return res.status(500).json({ message: "Internal server error", error });
};

export default errorMessage;
