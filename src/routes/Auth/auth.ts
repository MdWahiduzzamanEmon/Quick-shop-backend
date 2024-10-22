import express from "express";
import type { Request, Response, NextFunction } from "express";
import { showResponse } from "../../constant/showResponse";
import { checkUserExist, register } from "../../services/Auth/auth.service";
import { comparePassword, hashPassword } from "../../Others/SecurePassword";
import exclude from "../../Others/DataExcludeFunction/exclude";
import { cookieResponse, generateToken } from "../../Others/JWT";
import { loggin_status, Role } from "@prisma/client";
import { createLoginHistory } from "../../services/History/LoginHistory/loginHistory.service";
import { StoreInCache } from "../../Redis/redis";
import { leftPushToList } from "../../Redis";
import {
  unlinkFile,
  uploadMiddleware,
} from "../../Others/File/fileUploadController";
import axios from "axios";

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

//get location from ip

export const trackIpLocation = async (ip: string, query: any = 61439) => {
  try {
    const response = await axios.get(
      `http://ip-api.com/json/${ip}/?fields=${query}`
    );
    // console.log(response.data, 'response.data');
    return response.data;
  } catch (error) {
    return error;
  }
};

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
    const existUser = (await checkUserExist(email, mobile, username)) as any;
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

      //create login history
      const IP = await trackIpLocation(ipAddress);
      const dataRes = await createLoginHistory({
        userId: existUser?.userId,
        ipAddress,
        device,
        browser,
        os,
        location: `${IP?.country},${IP?.region},${IP?.city}`,
        status: loggin_status.FAILED,
        otherUsersId: existUser?.id,
        note: "Incorrect password",
      });
      await leftPushToList("login-history", dataRes);
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
      const IP = await trackIpLocation(ipAddress);
      const result = await createLoginHistory({
        userId: existUser?.userId,
        ipAddress,
        device,
        browser,
        os,
        location: `${IP?.country},${IP?.region},${IP?.city}`,
        status: loggin_status.SUCCESS,
        otherUsersId: existUser?.id,
        note: "Login successful",
      });

      //contact new result in redis store previous result

      if (result) {
        //store in redis
        await leftPushToList("login-history", result);
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

const registerHandler: express.RequestHandler = async (
  req: Request,
  res: Response,
  next: NextFunction
): Promise<void> => {
  const reqData = req as any;
  try {
    const { email, mobile, firstName, lastName, username, password, role } =
      reqData.body;
    const profile_picture = reqData?.fileUrl?.[0] || {};

    // console.log(profile_picture);

    if (!email || !mobile || !username) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Please provide email ,mobile number and username",
      });
      return;
    }

    //if email then check email format
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (email && !emailRegex.test(email)) {
      showResponse(res, {
        message: "Please provide a valid email",
      });
      await unlinkFile(profile_picture?.filename);
      return;
    }

    //vlaidate username
    const usernameRegex = /^[a-zA-Z0-9_]{1,15}$/;

    if (username && !usernameRegex.test(username)) {
      showResponse(res, {
        message:
          "Please provide a valid username. Username must be alphanumeric and less than 15 characters",
      });
      await unlinkFile(profile_picture?.filename);
      return;
    }

    //check if user already exist
    const existUser = await checkUserExist(email, mobile, username);
    if (existUser) {
      showResponse(res, {
        status: 400,
        success: false,
        message: `User already exist with your provided email, mobile or username.Please login or change your email, mobile or username to continue`,
      });
      await unlinkFile(profile_picture?.filename);
      return;
    }

    const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;

    if (!password || !passwordRegex.test(password)) {
      showResponse(res, {
        message:
          "Please provide a valid password. It must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, and one number",
      });
      await unlinkFile(profile_picture?.filename);
      return;
    }

    if (role && Role[role as keyof typeof Role] === undefined) {
      await unlinkFile(profile_picture?.filename);
      showResponse(res, {
        status: 400,
        success: false,
        message:
          "Please provide a valid role. If you did't know, then contact our support",
      });

      return;
    }

    //make password hash
    const hashedPassword = await hashPassword(password);
    //create user
    const user = await register(
      email,
      mobile,
      firstName,
      lastName,
      username,
      hashedPassword,
      profile_picture,
      role
    );

    if (!user) {
      await unlinkFile(profile_picture?.filename);

      showResponse(res, {
        status: 400,
        success: false,
        message: "User creation failed",
      });
      return;
    }

    showResponse(res, {
      message: "User created successfully",
    });
    return;
  } catch (error: any) {
    await unlinkFile(reqData?.fileUrl?.[0]?.filename as unknown as any);
    next(error);
  }
};

authRoute.post("/register", uploadMiddleware, registerHandler);

//logout

//forgot password

//reset password
