#!/bin/bash

# check whether remote host ports are locked

remote_host_IP="$1"
log_dir="traceroute"
date=`date +%F`
log_file="${remote_host_IP}-$date"

Usage() {
    echo "Usage : $0 [remote_host_IP] [start_port] [end_port] "
    exit 1
}

Parameter_judge() {
    correct_num="$1"
    real_num="$2"
    if [ $correct_num != $real_num ]; then
        Usage
    fi 
}

Port_compare() {
    start_port="$1"
    end_port="$2"
    if [ $start_port -gt $end_port ]; then  
        echo "Error: start_port is bigger than end_port."
        echo "Please check and retry."
        Usage
    fi
}

Check_port_connectivity() {
    remote_host_IP="$1"
    start_port="$2"
    end_port="$3"

    for port in `seq $start_port $end_port`
    do
        port_status='fail' 
        traceroute  -n \
                    -q 1 \
                    -m 20 \
                    -p $port \
                    $remote_host_IP | \
                    tail -n 1 | \
                    grep $remote_host_IP && port_status='ok' 
        echo "# $port $port_status"
    done
}

Parameter_judge 3 $#
Port_compare $2 $3
Check_port_connectivity $1 $2 $3


