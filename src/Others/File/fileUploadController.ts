// import multer from "multer";
// import fs from "fs";
// import { v2 as cloudinary } from "cloudinary";
// // Multer Configuration

// let storage = multer.diskStorage({
//   destination: function (req, file, cb) {
//     cb(null, "uploadFile");
//   },
//   filename: function (req, file, cb) {
//     const modifyFileName = `${
//       new Date().toISOString().split("T")[0]
//     }-${Math.floor(Math.random() * 1000)}-${file.originalname}`;

//     fs.exists("uploadFile", (exist) => {
//       if (!exist) {
//         return fs.mkdir("uploadFile", (error) => cb(null, modifyFileName));
//       }
//     });
//     cb(null, modifyFileName);
//   },
// });

// export const upload = multer({ storage: storage });

// export const uploadMiddleware = async (req: any, res: any, next: any) => {
//   const upload = multer({ storage: storage }).any();

//   upload(req, res, function (err: any) {
//     if (err instanceof multer.MulterError) {
//       return res.status(500).json({ message: err });
//     } else if (err) {
//       return res.status(500).json({ message: err });
//     }

//     // [{
//     //   fieldname: 'nidORbirth_image',
//     //   originalname: '1673576127630.jpeg',
//     //   encoding: '7bit',
//     //   mimetype: 'image/jpeg',
//     //   destination: 'uploadFile',
//     //   filename: '2023-08-05-1673576127630.jpeg',
//     //   path: 'uploadFile/2023-08-05-1673576127630.jpeg',
//     //   size: 85172
//     // }]
//     // send with field name and path
//     req.fileUrl =
//       req?.files?.length > 0
//         ? req.files.map((file: any) => {
//             return {
//               fieldName: file.fieldname,
//               filename: file.filename,
//               url: `${process.env.LIVE_URL}/media/${file.filename}`,
//               extension: file?.mimetype.split("/")[1],
//               size: file.size,
//             };
//           })
//         : [];
//     next();
//   });
// };

// export const fileUploadAndGetUrlFunc = async (file: any) => {
//   const { buffer, mimetype, originalname } = file;
//   const fileName = `${new Date().toISOString().split("T")[0]}-${originalname}`;

//   fs.writeFile(`uploadFile/${fileName}`, buffer, (err) => {
//     if (err) {
//       return { message: err.message };
//     }
//   });
//   return {
//     path: `${process.env.LIVE_URL}/media/${fileName}`,
//     extension: mimetype.split("/")[1],
//   };
// };

// //unlink file from folder

// export const unlinkFile = async (fileName: any) => {
//   // console.log(fileName);
//   try {
//     fs.unlink("uploadFile/" + fileName, (err) => {
//       if (err) {
//         return { message: "Error deleting file" };
//       } else {
//         console.log("File deleted successfully");
//         return { message: "File deleted successfully" };
//       }
//     });
//   } catch (err) {
//     console.log(err);
//     return { message: "Error deleting file" };
//   }
// };

// //middleware for file unlink

// export const unlinkFileMiddleware = async (req: any, res: any, next: any) => {
//   const { fileUrl } = req as any;
//   if (fileUrl) {
//     try {
//       fs.unlink("uploadFile/" + fileUrl?.[0]?.path.split("/")[4], (err) => {
//         if (err) {
//           return res.status(400).json({ message: "Error deleting file" });
//         } else {
//           console.log("File deleted successfully");
//           next();
//         }
//       });
//     } catch (err) {
//       console.log(err);
//       return res.status(500).json({ message: "Error deleting file" });
//     }
//   } else {
//     next();
//   }
// };

import multer from "multer";
import { v2 as cloudinary } from "cloudinary";
import streamifier from "streamifier"; // To handle buffer uploads to Cloudinary
import { Request, Response, NextFunction } from "express";

