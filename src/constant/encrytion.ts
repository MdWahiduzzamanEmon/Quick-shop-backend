import cryptoJS from "crypto-js";

const SECRET_KEY = "Hello_Haat"; // Corrected spelling

const encryptData = (data: any) => {
  if (!data) return null;
  try {
    const encryptedData = cryptoJS.AES.encrypt(data, SECRET_KEY).toString();
    return encryptedData;
  } catch (error) {
    console.error("Encryption error:", error);
    return null;
  }
};
const decryptData = (data: any) => {
  if (!data) {
    console.error("No data to decrypt");
    return null;
  }

  // console.log(data);
  const splitData = data.split(" ")?.[1];
  // console.log(data.split(" "), "splitData");

  try {
    const bytes = cryptoJS.AES.decrypt(splitData, SECRET_KEY);
    const decryptedData = bytes.toString(cryptoJS.enc.Utf8);

    // console.log(decryptedData, "decryptedData");

    if (!decryptedData) {
      console.error("Decryption error:", decryptedData);
      return null;
    }

    return `${data.split(" ")[0]} ${decryptedData}`;
  } catch (error) {
    console.error("Decryption error:", error);
    return null;
  }
};

export { encryptData, decryptData };
