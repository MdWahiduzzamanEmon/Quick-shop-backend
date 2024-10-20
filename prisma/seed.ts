import { db } from "../src/utils/db.server";

async function seed() {
  // model admin {
  //     id        Int      @id @default(autoincrement())
  //     userName  String   @unique
  //     email     String   @unique
  //     password  String   @db.VarChar(255)
  //     role      Role     @default(ADMIN)
  //     status    Status?  @default(pending)
  //     createdAt DateTime @default(now())
  //     updatedAt DateTime @updatedAt
  //   }
  await db.admin.create({
    data: {
      userName: "admin",
      email: "admin@admin.com",
      password: "1516",
      role: "ADMIN",
      status: "approved",
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
