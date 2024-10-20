# #!/bin/bash

# # Load environment variables from the .env file
if [ -f .env ]; then
  export $(grep DATABASE_URL .env | xargs)
else
  echo ".env file not found!"
  exit 1
fi

# Function to create initial Prisma migration if none exist
initialize_prisma_migration() {
    if [ ! -d "prisma/migrations" ] || [ -z "$(ls -A prisma/migrations)" ]; then
        echo "No migrations found. Creating an initial migration..."
        npx prisma migrate dev --name init

        if [ $? -ne 0 ]; then
            echo "Failed to create initial migration."
            exit 1
        fi
    else
        echo "Migrations found."
    fi
}

# Define backup function
backup_database() {
    timestamp=$(date +"%Y-%m-%dT%H-%M-%S")
    backup_file="./backup/backup_${timestamp}.sql"

    echo "Creating backup of data only (without schema)..."
    pg_dump --data-only "$DATABASE_URL" > "$backup_file"
    
    if [ $? -eq 0 ]; then
        echo "Backup completed: $backup_file"
    else
        echo "Backup failed!"
        exit 1
    fi
}

# Define restore function
restore_database() {
    echo "Available backup files:"
    select backup_file in $(ls -1 ./backup/*.sql); do
        # Validate selection
        if [ -f "$backup_file" ]; then
            echo "Selected $backup_file for restoration."
            break
        else
            echo "Invalid selection. Try again."
        fi
    done

    # Drop and recreate schema
    echo "Dropping existing schema..."
    psql "$DATABASE_URL" -c "DROP SCHEMA public CASCADE; CREATE SCHEMA public;"

    # Check for migrations and apply
    initialize_prisma_migration
    echo "Applying Prisma migrations..."
    npx prisma migrate deploy

    if [ $? -ne 0 ]; then
        echo "Prisma migration failed!"
        exit 1
    fi

    # Restore the data from the selected backup file
    echo "Restoring data from $backup_file..."

    # Modify the backup file to avoid existing object errors
    sed -i '/CREATE TABLE /!b;n;n;N;N;/CREATE TABLE /s/CREATE TABLE/CREATE TABLE IF NOT EXISTS/g' "$backup_file"
    
    # Restore the data, ignoring the creation of types and tables that already exist
    psql "$DATABASE_URL" -f "$backup_file"

    if [ $? -eq 0 ]; then
        echo "Data restored successfully!"
    else
        echo "Data restoration failed!"
        exit 1
    fi
}

# User prompt for backup or restore
echo "Select an option:"
echo "1) Backup"
echo "2) Restore"
read -p "Enter your choice (1 or 2): " choice

if [ "$choice" == "1" ]; then
    backup_database
elif [ "$choice" == "2" ]; then
    restore_database
else
    echo "Invalid choice. Exiting."
    exit 1
fi