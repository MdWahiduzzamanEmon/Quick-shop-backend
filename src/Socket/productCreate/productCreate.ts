import { client, ioInstance } from "../../server";

async function productCreateLiveResponse(
  {
    vendorId,
    productResponse,
    createdByUserId,
  }: { vendorId: string; productResponse: any; createdByUserId: string } // ID of the user who created the product
) {
  try {
    // Fetch connected users from Redis
    const cachedUsers = (await client?.get("connectedUsers")) as string | null;
    const connectedUsers = cachedUsers ? JSON.parse(cachedUsers) : [];

    // Filter out admins and operators of the vendor who aren't the product creator
    const targetUsers = connectedUsers.filter(
      (user: any) =>
        (user.role?.toLowerCase() === "admin" ||
          user.role?.toLowerCase() === "operator") &&
        user.vendorId === vendorId &&
        user.userId !== createdByUserId // Exclude the product creator
    );

    if (targetUsers.length > 0) {
      for (const targetUser of targetUsers) {
        const socket = ioInstance.sockets.sockets?.get(targetUser.socketId);
        if (socket) {
          // Emit the notification only to the selected admins/operators
          socket.emit("productLiveResponse", {
            product: productResponse,
          });
        }
      }
    }
  } catch (err) {
    console.error(
      "Error sending notifications to vendor admins/operators:",
      err
    );
  }
}

export default productCreateLiveResponse;
