import { db } from "../src/utils/db.server";
import { hashPassword } from "../src/Others/SecurePassword/index";

async function seed() {
  const convertHashedPassword = await hashPassword("1516");

  await db.user.create({
    data: {
      otherUsers: {
        create: {
          firstName: "admin",
          lastName: "admin",
          username: "admin",
          email: "admin@admin.com",
          mobile: "123456789",
          password: convertHashedPassword,
          role: "ADMINISTRATOR",
        },
      },
    },
  });
}

seed()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await db.$disconnect();
  });
