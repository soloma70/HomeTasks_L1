# AWS Cloud Basic. Home task.

## Step 1. Log Into Your AWS Account, Launch, Configure, Connect and Terminate Your Instance.
![](./screenshots/AWS_s1_01.jpg)
![](./screenshots/AWS_s1_02.jpg)
![](./screenshots/AWS_s1_03.jpg)
![](./screenshots/AWS_s1_04.jpg)
![](./screenshots/AWS_s1_05.jpg)
![](./screenshots/AWS_s1_06.jpg)
![](./screenshots/AWS_s1_07.jpg)
![](./screenshots/AWS_s1_08.jpg)
![](./screenshots/AWS_s1_09.jpg)
![](./screenshots/AWS_s1_10.jpg)
![](./screenshots/AWS_s1_11.jpg)

## Step 2. Create a snapshot of your instance to keep as a backup.
![](./screenshots/AWS_s2_01.jpg)
![](./screenshots/AWS_s2_02.jpg)
![](./screenshots/AWS_s2_03.jpg)
![](./screenshots/AWS_s2_04.jpg)

## Step 3. Create and attach a Disk_D (EBS) to your instance to add more storage space. 
![](./screenshots/AWS_s3_01.jpg)
![](./screenshots/AWS_s3_02.jpg)
![](./screenshots/AWS_s3_03.jpg)
```
[ec2-user@ip-172-31-63-83 ~]$ lsblk
NAME    MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
xvda    202:0    0   8G  0 disk
└─xvda1 202:1    0   8G  0 part /
xvdd    202:48   0  10G  0 disk
[ec2-user@ip-172-31-63-83 ~]$
[ec2-user@ip-172-31-63-83 ~]$ sudo fdisk /dev/xvdd
Welcome to fdisk (util-linux 2.30.2).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.
Device does not contain a recognized partition table.
Created a new DOS disklabel with disk identifier 0x897d155d.
Command (m for help): n
Partition type
   p   primary (0 primary, 0 extended, 4 free)
   e   extended (container for logical partitions)
Select (default p): p
Partition number (1-4, default 1):
First sector (2048-20971519, default 2048):
Last sector, +sectors or +size{K,M,G,T,P} (2048-20971519, default 20971519):
Created a new partition 1 of type 'Linux' and of size 10 GiB.
Command (m for help): w
The partition table has been altered.
Calling ioctl() to re-read partition table.
Syncing disks.
[ec2-user@ip-172-31-63-83 ~]$ lsblk /dev/xvdd
NAME    MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
xvdd    202:48   0  10G  0 disk
└─xvdd1 202:49   0  10G  0 part
[ec2-user@ip-172-31-63-83 ~]$
[ec2-user@ip-172-31-63-83 ~]$ sudo mkfs.ext4 /dev/xvdd1
mke2fs 1.42.9 (28-Dec-2013)
Filesystem label=
OS type: Linux
Block size=4096 (log=2)
Fragment size=4096 (log=2)
Stride=0 blocks, Stripe width=0 blocks
655360 inodes, 2621184 blocks
131059 blocks (5.00%) reserved for the super user
First data block=0
Maximum filesystem blocks=2151677952
80 block groups
32768 blocks per group, 32768 fragments per group
8192 inodes per group
Superblock backups stored on blocks:
        32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632
Allocating group tables: done
Writing inode tables: done
Creating journal (32768 blocks): done
Writing superblocks and filesystem accounting information: done
[ec2-user@ip-172-31-63-83 ~]$
[ec2-user@ip-172-31-63-83 ~]$ mkdir ebs-disk2
[ec2-user@ip-172-31-63-83 ~]$ sudo mount /dev/xvdd1 /home/ec2-user/ebs-disk2/
```

## Step 4. Create and save some file on Disk_D.
```
[ec2-user@ip-172-31-63-83 ~]$ sudo chown -R ec2-user:ec2-user ./ebs-disk2/
[ec2-user@ip-172-31-63-83 ~]$ chmod -R 777 ./ebs-disk2/
[ec2-user@ip-172-31-63-83 ~]$ cp vim.jpg ./ebs-disk2/
[ec2-user@ip-172-31-63-83 ~]$ cp docker_commands.txt ./ebs-disk2/
[ec2-user@ip-172-31-63-83 ~]$ cp 40_Windows_Commands.txt ./ebs-disk2/
[ec2-user@ip-172-31-63-83 ~]$ cd ./ebs-disk2/
[ec2-user@ip-172-31-63-83 ebs-disk2]$ ll
total 188
-rw-rw-r-- 1 ec2-user ec2-user   1013 Jan 31 00:02 40_Windows_Commands.txt
-rw-rw-r-- 1 ec2-user ec2-user   2466 Jan 31 00:01 docker_commands.txt
drwxrwxrwx 2 ec2-user ec2-user  16384 Jan 30 23:45 lost+found
-rw-rw-r-- 1 ec2-user ec2-user 164956 Jan 31 00:01 vim.jpg
[ec2-user@ip-172-31-63-83 ebs-disk2]$
```

