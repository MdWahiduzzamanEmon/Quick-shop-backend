import { db } from "../../utils/db.server"

export const createSupplier = async (name: string, vendorId: string) => {
    return await db.supplier.create({
        data: {
            name,
            vendorId,
        },
    }
}