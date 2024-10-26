import { client, ioInstance } from "../server";

async function userActivityLiveResponse() {
  try {
    // Fetch connected users from Redis
    const cachedUsers = await client.get("connectedUsers");
    const connectedUsers = cachedUsers ? JSON.parse(cachedUsers) : [];

    // Filter connected users to find admins
    const adminUser = connectedUsers.find(
      (user: any) => user.role?.toLowerCase() === "admin"
    );

    if (adminUser?.socketId) {
      const socket = ioInstance.sockets.sockets.get(adminUser?.socketId);
      if (socket) {
        //send to admin all the client who are online
        socket.emit("users-activity", connectedUsers);
      }
    }

    // console.log("Notifications sent to admins:", adminUser);
  } catch (err) {
    console.error("Error sending notifications to admins:", err);
  }
}

export default userActivityLiveResponse;




//get api for connected users
