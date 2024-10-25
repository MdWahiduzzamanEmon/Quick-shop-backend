const corsOptions = {
  origin: ["http://localhost:5173"], // or use environment variable for production
  optionsSuccessStatus: 200,
  credentials: true,
  methods: ["GET", "POST", "PUT", "DELETE"],
};

export { corsOptions };

export const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;
export const usernameRegex = /^[a-zA-Z0-9_]{1,15}$/;
export const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
