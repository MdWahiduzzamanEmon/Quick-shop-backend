const corsOptions = {
  origin: process.env.CLIENT_URL || "http://localhost:5173", // Use environment variable if available
  optionsSuccessStatus: 200,
  credentials: true,
  exposeHeaders: ["Set-Cookie", "Access-Control-Allow-Credentials", "ETag"],
  methods: ["GET", "POST", "PUT", "DELETE"],
};

export { corsOptions };