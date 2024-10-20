import crypto from "crypto";

export function generateHashEtag(data: any): string {
  const hash = crypto.createHash("sha1");
  hash.update(JSON.stringify(data));
  return hash.digest("hex");
}
