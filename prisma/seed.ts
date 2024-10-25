import { db } from "../src/utils/db.server";
import { hashPassword } from "../src/Others/SecurePassword/index";

async function seed() {
  const convertHashedPassword = await hashPassword("1516");

  await db.vendor.create({
    data: {
      name: "Logic-Nexus It Solutions",
      address: "Jhikargaccha, Jashore",
      phone: "01703459656",
      users: {
        create: {
          username: "admin",
          password: convertHashedPassword,
          mobile: "123456789",
          email: "admin@admin.com",
          admin: {
            create: {
              fullName: "admin",
              role: "ADMIN",
            },
          },
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
