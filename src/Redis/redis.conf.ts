import { createClient } from "redis";

// redis.conf (Redis configuration file)

async function initializeRedis() {
  const redisClient = createClient({
    url: process.env.REDIS_URL || "redis://localhost:6379",
    socket: {
      reconnectStrategy: (retries) => {
        if (retries > 20) {
          console.error(
            "Too many attempts to reconnect. Redis connection was terminated."
          );
          return new Error("Too many retries.");
        }
        return Math.min(retries * 50, 500); // Reconnect after 500ms * retries
      },
    },
  });

  redisClient.on("connect", () => {
    console.log("Redis connected");
  });

  redisClient.on("error", (err) => {
    console.error("Redis error:", err);
  });

  redisClient.on("end", () => {
    console.log("Redis connection ended");
  });

  // Connect and ping Redis
  await redisClient.connect();

  try {
    const pingResponse = await redisClient.ping();
    console.log("Redis Ping Response:", pingResponse); // Should log "PONG"
  } catch (err) {
    console.error("Error pinging Redis:", err);
  }

  return redisClient;
}

export default initializeRedis;
