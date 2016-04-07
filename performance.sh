#!/bin/bash

cmd=`which tmux`    # tmux path
session='performance'

if [ -z $cmd ]; then 
    echo "No tmux installed"
    exit 1
fi

$cmd has -t $session 2> /dev/null

if [ $? != 0 ]; then
    $cmd new -d -n htop -s $session "htop"
    $cmd splitw -v -p 30 -t $session "iostat 1"
    $cmd selectp -t 1
    $cmd splitw -h -p 60 -t $session "sar -n DEV 1"
    $cmd selectp -t 0
fi

$cmd attach -t $session
