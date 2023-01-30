# Linux administration with bash. Home task.

## Part A. Create a script that uses the following keys: 
```
1. When starting without parameters, it will display a list of possible keys and their description  
2. The --all key displays the IP addresses and symbolic names of all hosts in the current subnet  
3. The --target key displays a list of open system TCP ports  
```
Attention! To execute a script:
  - need a password `sudo`
  - need to add execution rights `/<file_location_path>/chmod a+x hi1a.sh`

[Script A]<https://github.com/soloma70/HomeTasks_L1/blob/master/1_LinuxBash/scripts/ht1a.sh>


## Part B. Create a script to answer the following questions:
```
1. From which ip were the most requests?  
2. What is the most requested page?  
3. How many requests were there from each ip?  
4. What non-existent pages were clients referred to?  
5. What time did site get the most requests?  
6. What search bots have accessed the site? (UA + IP)  
```
Attention! To execute a script:
  - need to add execution rights `/<file_location_path>/chmod a+x hi1b.sh`
  - pass the file name with the full path as an argument

[./scripts/ht1b.sh]


## Part C. Create a data backup script that takes the following data as parameters:
```
1. Path to the syncing directory  
2. The path to the directory where the copies of the files will be stored  
```
Attention! To execute a script:
  - need to add execution rights `/<file_location_path>/chmod a+x hi1c.sh`
  - pass 3 arguments: source dir, destination dir, file log dir
  - To add a command to the cron, follow these steps:
```  
    $ crontab - e
    * * * * * /<full_path_to_ht1c.sh>/ht1c.sh /<full_path_to_origin_dir>/ /<full_path_to_bak_dir>/ /<full_path_to_log_dir>/
```
[./scripts/ht1c.sh]
