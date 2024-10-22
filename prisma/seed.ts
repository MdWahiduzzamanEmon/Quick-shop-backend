import { db } from "../src/utils/db.server";
import { hashPassword } from "../src/Others/SecurePassword/index";

async function seed() {
  const convertHashedPassword = await hashPassword("1516");

  await db.user.create({
    data: {
      username: "admin",
      password: convertHashedPassword,
      mobile: "123456789",
      email: "admin@admin.com",
      otherUsers: {
        create: {
          firstName: "admin",
          lastName: "admin",
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
