// In-memory cache implementation
type CacheStore = {
  [key: string]: { data: any; expiresAt: number };
};

const cache: CacheStore = {};

// Function to set data in the cache
const setCache = (key: string, data: any, expirySeconds: number = 3600) => {
  const expiresAt = Date.now() + expirySeconds * 1000; // Calculate expiry timestamp in milliseconds = expirySeconds * 1000=> 1 hour
  cache[key] = { data, expiresAt };
};

// Function to get data from the cache
const getCache = (key: string): any | null => {
  const cachedItem = cache[key];

  if (!cachedItem) return null;

  // Check if the cache has expired
  if (Date.now() > cachedItem.expiresAt) {
    delete cache[key]; // Remove expired item
    return null;
  }

  return cachedItem.data;
};

export { setCache, getCache };
