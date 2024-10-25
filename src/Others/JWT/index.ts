import jsonwebtoken from "jsonwebtoken";
//import cookie-parser
import cookieParser from "cookie-parser";

//generate token

export const generateToken = async (user: any, expiry = "1h") => {
  const token = jsonwebtoken.sign(user, process.env.JWT_SECRET_KEY as string, {
    //expire in 1 hour
    expiresIn: expiry,
    algorithm: "HS256",
  });
  //   add token with bearer
  // return `Bearer ${token}`;
  return `${token}`;
};

//verify token

export const verifyToken = async (token: string) => {
  try {
    // Remove 'Bearer ' if it's present
    if (token.startsWith("Bearer ")) {
      token = token.slice(7, token?.length); // Remove the 'Bearer ' prefix
    }

    // Now verify the token
    const decoded = jsonwebtoken.verify(
      token,
      process.env.JWT_SECRET_KEY as string
    );
    return decoded;
  } catch (err) {
    throw new Error("Invalid token");
  }
};

//verify token middleware

export const verifyTokenMiddleware = async (req: any, res: any, next: any) => {
  // const BearerToken = req.headers.authorization; //get token from header

  //get token from cookie
  const headerToken = req.headers.authorization;
  const BearerToken = `Bearer ${req.cookies.token}`;
  // console.log(BearerToken, "BearerToken");
  // console.log(headerToken == BearerToken, "headerToken");
  if (headerToken !== BearerToken) {
    return res.status(401).json({ message: "Unauthorized" });
  }

  // console.log(BearerToken, "BearerToken");

  const token = BearerToken?.split(" ")?.[1];
  // console.log(token);
  if (!token) {
    res.clearCookie("token");
    return res.status(401).json({ message: "Unauthorized" });
  }
  try {
    const result = await verifyToken(token);
    req.user = result;
    next();
  } catch (error: any) {
    res.clearCookie("token");
    return res.status(401).json({ message: "Unauthorized" });
  }
};

export const cookieResponse = async (res: any, token: string) => {
  // expire in 1 hour
  const oneHour = 60 * 60 * 1000; // 1 hour
  res.cookie("token", token, {
    httpOnly: true,
    secure: process.env.NODE_ENV === "production", // Use secure only in production
    sameSite: "none", // Allows cross-site
    maxAge: oneHour,
  });
  return res;
};
