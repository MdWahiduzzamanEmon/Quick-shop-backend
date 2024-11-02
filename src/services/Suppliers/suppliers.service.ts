import { generateUniqueID } from "../../Others/OTP/otp";
import { SupplierBody } from "../../routes/Suppliers/suppliers";
import { db } from "../../utils/db.server";

//check exist supplier
export const checkSupplier = async (supplierName: string) => {
  // Normalize the supplier name by converting it to lowercase
  const normalizedSupplierName = supplierName.toLowerCase();

  // Search for any supplier that has a similar name
  const existingSupplier = await db.supplier.findFirst({
    where: {
      supplierName: {
        equals: normalizedSupplierName,
        mode: "insensitive", // Case-insensitive search
      },
    },
  });

  return existingSupplier;
};

export const createSupplier = async ({
  supplierName,
  srName,
  srContactNo,
  srWhatsappNo,
  dealerName,
  dealerContactNo,
  dealerEmail,
  dealerAddress,
  vendorId,
  companyLogo,
  srPhoto,
}: SupplierBody) => {
  return await db.supplier.create({
    data: {
      supplierUniqueId: generateUniqueID("SUP"), // Add this line
      supplierName,
      srName,
      srContactNo,
      srWhatsappNo,
      dealerName,
      dealerContactNo,
      dealerEmail,
      dealerAddress,
      vendor: {
        connect: {
          id: vendorId,
        },
      },
      companyLogo,
      srPhoto,
    },
  });
};
