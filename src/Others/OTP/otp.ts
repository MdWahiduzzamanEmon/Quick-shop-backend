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
