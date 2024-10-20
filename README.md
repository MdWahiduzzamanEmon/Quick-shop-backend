## to open prisma studio -

- npx prisma studio

## to install prisma client -

- npm install @prisma/client

## to generate prisma client -

- npx prisma generate

////////////////////////////////////

## for prisma -

## setup database -

- npx prisma init --datasource-provider postgresql //for postgresql

create migration -
npx prisma migrate dev --name init

npx prisma migrate dev --name user-entity --create-only

## run migration -

npx prisma migrate deploy

## push to database -

- npx prisma db push ///to sync schema with database and create tables in database

## run seed

- npx prisma db seed --preview-feature

- npm i --save esbuild

## express validator -

- npm i express-validator

Create a migration from changes in Prisma schema, apply it to the database, trigger generators (e.g. Prisma Client)
$ npx prisma migrate dev

Reset your database and apply all migrations
$ npx prisma migrate reset

Apply pending migrations to the database in production/staging
$ npx prisma migrate deploy

Check the status of migrations in the production/staging database
$ npx prisma migrate status

Specify a schema
$ npx prisma migrate status --schema=./schema.prisma

## revert migration -

---

npx prisma migrate reset ///to revert migration and delete tables from database and sync schema with database and create tables in database again with new changes in schema file

docker compose up --build --force-recreate
docker system prune -a --volumes

              # DB Backup and Restore

1. Backup the Database

## Step 1: Backup the database

To backup the database

```bash
 bash pg_backup_restore.sh
```

## Step 2: Check the schema has any changes

To check the schema has any changes

```bash
npx prisma migrate status
```

## Step 3: If there are changes in the schema, create a migration

To create a migration

```bash
npx prisma migrate dev --name <migration-name>
```

## Step 4: Reset the database

To reset the database

```bash
npx prisma migrate reset
```

## Step 5: Restore the database

To restore the database

```bash
 bash pg_backup_restore.sh
```
