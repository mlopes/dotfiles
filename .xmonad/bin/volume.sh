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
    echo "Muted"
elif [ $level == "100" ]
then
    echo "<))))"
elif [ $(($level <= 33)) == "1" ]
then
    echo "<)···"
elif [ $(($level <= 66)) == "1" ]
then
    echo "<))··"
else
    echo "<)))·"
fi
