#!/bin/bash

# Get L/R volume info
left=`amixer sget Master | grep Mono:`
right=`amixer sget Master | grep Mono:`
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
    echo "<fn=1></fn> [Muted]"
elif [ $level == "100" ]
then
    echo "<fn=1></fn> [▓▓▓▓▓]"
elif [ $(($level >= 80)) == "1" ]
then
    echo "<fn=1></fn> [▓▓▓▓░]"
elif [ $(($level >= 60)) == "1" ]
then
    echo "<fn=1></fn> [▓▓▓░░]"
elif [ $(($level >= 40)) == "1" ]
then
    echo "<fn=1></fn> [▓▓░░░]"
elif [ $(($level >= 20)) == "1" ]
then
    echo "<fn=1></fn> [▓░░░░]"
else
    echo "<fn=1></fn> [░░░░░]"
fi
