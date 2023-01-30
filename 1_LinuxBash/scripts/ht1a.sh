#!/bin/bash

show_map_ip () {
  if [[ `/usr/bin/which nmap` ]]
  then 
    ip_cidr="$(ip -o addr | awk '/scope global/ {print $4}' | head -n 1)"
    ip_list="$(sudo nmap -sP -n $ip_cidr | awk '/Nmap scan/ {print $5}')"
    for ip in $ip_list
    do
      echo "$ip [$(arp $ip | tail -n 1 | awk '{print $1}')]"
    done
  else
    echo "To run this script please install \"nmap\"\n
  sudo apt install nmap / sudo yum install nmap"
  fi
}

show_ports () {
  if [[ `/usr/bin/which netstat` ]]
  then
    echo "$(sudo netstat -tlpn | grep LISTEN | awk '{print $1, $4}')"
  else
    echo "To run this script please install \"netstat\"\n\
  sudo apt install net-tools / sudo yum install net-tools"
  fi
}

main () {
  mess_def="You have to use one parameter:\n
--all - displays the IP addresses and symbolic names of all hosts in the current subnet\n
--target - displays a list of open system TCP ports"

  if [[ $# -ne 1 ]]
  then
    echo -e $mess_def
  elif [[ $1 == "--all" ]]
  then
    show_map_ip
  elif [[ $1 == "--target" ]]
  then
    show_ports
  else
    echo $mess_def
  fi
}

main $1
