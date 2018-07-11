#!/bin/bash
#
# This is an emergency script used to kill
# all process related to the flat_fish system
#
force_kill() {
    for pid in $1; do
        echo "PID: $pid"
        kill -9 $pid
    done
}

psaux_grep_and_kill() {
    pids=$(ps aux | grep -v grep | grep "$1" | awk '{print $2}')
    if [ -n "$pids" ]
    then
        echo "FORCE KILL: $1"
        force_kill "$pids"
    fi
}

echo "###################################"
echo "#            WARNING              #"
echo "#  FORCE KILL ALL SYSKIT PROCESS  #"
echo "###################################"

psaux_grep_and_kill "orogen"
psaux_grep_and_kill "transformer_broadcaster"
psaux_grep_and_kill "syskit"
psaux_grep_and_kill "orocos"

#only for simulation
psaux_grep_and_kill "dive"
psaux_grep_and_kill "gazebo"
psaux_grep_and_kill "gzserver"