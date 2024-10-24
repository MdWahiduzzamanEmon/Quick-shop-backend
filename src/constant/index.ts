const corsOptions = {
  origin: process.env.CLIENT_URL || "http://localhost:5173", // Use environment variable if available
  optionsSuccessStatus: 200,
  credentials: true,
  exposeHeaders: ["Set-Cookie", "Access-Control-Allow-Credentials", "ETag"],
  methods: ["GET", "POST", "PUT", "DELETE"],
};

export { corsOptions };

export const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;
export const usernameRegex = /^[a-zA-Z0-9_]{1,15}$/;
export const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