## Step 5. Launch the second instance from backup.
![](./screenshots/AWS_s5_01.jpg)
![](./screenshots/AWS_s5_02.jpg)
![](./screenshots/AWS_s5_03.jpg)
![](./screenshots/AWS_s5_04.jpg)
![](./screenshots/AWS_s5_05.jpg)
![](./screenshots/AWS_s5_06.jpg)
![](./screenshots/AWS_s5_07.jpg)

## Step 6. Detach Disk_D from the 1st instance and attach disk_D to the new instance.
### a) On instance `HT4-AWS-Test1` run the following command:
```
[ec2-user@ip-172-31-63-83 ~]$ sudo umount /dev/sdb1
umount: /dev/sdb1: no mount point specified.
[ec2-user@ip-172-31-63-83 ~]$ lsblk
NAME    MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
xvda    202:0    0   8G  0 disk
└─xvda1 202:1    0   8G  0 part /
xvdd    202:48   0  10G  0 disk
└─xvdd1 202:49   0  10G  0 part
[ec2-user@ip-172-31-63-83 ~]$
```
### b) In console EC2 AWS stopped instances `HT4-AWS-Test1` and `HT4-AWS-Test2`
![](./screenshots/AWS_s6_01.jpg)
### c)
![](./screenshots/AWS_s6_02.jpg)
![](./screenshots/AWS_s6_03.jpg)
![](./screenshots/AWS_s6_04.jpg)
### c) Start instance `HT4-AWS-Test2`
```
[ec2-user@ip-172-31-62-168 ~]$ lsblk
NAME    MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
xvda    202:0    0   8G  0 disk
└─xvda1 202:1    0   8G  0 part /
xvdd    202:48   0  10G  0 disk
└─xvdd1 202:49   0  10G  0 part
[ec2-user@ip-172-31-62-168 ~]$ mkdir ./ebs-test1/
[ec2-user@ip-172-31-62-168 ~]$ sudo mount /dev/xvdd1 /home/ec2-user/ebs-test1/
[ec2-user@ip-172-31-62-168 ~]$ cd ebs-test1/
[ec2-user@ip-172-31-62-168 ebs-test1]$ ll
total 188
-rw-rw-r-- 1 ec2-user ec2-user   1013 Jan 31 00:02 40_Windows_Commands.txt
-rw-rw-r-- 1 ec2-user ec2-user   2466 Jan 31 00:01 docker_commands.txt
drwxrwxrwx 2 ec2-user ec2-user  16384 Jan 30 23:45 lost+found
-rw-rw-r-- 1 ec2-user ec2-user 164956 Jan 31 00:01 vim.jpg
[ec2-user@ip-172-31-62-168 ebs-test1]$
```

## Step 7. Register a domain name and joining a hosted zone.
![](./screenshots/AWS_s7_01.jpg)
![](./screenshots/AWS_s7_02.jpg)
![](./screenshots/AWS_s7_03.jpg)
![](./screenshots/AWS_s7_04.jpg)
![](./screenshots/AWS_s7_05.jpg)
![](./screenshots/AWS_s7_06.jpg)
![](./screenshots/AWS_s7_07.jpg)
![](./screenshots/AWS_s7_08.jpg)

## Step 8. Launch and configure a WordPress instance with Amazon Lightsail.
![](./screenshots/AWS_s8_01.jpg)
![](./screenshots/AWS_s8_02.jpg)
![](./screenshots/AWS_s8_03.jpg)
![](./screenshots/AWS_s8_04.jpg)

