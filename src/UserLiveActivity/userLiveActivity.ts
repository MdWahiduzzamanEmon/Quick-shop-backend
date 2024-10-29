import { client, ioInstance } from "../server";

async function userActivityLiveResponse() {
  try {
    // Fetch connected users from Redis
    const cachedUsers = (await client?.get("connectedUsers")) as any;
    const connectedUsers = cachedUsers ? JSON.parse(cachedUsers) : [];
    // console.log("Connected users:", connectedUsers);

    // Filter connected users to find admins
    const adminUser = connectedUsers.filter(
      (user: any) => user.role?.toLowerCase() === "admin"
    );

    if (adminUser?.length > 0) {
      // const socket = ioInstance.sockets.sockets?.get(adminUser?.socketId);
      // if (socket) {
      //   //send to admin all the client who are online
      //   socket.emit("users-activity", connectedUsers);
      // }

      for (const user of adminUser) {
        const socket = ioInstance.sockets.sockets?.get(user.socketId);
        if (socket) {
          //send to admin all the client who are online
          socket.emit("users-activity", connectedUsers);
        }
      }
    }

    // console.log("Notifications sent to admins:", adminUser);
  } catch (err) {
    console.error("Error sending notifications to admins:", err);
  }
}

export default userActivityLiveResponse;

//get api for connected users