// Cloudinary Configuration
cloudinary.config({
  cloud_name: process.env.CLOUDINARY_CLOUD_NAME,
  api_key: process.env.CLOUDINARY_API_KEY,
  api_secret: process.env.CLOUDINARY_API_SECRET,
  // secure: true, // Use HTTPS
});

// Multer Configuration
let storage = multer.memoryStorage(); // Store files in memory instead of local disk

export const upload = multer({ storage: storage });

export const uploadMiddleware = async (
  req: any,
  res: Response,
  next: NextFunction
) => {
  const upload = multer({ storage: storage }).any();

  upload(req, res, function (err) {
    if (err instanceof multer.MulterError) {
      return res.status(500).json({ message: err });
    } else if (err) {
      return res.status(500).json({ message: err });
    }

    // Upload each file to Cloudinary
    const uploadPromises = req.files
      ? (req.files as Express.Multer.File[]).map((file) =>
          uploadToCloudinary(file)
        )
      : [];

    Promise.all(uploadPromises)
      .then((results: any) => {
        // Map the Cloudinary results to the required response format
        req.fileUrl = results.map((result: any) => ({
          fieldName: result.fieldName,
          filename: result.filename,
          url: result.url,
          extension: result.extension,
          size: result.size,
          publicId: result.publicId,
        }));
        next();
      })
      .catch((error) => {
        return res.status(500).json({ message: error.message });
      });
  });
};

const uploadToCloudinary = (file: Express.Multer.File) => {
  return new Promise((resolve, reject) => {
    const uploadStream = cloudinary.uploader.upload_stream(
      {
        folder: "uploads", // Optimization options
        transformation: [
          {
            quality: "auto", // Adjust quality automatically
            fetch_format: "auto", // Use the most efficient format (e.g., WebP if supported)
            width: 800, // Resize width to 800px (optional)
            height: 600, // Resize height to 600px (optional)
            crop: "limit", // Crop to maintain aspect ratio
            flags: "lossy", // Enable lossy compression (optional)
            dpr: "auto", // Set the DPR (optional):it will help to reduce the file size
            effect: "sharpen:150", // Apply a sharpening effect (optional)
          },
        ],
      }, // Specify the folder in Cloudinary
      (error, result: any) => {
        if (error) {
          reject(error);
        } else {
          resolve({
            fieldName: file.fieldname,
            filename: file.originalname,
            url: result.secure_url,
            extension: file.mimetype.split("/")[1],
            size: file.size,
            publicId: result.public_id, // Store the public_id for later use
          });
        }
      }
    );

    // Stream the file's buffer to Cloudinary
    streamifier.createReadStream(file.buffer).pipe(uploadStream);
  });
};

// No need for local file save, directly upload to Cloudinary
export const fileUploadAndGetUrlFunc = async (file: Express.Multer.File) => {
  try {
    const result = (await uploadToCloudinary(file)) as any;
    return {
      path: result.url,
      extension: result.extension,
      publicId: result.publicId,
      size: result.size,
      fieldName: result.fieldName,
      filename: result.filename,
      url: result.url,
    };
  } catch (err) {
    return { message: (err as Error).message };
  }
};

// Cloudinary deletion based on public_id
export const unlinkFile = async (publicId: string) => {
  try {
    // Assuming the fileName contains the public_id without the file extension
    await cloudinary.uploader.destroy(publicId);
    console.log("File deleted successfully");
    return { message: "File deleted successfully" };
  } catch (err) {
    console.log(err);
    return { message: "Error deleting file" };
  }
};

// Middleware for Cloudinary file unlink
export const unlinkFileMiddleware = async (req: any, res: any, next: any) => {
  const { fileUrl } = req;
  if (fileUrl) {
    try {
      const publicId = fileUrl[0].publicId; // Access the stored publicId
      await cloudinary.uploader.destroy(publicId);
      console.log("File deleted successfully");
      next();
    } catch (err) {
      console.log(err);
      return res.status(500).json({ message: "Error deleting file" });
    }
  } else {
    next();
  }
};
