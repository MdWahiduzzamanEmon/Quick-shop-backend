import express from "express";
import type { Request, Response, NextFunction } from "express";
import { showResponse } from "../../constant/showResponse";
import { checkUserExist } from "../../services/Auth/auth.service";
import { comparePassword } from "../../Others/SecurePassword";
import exclude from "../../Others/DataExcludeFunction/exclude";
import { cookieResponse, generateToken } from "../../Others/JWT";
import { loggin_status } from "@prisma/client";
import { createLoginHistory } from "../../services/History/LoginHistory/loginHistory.service";
import { StoreInCache } from "../../Redis/redis";

export const authRoute = express.Router();

//login
export type ILoginHistory = {
  userId: string;
  ipAddress?: string;
  device?: string;
  browser?: string;
  os?: string;
  location?: string;
  status: loggin_status;
  otherUsersId?: string;
  note?: string;
};

// Function to parse the OS from User-Agent string (basic example)
function parseOSFromUserAgent(userAgent: any) {
  if (/windows/i.test(userAgent)) return "Windows";
  if (/macintosh|mac os x/i.test(userAgent)) return "MacOS";
  if (/linux/i.test(userAgent)) return "Linux";
  if (/android/i.test(userAgent)) return "Android";
  if (/iphone|ipad/i.test(userAgent)) return "iOS";
  return "Unknown OS";
}

const loginHandler: express.RequestHandler = async (
  req: Request,
  res: Response,
  next: NextFunction
): Promise<void> => {
  try {
    const { email, password, mobile, username } = req.body;

    //   console.log(email, password, mobile);
    //create login history

    const ipAddress = (
      (typeof req.headers["x-forwarded-for"] === "string"
        ? req.headers["x-forwarded-for"]
        : "") ||
      (typeof req.socket.remoteAddress === "string"
        ? req.socket.remoteAddress
        : "") ||
      ""
    )
      .split(",")[0]
      .trim();

    const browser = req.headers["user-agent"] || "";
    const device = req.headers["user-agent"] || "";
    const os = parseOSFromUserAgent(req.headers["user-agent"] || "");

    const location = req.headers["location"] || "Unknown Location";

    //   console.log(req.headers, "login info");

    // check emial or mobile

    if (!email && !mobile && !username) {
      showResponse(res, {
        message: "Please provide an email or mobile number or username",
      });
    }

    //if email then check email format
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (email && !emailRegex.test(email)) {
      showResponse(res, {
        message: "Please provide a valid email",
      });
    }

    if (!password) {
      showResponse(res, {
        message: "Please provide a password",
      });
    }

    //check if user exists
    const existUser = (await checkUserExist(email, mobile)) as any;
    //   console.log(existUser);
    if (!existUser) {
      showResponse(res, {
        status: 404,
        success: false,
        message: "User not found",
      });

      return Promise.resolve();
    }

    // check if the password is correct
    const isPasswordCorrect = await comparePassword(
      password?.toString(),
      existUser?.password
    );

    // if the password is incorrect, return an error message
    if (!isPasswordCorrect) {
      res.status(400).json({
        status: 400,
        message: `Incorrect password`,
      });

      await createLoginHistory({
        userId: existUser?.userId,
        ipAddress,
        device,
        browser,
        os,
        location,
        status: loggin_status.FAILED,
        otherUsersId: existUser?.id,
        note: "Incorrect password",
      });

      return;
    }

    const excludePassword = exclude(existUser, ["password"]);
    // if the password is correct, then generate a token
    const token = await generateToken({
      ...excludePassword,
    });

    //step 1:create a object to store the user data
    const resData = {
      isLogin: true,
      accessToken: token,
      user: {
        ...excludePassword,
      },
    };
    //step 2: set the token in the cookie

    await cookieResponse(res, token);

    showResponse(res, {
      status: 200,
      success: true,
      message: "Login successful",
      data: resData,
    });

    try {
      const result = await createLoginHistory({
        userId: existUser?.userId,
        ipAddress,
        device,
        browser,
        os,
        location,
        status: loggin_status.SUCCESS,
        otherUsersId: existUser?.id,
        note: "Login successful",
      });

      //contact new result in redis store previous result

      if (result) {
        //store in redis
        StoreInCache("login_history", "login_history", result);
      }
    } catch (error: any) {
      next(error);
    }

    //
  } catch (error: any) {
    next(error);
  }
};

authRoute.post("/login", loginHandler);

//register

//logout

//forgot password

//reset password
