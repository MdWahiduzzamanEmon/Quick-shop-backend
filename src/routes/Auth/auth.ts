import express from "express";
import type { Request, Response, NextFunction } from "express";
import { showResponse } from "../../constant/showResponse";
import {
  checkUserExist,
  deleteUser,
  customerRegister,
  workerRegister,
} from "../../services/Auth/auth.service";
import { comparePassword, hashPassword } from "../../Others/SecurePassword";
import exclude from "../../Others/DataExcludeFunction/exclude";
import {
  cookieResponse,
  generateToken,
  verifyTokenMiddleware,
} from "../../Others/JWT";
import { loggin_status, Role, WorkerRole } from "@prisma/client";
import { createLoginHistory } from "../../services/History/LoginHistory/loginHistory.service";
// import { StoreInCache } from "../../Redis/redis";
import { leftPushToList } from "../../Redis";
import {
  unlinkFile,
  uploadMiddleware,
} from "../../Others/File/fileUploadController";
import axios from "axios";
import { emailRegex, passwordRegex, usernameRegex } from "../../constant";
import errorMessage from "../../Others/ErrorMessage/errorMessage";
// import userActivityLiveResponse from "../../UserLiveActivity/userLiveActivity";

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

export const trackIpLocation = async (
  ip: string
  // query: any = 61439
) => {
  try {
    const response = await axios.get(
      `http://ip-api.com/json/${ip?.toString()}`
    );
    // console.log(response.data, "response.data");
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

    // const location = req.headers["location"] || "Unknown Location";
    //   console.log(req.headers, "login info");

    // check emial or mobile

    if (!email && !mobile && !username) {
      showResponse(res, {
        message: "Please provide an email or mobile number or username",
      });
    }

    //if email then check email format

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
        userId: existUser?.id,
        ipAddress,
        device,
        browser,
        os,
        location: `${IP?.country},${IP?.region},${IP?.city}`,
        status: loggin_status.FAILED,
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

    // await userActivityLiveResponse();

    try {
      const IP = await trackIpLocation(ipAddress);
      // console.log(IP, "IP");
      const result = await createLoginHistory({
        userId: existUser?.id,
        ipAddress,
        device,
        browser,
        os,
        location: `${IP?.country},${IP?.region},${IP?.city}`,
        status: loggin_status.SUCCESS,
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
    errorMessage(res, error, next);
  }
};

//customerRegister

const customerRegisterHandler: express.RequestHandler = async (
  req: Request,
  res: Response,
  next: NextFunction
): Promise<void> => {
  const reqData = req as any;
  try {
    const {
      email,
      mobile,
      firstName,
      lastName,
      username,
      password,
      role,
      vendorId,
    } = reqData.body;
    const profile_picture = reqData?.fileUrl?.[0] || {};

    // console.log(profile_picture);

    if (!vendorId) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Please provide vendor id",
      });
      return;
    }

    if (!email || !mobile || !username) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Please provide email ,mobile number and username",
      });
      return;
    }

    //if email then check email format

    if (email && !emailRegex.test(email)) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Please provide a valid email",
      });
      await unlinkFile(profile_picture?.publicId);
      return;
    }

    //validate username

    if (username && !usernameRegex.test(username)) {
      showResponse(res, {
        status: 400,
        success: false,
        message:
          "Please provide a valid username. Username must be alphanumeric and less than 15 characters",
      });
      await unlinkFile(profile_picture?.publicId);
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
      await unlinkFile(profile_picture?.publicId);
      return;
    }

    if (!password) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Please provide password",
      });
      await unlinkFile(profile_picture?.publicId);
      return;
    }

    if (!passwordRegex.test(password)) {
      showResponse(res, {
        status: 400,
        success: false,
        message:
          "Please provide a valid password. It must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, and one number",
      });
      await unlinkFile(profile_picture?.publicId);
      return;
    }

    if (role && Role[role as keyof typeof Role] === undefined) {
      await unlinkFile(profile_picture?.publicId);
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
    const user = await customerRegister(
      email,
      mobile,
      firstName,
      lastName,
      username,
      hashedPassword,
      profile_picture,
      role,
      vendorId
    );

    if (!user) {
      await unlinkFile(profile_picture?.publicId);

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
    if (reqData?.fileUrl?.[0]?.publicId) {
      await unlinkFile(reqData?.fileUrl?.[0]?.publicId);
    }
    next(error);
  }
};

//employee-register

export type EmployeeRegisterType = {
  fullName?: string;
  username: string;
  role?: WorkerRole;
  fatherName?: string;
  whatsapp?: string;
  mobile: string;
  NID?: string;
  education?: string;
  bankName?: string;
  branchName?: string;
  accountNumber?: string;
  mobileBanking?: string;
  mobileBankingNumber?: string;
  address?: string;
  zipCode?: string;
  email?: string;
  password?: string;
};

