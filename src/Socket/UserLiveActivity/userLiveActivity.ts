import { client, ioInstance } from "../../server";

async function userActivityLiveResponse(vendorId: string) {
  try {
    // Fetch connected users from Redis
    const cachedUsers = (await client?.get("connectedUsers")) as any;
    const connectedUsers = cachedUsers ? JSON.parse(cachedUsers) : [];
    // console.log("Connected users:", connectedUsers);

    // Filter connected users to find admins
    const vendorAdmins = connectedUsers.filter(
      (user: any) =>
        user.role?.toLowerCase() === "admin" && user.vendorId === vendorId
    );

    if (vendorAdmins.length > 0) {
      for (const admin of vendorAdmins) {
        const socket = ioInstance.sockets.sockets?.get(admin.socketId);
        if (socket) {
          // Send the list of connected users within the same vendor to the admin
          const vendorConnectedUsers = connectedUsers.filter(
            (user: any) => user.vendorId === vendorId
          );
          socket.emit("users-activity", vendorConnectedUsers);
        }
      }
    }
  } catch (err) {
    console.error("Error sending notifications to vendor admins:", err);
  }
}

export default userActivityLiveResponse;

//get api for connected users