## Step 9.  Store and Retrieve a File, creating your own repository.
![](./screenshots/AWS_s9_01.jpg)
![](./screenshots/AWS_s9_02.jpg)
![](./screenshots/AWS_s9_03.jpg)
![](./screenshots/AWS_s9_04.jpg)
![](./screenshots/AWS_s9_05.jpg)
![](./screenshots/AWS_s9_06.jpg)
![](./screenshots/AWS_s9_07.jpg)
![](./screenshots/AWS_s9_08.jpg)
![](./screenshots/AWS_s9_09.jpg)
![](./screenshots/AWS_s9_10.jpg)
![](./screenshots/AWS_s9_11.jpg)
![](./screenshots/AWS_s9_11.jpg)

## Step 10. Upload files to to Amazon S3 using the AWS CLI. Create a user AWS IAM, configure CLI AWS and upload any files to S3.
![](./screenshots/AWS_s10_01.jpg)
![](./screenshots/AWS_s10_02.jpg)
![](./screenshots/AWS_s10_03.jpg)
![](./screenshots/AWS_s10_04.jpg)
![](./screenshots/AWS_s10_05.jpg)
![](./screenshots/AWS_s10_06.jpg)
![](./screenshots/AWS_s10_07.jpg)
![](./screenshots/AWS_s10_08.jpg)
```
soloma70@ubuntu-master:~$
soloma70@ubuntu-master:~$ aws configure
AWS Access Key ID [None]: AKI*****************
AWS Secret Access Key [None]: Oj9u************************************
Default region name [None]: us-east-1
Default output format [None]: json
soloma70@ubuntu-master:~$
soloma70@ubuntu-master:~$ aws s3 mb s3://ht4-cli-test-bucket
make_bucket: ht4-cli-test-bucket
soloma70@ubuntu-master:~$
soloma70@ubuntu-master:~$ aws s3 cp ./hometask/dir_origin/9745.txt s3://ht4-cli-test-bucket/
upload: hometask/dir_origin/9745.txt to s3://ht4-cli-test-bucket/9745.txt
soloma70@ubuntu-master:~$ aws s3 cp ./hometask/ht1a.sh s3://ht4-cli-test-bucket/
upload: hometask/ht1a.sh to s3://ht4-cli-test-bucket/ht1a.sh
soloma70@ubuntu-master:~$ aws s3 cp ./hometask/ht1b.sh s3://ht4-cli-test-bucket/
upload: hometask/ht1b.sh to s3://ht4-cli-test-bucket/ht1b.sh
soloma70@ubuntu-master:~$ aws s3 cp ./hometask/ht1c.sh s3://ht4-cli-test-bucket/
upload: hometask/ht1c.sh to s3://ht4-cli-test-bucket/ht1c.sh
soloma70@ubuntu-master:~$
soloma70@ubuntu-master:~$ aws s3 cp s3://ht4-cli-test-bucket/ht1a.sh ./aws_cli_test/
download: s3://ht4-cli-test-bucket/ht1a.sh to aws_cli_test/ht1a.sh
soloma70@ubuntu-master:~$
soloma70@ubuntu-master:~$ aws s3 rm s3://ht4-cli-test-bucket/ht1c.sh
delete: s3://ht4-cli-test-bucket/ht1c.sh
soloma70@ubuntu-master:~$
```
![](./screenshots/AWS_s10_09.jpg)

