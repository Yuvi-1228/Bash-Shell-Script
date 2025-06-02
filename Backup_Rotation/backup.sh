#!/bin/bash
<< ReadMe
This is the script for backup with 5 days rotation
Useage:
./backup.sh <path-to-your-source> <Path-to-backup-folder>
ReadMe

function display_useage(){
    echo "Useage: ./backup.sh <path-to-your-source> <Path-to-backup-folder>"

}
if [[ $# -eq 0 ]]; then
    display_useage
fi 

source_data=$1
timestamp=$(date '+%Y-%m-%d-%M-%H-%S')
backup_data=$2
function create_backup(){

    #zip -r "${backup_data}/backup_${timestamp}.zip" "${source_data} > /dev/null"
    tar -czf "${backup_data}/backup_${timestamp}.tar.gz" -C "$(dirname "$source_data")" "$(basename "$source_data")"
    if [[ $? -eq 0 ]]; then
    echo "Backup Successfully ${timestamp}"
    fi
    
}

function rotation(){
    backup_data=($(ls -t "${backup_data}/backup_"*.tar.gz 2>/dev/null))
    #echo "${backup_data[@]}"
    if [ "${#backup_data[@]}" -gt 5 ]; then
        echo "Rotation for 5 Days"

        #Remove Backup after 5 days 
        backup_remove=("${backup_data[@]:5}")
        #echo "${backup_remove[@]}"
        for backup in "${backup_remove[@]}";
        do
            rm -f ${backup}
        done
    fi 

}
create_backup
rotation


