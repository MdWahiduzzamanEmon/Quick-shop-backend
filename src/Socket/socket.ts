import { client, ioInstance } from "../server"; // Assuming serverInstance is the HTTP server from server.ts
import userActivityLiveResponse from "./UserLiveActivity/userLiveActivity";

// Initialize socket connections and events
function initializeSocket() {
  console.log("Socket.IO initialized");

  let count = 0;
  let connectedUsers: any[] = [];

  ioInstance.on("connection", async (socket: any) => {
    count++;
    // console.log(`Client connected: ${socket.id} (${count} total)`);
    // console.log(`Client connected: ${socket.IP}`);

    // Safely access user data from the socket
    const user = socket?.user;
    if (!user || !user.email) {
      console.log("No user email associated with this socket connection.");
      return;
    }

    // Emit a welcome message to the connected client
    // socket.emit("message", "Hello, client!");

    // Fetch connected users from Redis
    try {
      const cachedUsers = (await client?.get("connectedUsers")) as any;
      connectedUsers = cachedUsers ? JSON.parse(cachedUsers) : [];

      // Check if the user already exists in the connected users list
      const existingUserIndex = connectedUsers.findIndex(
        (u: any) => u.email === user.email
      );

      if (existingUserIndex === -1) {
        // New user, add them to the list
        connectedUsers.push({
          email: user.email,
          socketId: socket.id,
          role: user.role,
          userUniqueId: user?.id,
          vendorId: user?.vendorId,
          IP:
            socket.handshake.headers["x-forwarded-for"]?.split(",")?.[0] ||
            socket?.remoteAddress ||
            socket?.handshake?.address ||
            "",
        });
      } else {
        // User already exists, update the socket ID
        connectedUsers[existingUserIndex].socketId = socket?.id;
      }

      // Update connected users in Redis
      await client?.set("connectedUsers", JSON.stringify(connectedUsers));
      console.log("Updated connected users:", connectedUsers);
      //send user activity to a specific vendor admin
      await userActivityLiveResponse(user?.vendorId);
    } catch (err) {
      console.error("Error fetching or updating connected users:", err);
    }

    // Handle socket disconnect
    socket.on("disconnect", async () => {
      console.log(`User disconnected: ${socket.id}`);

      // Remove disconnected user from the connected users array
      connectedUsers = connectedUsers.filter(
        (user: any) => user.socketId !== socket.id
      );

      // Update connected users in Redis after disconnect
      await client?.set("connectedUsers", JSON.stringify(connectedUsers));
      //send user activity to a specific vendor admin
      await userActivityLiveResponse(user?.vendorId);
    });
  });
}

export { initializeSocket };
