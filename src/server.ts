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

app.get("/clearCache", async (_req, res) => {
  const keys = (await client?.keys("*")) || [];
  console.log(keys);
  //clear cache
  for (const key of keys) {
    await client.del(key);
  }
  res.send("Cache cleared successfully");
});

app.get("/", (req, res) => {
  res.send("Hello World");
});

//error middleware

app.use(ErrorHandler);

const PORT: number = parseInt(process.env.PORT || "4000", 10);

serverInstance.listen(PORT, () => {
  console.log(`Server running on port http://localhost:${PORT}`);
});
