#!/bin/bash

# Get L/R volume info
left=`amixer -c 1 sget Master | grep Mono:`
right=`amixer -c 1 sget Master | grep Mono:`
llevel=${left#*[}
llevel=${llevel%\%]*}
rlevel=${right#*[}
rlevel=${rlevel%\%]*}
active=${left##*[}
active=${active%]}

# Find average level
if [ $llevel == $rlevel ]
then
    level=$llevel
else
    level=$(($llevel + $rlevel))
    level=$(($level / 2))
fi


#Create displays
if [ $active == "off" ] || [ $level == "0" ]
then
    echo "[Muted]"
elif [ $level == "100" ]
then
    echo "[▓▓▓▓▓]"
elif [ $(($level >= 80)) == "1" ]
then
    echo "[▓▓▓▓░]"
elif [ $(($level >= 60)) == "1" ]
then
    echo "[▓▓▓░░]"
elif [ $(($level >= 40)) == "1" ]
then
    echo "[▓▓░░░]"
elif [ $(($level >= 20)) == "1" ]
then
    echo "[▓░░░░]"
else
    echo "[░░░░░]"
fi
