import otpGenerator from "otp-generator";

const generateOTP = () => {
  const otp = otpGenerator.generate(4, {
    digits: true,
    upperCaseAlphabets: false,
    specialChars: false,
    lowerCaseAlphabets: false,
  });
  return otp;
};

export default generateOTP;

export const generateUniqueID = (type: string, length: number = 8) => {
  return `${type}-${otpGenerator.generate(length, {
    digits: true,
    upperCaseAlphabets: true,
    specialChars: false,
    lowerCaseAlphabets: false,
  })}`;
};
