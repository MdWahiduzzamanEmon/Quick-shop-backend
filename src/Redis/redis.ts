import { client } from "../server";

// Compress and store in Redis
async function StoreInCache(
  key: string,
  field: string,
  data: any,
  expiry = 3600
) {
  const existingData = await client.hGet(key, field);
  const dataArray = existingData ? JSON.parse(existingData) : [];

  // Push new data to the array
  dataArray.push(data);
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

async function cleanCache(key: string, field: string) {
  const keys = (await client?.keys("*")) || [];
  console.log(keys);

  if (keys.includes(key)) {
    await client.del(key);
  }
  const keys2 = (await client?.keys("*")) || [];
  console.log(keys2, "keys2");

  return true;
}

export { StoreInCache, getFromCache, cleanCache };