## Step 11. Deploy Docker Containers on Amazon Elastic Container Service (Amazon ECS).
```
soloma70@ubuntu-master:~/docker_aws$ mkdir docker_aws
soloma70@ubuntu-master:~/docker_aws$ cd docker_aws/
soloma70@ubuntu-master:~/docker_aws$ nano Dockerfile
------------------------------------------------------------------------------
  GNU nano 6.2                          Dockerfile *
FROM ubuntu:18.04

# Install dependencies
RUN apt-get update && \
 apt-get -y install apache2

# Install apache and write hello world message
RUN echo 'Hello World!' > /var/www/html/index.html

# Configure apache
RUN echo '. /etc/apache2/envvars' > /root/run_apache.sh && \
 echo 'mkdir -p /var/run/apache2' >> /root/run_apache.sh && \
 echo 'mkdir -p /var/lock/apache2' >> /root/run_apache.sh && \
 echo '/usr/sbin/apache2 -D FOREGROUND' >> /root/run_apache.sh && \
 chmod 755 /root/run_apache.sh

EXPOSE 80

CMD /root/run_apache.sh
------------------------------------------------------------------------------
soloma70@ubuntu-master:~/docker_aws$ docker build -t hello-world .
Sending build context to Docker daemon   2.56kB
Step 1/6 : FROM ubuntu:18.04
18.04: Pulling from library/ubuntu
a055bf07b5b0: Pull complete
...
...
Successfully built ce01c18fb1a2
Successfully tagged hello-world:latest
soloma70@ubuntu-master:~/docker_aws$
soloma70@ubuntu-master:~/docker_aws$ docker images --filter reference=hello-world
REPOSITORY    TAG       IMAGE ID       CREATED         SIZE
hello-world   latest    ce01c18fb1a2   2 minutes ago   203MB
soloma70@ubuntu-master:~/docker_aws$
```
![](./screenshots/AWS_s11_01.jpg)
```
soloma70@ubuntu-master:~/docker_aws$ aws ecr create-repository --repository-name ht4-hello-repo --region us-east-1
{
    "repository": {
        "repositoryArn": "arn:aws:ecr:us-east-1:082641893437:repository/ht4-hello-repo",
        "registryId": "082641893437",
        "repositoryName": "ht4-hello-repo",
        "repositoryUri": "082641893437.dkr.ecr.us-east-1.amazonaws.com/ht4-hello-repo",
        "createdAt": 1675181175.0,
        "imageTagMutability": "MUTABLE",
        "imageScanningConfiguration": {
            "scanOnPush": false
        },
        "encryptionConfiguration": {
            "encryptionType": "AES256"
        }
    }
}
soloma70@ubuntu-master:~/docker_aws$
soloma70@ubuntu-master:~/docker_aws$ docker tag hello-world 082641893437.dkr.ecr.us-east-1.amazonaws.com/ht4-hello-repo
soloma70@ubuntu-master:~/docker_aws$ docker login -u AWS -p $(aws ecr get-login-password --region us-east-1) 082641893437.dkr.ecr.us-east-1.amazonaws.com
WARNING! Using --password via the CLI is insecure. Use --password-stdin.
WARNING! Your password will be stored unencrypted in /home/soloma70/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store
Login Succeeded
soloma70@ubuntu-master:~/docker_aws$
soloma70@ubuntu-master:~/docker_aws$ docker push 082641893437.dkr.ecr.us-east-1.amazonaws.com/ht4-hello-repo
Using default tag: latest
The push refers to repository [082641893437.dkr.ecr.us-east-1.amazonaws.com/ht4-hello-repo]
1e7299707666: Pushed
79e00b3c1c89: Pushed
d876598d7eba: Pushed
101b05ef38e1: Pushed
latest: digest: sha256:44dd3894169eefdd9ab9bbf1718fc09b9f6ad9b0ff58a519ffe167e80a2cbf5c size: 1155
soloma70@ubuntu-master:~/docker_aws$
```
![](./screenshots/AWS_s11_02.jpg)
```
soloma70@ubuntu-master:~/docker_aws$
soloma70@ubuntu-master:~/docker_aws$ aws ecr delete-repository --repository-name ht4-hello-repo --region us-east-1 --force
{
    "repository": {
        "repositoryArn": "arn:aws:ecr:us-east-1:082641893437:repository/ht4-hello-repo",
        "registryId": "082641893437",
        "repositoryName": "ht4-hello-repo",
        "repositoryUri": "082641893437.dkr.ecr.us-east-1.amazonaws.com/ht4-hello-repo",
        "createdAt": 1675181175.0,
        "imageTagMutability": "MUTABLE"
    }
}
soloma70@ubuntu-master:~/docker_aws$
```
## Step 12. Run a Serverless "Hello, World!" with AWS Lambda.
![](./screenshots/AWS_s12_01.jpg)
![](./screenshots/AWS_s12_02.jpg)
![](./screenshots/AWS_s12_03.jpg)
![](./screenshots/AWS_s12_04.jpg)
![](./screenshots/AWS_s12_05.jpg)
![](./screenshots/AWS_s12_06.jpg)
![](./screenshots/AWS_s12_07.jpg)

## Step 13. Create a static website on Amazon S3, publicly available (using a custom domain registered with Route 53). Post on the page your own photo, the name of the educational program (EPAM Cloud&DevOps Fundamentals Autumn 2022), the list of AWS services with which the student worked within the educational program or earlier and the full list with links of completed labs.
![](./screenshots/AWS_s13_01.jpg)
![](./screenshots/AWS_s13_02.jpg)
![](./screenshots/AWS_s13_03.jpg)

![CV Mykhailo Solomashenko]<http://soloma70.pp.ua/>