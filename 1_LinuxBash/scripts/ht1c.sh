#!/bin/bash
#
# To add a command to the cron, follow these steps:
# crontab - e
# * * * * * /<full_path_to_ht1c.sh>/ht1c.sh /<full_path_to_origin_dir>/ /<full_path_to_bak_dir>/ /<full_path_to_log_dir>/

if [[ $# -eq 3 ]]
then
    src=$1
    dest=$2
    logs=$3folder_backup.log
    rsync -avz --progress --delete $src $dest --log-file=$logs
    echo -e "\n"
    echo "Logs writes to /tmp/folder_backup.log"
else
    echo "Attention!!! For the script to work, please pass
3 arguments: source dir, destination dir, file log dir"
fi