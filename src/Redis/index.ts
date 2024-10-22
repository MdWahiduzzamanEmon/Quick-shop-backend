import { client } from "../server";

// Function to set initial array in Redis
const setInitialArray = async (listKey: string, initialArray: any[]) => {
  try {
    // Use RPUSH to set the initial array
    await client.rPush(
      listKey,
      initialArray.map((item) => JSON.stringify(item))
    );
    // console.log(`Initialized ${listKey} with array:`, initialArray);
  } catch (error) {
    console.error("Error initializing array in Redis:", error);
  }
};

// Function to Left Push an item into a Redis List
const leftPushToList = async (listKey: string, value: any) => {
  try {
    await client.lPush(listKey, JSON.stringify(value));
    console.log(`Pushed ${value} to ${listKey}`);
  } catch (error) {
    console.error("Error pushing to Redis list:", error);
  }
};

// Function to retrieve the list from Redis
const getListFromRedis = async (listKey: string) => {
  try {
    const list = await client.lRange(listKey, 0, -1);
    // console.log(`Retrieved list from ${listKey}:`, list);
    const parsedList = list?.map((item) => JSON.parse(item));

    return parsedList;
  } catch (error) {
    console.error("Error retrieving list from Redis:", error);
    return [];
  }
};

export { setInitialArray, leftPushToList, getListFromRedis };
