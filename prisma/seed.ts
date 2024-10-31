import { db } from "../src/utils/db.server";
import { hashPassword } from "../src/Others/SecurePassword/index";
import divisions from "../src/bd-geo-code/divisions.json";
import districts from "../src/bd-geo-code/districts.json";
import unions from "../src/bd-geo-code/unions.json";
import upazilas from "../src/bd-geo-code/upazilas.json";

async function seed() {
  const convertHashedPassword = await hashPassword("1516");

  // await db.superAdmin.create({
  //   data: {
  //     firstName: "Super",
  //     lastName: "Admin",
  //     mobile: "1234567890",
  //     role: "SUPER_ADMIN",
  //     username: "superAdmin",
  //     email: "superadmin@admin.com",
  //     password: convertHashedPassword,
  //     vendor: {
  //       create: {
  //         name: "Logic Nexus It Solutions",
  //         address: "Jhikargaccha, Jashore",
  //         phone: "01703459656",
  //         users: {
  //           create: {
  //             email: "admin@admin.com",
  //             mobile: "1234567890",
  //             username: "admin",
  //             password: convertHashedPassword,
  //             admin: {
  //               create: {
  //                 role: "ADMIN",
  //               },
  //             },
  //           },
  //         },
  //       },
  //     },
  //   },
  // });

  // // Seed Divisions
  // for (const division of divisions.data) {
  //   await db.division.create({
  //     data: {
  //       name: division.name,
  //       bn_name: division.bn_name,
  //       url: division.url,
  //     },
  //   });
  // }

  // // Seed Districts
  // for (const district of districts.data) {
  //   await db.district.create({
  //     data: {
  //       name: district.name,
  //       bn_name: district.bn_name,
  //       lat: parseFloat(district.lat),
  //       lon: parseFloat(district.lon),
  //       url: district.url,
  //       division: { connect: { id: parseInt(district.division_id) } },
  //     },
  //   });
  // }

  // // Seed Upazilas
  // for (const upazila of upazilas.data) {
  //   await db.upazila.create({
  //     data: {
  //       name: upazila.name,
  //       bn_name: upazila.bn_name,
  //       url: upazila.url,
  //       district: { connect: { id: parseInt(upazila.district_id) } },
  //     },
  //   });
  // }

    // Seed Unions
  for (const union of unions.data) {
    await db.union.upsert({
      where: { id: parseInt(union.id) },
      create: {
        name: union.name,
        bn_name: union.bn_name,
        url: union.url,
        upazila: { connect: { id: parseInt(union.upazilla_id) } },
      },
      update: {
        name: union.name,
        bn_name: union.bn_name,
        url: union.url,
        upazila: { connect: { id: parseInt(union.upazilla_id) } },
      },
    });
  }

  //delete all data
  // await db.division.deleteMany();
  // await db.district.deleteMany();
  // await db.upazila.deleteMany();
  // await db.union.deleteMany();
  // await db.zone.deleteMany();
}

seed()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await db.$disconnect();
  });
