import { client } from "../server";

// Compress and store in Redis
async function StoreInCache(
  key: string,
  field: string,
  data: any,
  expiry = 3600
) {
  // Store binary data directly in Redis
  await client.hSet(key, field, JSON.stringify(data));
  await client.expire(key, expiry);
}

async function getFromCache(key: string, field: string) {
  // Retrieve binary data directly from Redis

  // rule :client.hGet(key, field) returns a promise
  // rule for query:

  const data = await client.hGet(key, field);
  return JSON.parse(data);
}

export { StoreInCache, getFromCache };
