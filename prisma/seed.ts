import { db } from "../src/utils/db.server";

async function seed() {
  // model User {
  //   id            String         @id @default(cuid())
  //   createdAt     DateTime       @default(now())
  //   updatedAt     DateTime       @updatedAt
  //   administrator administrator?
  // }

  // model administrator {
  //   id        String   @id @default(cuid())
  //   User      User     @relation(fields: [userId], references: [id])
  //   userId    String   @unique
  //   email     String   @unique
  //   firstName String
  //   lastName  String
  //   mobile    String   @unique
  //   password  String
  //   createdAt DateTime @default(now())
  //   updatedAt DateTime @updatedAt
  //   role      Role     @default(ADMINISTRATOR)
  //   isActive  Boolean  @default(true)

  //   @@index([userId, email, mobile])
  //   @@map("adminastators")
  // }

  await db.user.create({
    data: {
      otherUsers: {
        create: {
          firstName: "admin",
          lastName: "admin",
          username: "admin",
          email: "admin",
          mobile: "123456789",
          password: "1516",
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
