#!/bin/bash

param=$1

top_ip () {
    echo "1. From which ip were the most requests?"
    echo "----------------------------------------"
    result=$(cat $param | awk '{print $1}' | sort | uniq -c | sort -nr | awk '{print "From IP " $2 "\t max requests - " $1}' | head -n 1)
    echo -e "$result\n"
}

top_page () {
    echo "2. What is the most requested page?"
    echo "-----------------------------------"
    result=$(cat $param | cut -d\" -f2 | awk '{print $2}' | egrep -iv "ico$|woff|ttf" | sort | uniq -c | sort -nr | head -n 1 | sed -e 's/^[ \t]*//')
    echo -e "$result\n"
}

request_ips_count () {
    echo "3. How many requests were there from each ip?"
    echo "---------------------------------------------"
    result=$(cat $param | awk '{print $1}' | sort | uniq -c | sort -nr | awk '{ip = $2; r = $1; printf "From IP %-15s - %d request%s\n", ip, r, r == 1 ? "" : "s"}')
    echo -e "$result\n"
}

non_exist_pages () {
    echo "4. What non-existent pages were clients reffered to?"
    echo "----------------------------------------------------"
    result=$(cat $param | grep " 404 " | cut -d\" -f2 | awk '{print $2}' | sort | uniq)
    echo -e "$result\n"
}

most_time_request () {
    echo "5. What time did site get the most requests (within 1 hour)?"
    echo "------------------------------------------------------------"
    result=$(cat $param | cut -d[ -f2 | cut -d] -f1 | awk -F: '{print $2":00 - "$2":59"}' | sort -n | uniq -c | sort -rn | head -n 1)
    echo -e "$result\n"
}

show_search_bot () {
    echo "6. What search bots have accessed the site (UA + IP)?"
    echo "-----------------------------------------------------"
    result=$(cat $param | cut -d" " -f12 | grep -i bot | cut -d/ -f1 | sort | uniq | cut -c 2-)
    echo -e "$result\n"
}

if [[ $# -ne 1 ]]
then
    echo "Attention!!! For the script to work, please pass
the file name with the full path as an argument"
else
    echo " "
    echo "LOG FILE ANALISIS - $param"
    echo "----------------------------------------"
    echo " "
    top_ip
    top_page
    request_ips_count
    non_exist_pages
    most_time_request
    show_search_bot
fi
