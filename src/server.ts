import express from "express";
import cors from "cors";
import helmet from "helmet";
import morgan from "morgan";
import bodyParser from "body-parser";
import { config } from "dotenv";
import initializeRedis from "./Redis/redis.conf";
import rateLimit from "express-rate-limit";
import fs from "fs";
import cookieParser from "cookie-parser";
import responseTime from "response-time";
import { corsOptions } from "./constant";
import { createServer } from "http";
import ErrorHandler from "./middlewares/errorHandle";
import { routes } from "./paths";
import { Server as SocketIOServer } from "socket.io";
import { initializeSocket } from "./Socket/socket";
import { verifyToken } from "./Others/JWT";

config();

// Initialize Express and HTTP server
const app = express();
export const serverInstance = createServer(app);

// Middlewares
app.use(cors(corsOptions));
app.use(express.json());
app.use(bodyParser.json());
app.use(cookieParser());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.urlencoded({ extended: true }));
app.use(responseTime());
app.use("/media", express.static("uploadFile"));

// Log middleware
const makeLogFolder = async () => {
  const date = new Date();
  const folderName = `./logs/${date.getFullYear()}-${
    date.getMonth() + 1
  }-${date.getDate()}`;
  if (!fs.existsSync(folderName)) {
    fs.mkdirSync(folderName, { recursive: true });
  }
  return folderName;
};

app.use(
  morgan("combined", {
    stream: {
      write: async (message) => {
        const logFolder = await makeLogFolder();
        fs.appendFile(`${logFolder}/access.log`, message + "\n", (err) => {
          if (err) {
            console.error(err);
          }
        });
      },
    },
  })
);

// Rate Limiting
const limiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 100, // Limit each IP to 100 requests per window
});

app.use(limiter);
app.use(
  helmet({
    contentSecurityPolicy: false,
    crossOriginEmbedderPolicy: false,
    crossOriginOpenerPolicy: false,
    crossOriginResourcePolicy: false,
  })
);

// Register routes dynamically
for (const route of routes) {
  app.use("/api/v1", route);
}

//redis client connection
export let client: any;

initializeRedis()
  .then((redisClient) => {
    client = redisClient;
    console.log("Redis initialized successfully");
    // Redis is ready, but it won't block the rest of the server if there is a delay.
  })
  .catch((err) => {
    console.error("Error initializing Redis:", err);
    // Log the error but continue starting the server
  });

// Initialize Socket.IO with CORS options
export const ioInstance = new SocketIOServer(serverInstance, {
  cors: corsOptions,
});

// Socket.IO middleware to extract cookies and authenticate users
ioInstance.use((socket, next) => {
  const SOCKET = socket as any;
  const req = SOCKET.request as any; // Cast to any to access cookies
  // const getExtraHeadersAuth = req?.headers?.authorization; // Get token from headers for when using http
  const getExtraHeadersAuth = socket.handshake.query.token; // Get token from query fro when using socket.io transport websocket
  // console.log(getExtraHeadersAuth, "getExtraHeaders");

  const res = {} as any; // Mock response object for cookieParser

  if (!getExtraHeadersAuth) {
    SOCKET.user = null;
    return next(new Error("Authentication error: No token provided"));
  }

  // Parse cookies using cookie-parser
  cookieParser()(req, res, async () => {
    const token = req?.cookies?.token;

    // console.log(token, "token");
    if (!token) {
      return next(new Error("Authentication error: No token provided"));
    }

    try {
      const verifiedToken = await verifyToken(token);
      SOCKET.user = verifiedToken; // Attach user info to socket
      next();
    } catch (err) {
      next(new Error("Authentication error: Invalid token"));
    }
  });
});

// Initialize Socket.IO events
initializeSocket();

app.get("/", (req, res) => {
  res.send("Hello World");
});

//error middleware

app.use(ErrorHandler);

app.get("/clearCache", async (_req, res) => {
  const keys = (await client?.keys("*")) || [];
  console.log(keys);
  //clear cache
  for (const key of keys) {
    await client.del(key);
  }
  res.send("Cache cleared successfully");
});

const PORT: number = parseInt(process.env.PORT || "4000", 10);

serverInstance.listen(PORT, () => {
  console.log(`Server running on port http://localhost:${PORT}`);
});
