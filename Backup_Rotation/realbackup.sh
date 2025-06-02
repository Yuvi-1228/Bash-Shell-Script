#!/bin/bash

source_data="$1"
backup_data="$2"
timestamp=$(date '+%Y-%m-%d-%H-%M-%S')  # Fixed the order of hour and minute

function create_backup() {
    if [[ -z "$source_data" || -z "$backup_data" ]]; then
        echo "Usage: $0 <source_directory> <backup_directory>"
        exit 1
    fi

    if [[ ! -d "$source_data" ]]; then
        echo "Error: Source directory '$source_data' does not exist."
        exit 1
    fi

    if [[ ! -d "$backup_data" ]]; then
        echo "Error: Backup directory '$backup_data' does not exist."
        exit 1
    fi

    zip -r "${backup_data}/backup_${timestamp}.zip" "$source_data"
    if [[ $? -eq 0 ]]; then
        echo "Backup Successful: ${timestamp}"
    else
        echo "Backup Failed"
        exit 1
    fi
}
function rotation() {
    # Step 1: List all backup files
    backups=($(ls -t "${backup_data}/backup_"*.tar.gz 2>/dev/null))

    # Step 2: Check if more than 5 backups exist
    if [ "${#backups[@]}" -gt 5 ]; then
        echo "Rotation: Keeping latest 5 backups only."

        # Step 3: Get backups to delete (older ones)
        backups_to_delete=("${backups[@]:5}")

        # Step 4: Delete old backups
        for file in "${backups_to_delete[@]}"; do
            echo "Deleting: $file"
            rm -f "$file"
        done
    fi
}
create_backup
rotation