const employeeRegisterHandler: express.RequestHandler = async (
  req: Request,
  res: Response,
  next: NextFunction
): Promise<void> => {
  const reqData = req as any;
  const { vendorId: TOKEN_VENDOR_ID } = reqData?.user;

  const { user } = reqData;
  // console.log(user);
  try {
    if (user?.role !== "ADMIN") {
      showResponse(res, {
        status: 403,
        success: false,
        message: "Unauthorized access.Only Admin can perform this action",
      });
      return;
    }

    const {
      fullName,
      username,
      role,
      fatherName,
      whatsapp,
      mobile,
      NID,
      education,
      bankName,
      branchName,
      accountNumber,
      mobileBanking,
      mobileBankingNumber,
      address,
      zipCode,
      email,
      password,
      vendorId,
    } = reqData.body;

    if (!vendorId) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Please provide vendor id",
      });
      return;
    }

    if (TOKEN_VENDOR_ID !== vendorId) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Please provide valid vendor id",
      });
      return;
    }
    //check if checkWorkerExist already exist
    // console.log(reqData?.fileUrl);
    const existWorker = await checkUserExist(email, mobile, username);

    if (existWorker) {
      showResponse(res, {
        status: 400,
        success: false,
        message:
          "Employee already exist with your provided email or mobile number .Please login or change your email, mobile or username to continue",
      });
      for (let i = 0; i < reqData?.fileUrl?.length; i++) {
        await unlinkFile(reqData?.fileUrl[i]?.publicId as unknown as any);
      }
      return;
    }

    //make password hash
    if (!password) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Please provide password",
      });
      return;
    }
    const hashedPassword = await hashPassword(password);

    //email
    if (email && !emailRegex.test(email)) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Please provide a valid email",
      });
      return;
    }

    //mobile
    if (!mobile) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Please provide mobile number",
      });
      return;
    }

    //role
    if (role && WorkerRole[role as keyof typeof WorkerRole] === undefined) {
      showResponse(res, {
        status: 400,
        success: false,
        message:
          "Please provide a valid role. If you did't know, then contact our support",
      });
      for (let i = 0; i < reqData?.fileUrl?.length; i++) {
        await unlinkFile(reqData?.fileUrl[i]?.publicId);
      }
      return;
    }

    //surname
    if (username && !usernameRegex.test(username)) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "Please provide a valid surname",
      });
      return;
    }

    //create worker
    const body = {
      fullName,
      username,
      role,
      fatherName,
      whatsapp,
      mobile,
      NID,
      education,
      bankName,
      branchName,
      accountNumber,
      mobileBanking,
      mobileBankingNumber,
      address,
      zipCode,
      email,
      password: hashedPassword,
      TOKEN_VENDOR_ID,
    };

    //NID image + profile picture

    for (let i = 0; i < reqData?.fileUrl?.length; i++) {
      body[reqData?.fileUrl[i]?.fieldName as keyof typeof body] = {
        url: reqData?.fileUrl[i]?.url,
        filename: reqData?.fileUrl[i]?.filename,
        extension: reqData?.fileUrl[i]?.extension,
        size: reqData?.fileUrl[i]?.size,
      };
    }

    // console.log(body);

    const worker = await workerRegister(body);

    if (!worker) {
      for (let i = 0; i < reqData?.fileUrl?.length; i++) {
        await unlinkFile(reqData?.fileUrl[i]?.publicId as unknown as any);
      }
      showResponse(res, {
        status: 400,
        success: false,
        message: "Employee creation failed",
      });
      return;
    }

    showResponse(res, {
      message: `A new ${role} has been created successfully`,
    });
    return;
  } catch (error: any) {
    errorMessage(res, error, next);

    for (let i = 0; i < reqData?.fileUrl?.length; i++) {
      await unlinkFile(reqData?.fileUrl[i]?.publicId as unknown as any);
    }
  }
};

//logout

//forgot password

//reset password

//delete User
const deleteUserHandler: express.RequestHandler = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  try {
    const { id } = req.params;
    const deletedWorker = await deleteUser(id);
    if (!deletedWorker) {
      showResponse(res, {
        status: 400,
        success: false,
        message: "User deletion failed",
      });
      return;
    }
    showResponse(res, {
      message: "User deleted successfully",
    });
  } catch (error: any) {
    errorMessage(res, error, next);
  }
};

authRoute.post("/login", loginHandler);

authRoute.post("/customer-register", uploadMiddleware, customerRegisterHandler);

authRoute.post(
  "/employee-register",
  verifyTokenMiddleware,
  uploadMiddleware,
  employeeRegisterHandler
);
authRoute.delete("/delete-user/:id", verifyTokenMiddleware, deleteUserHandler);
