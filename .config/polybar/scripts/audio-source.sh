#! /usr/bin/env bash

source=$(pactl info | grep "Default Sink" | grep -o '[^.]*$')

if [ "$source" = "a2dp_sink" ]; then
  echo ""
elif [ "$source" = "handsfree_head_unit" ]; then
  echo ""
elif [ "$source" = "analog-stereo" ]; then
  echo ""
else
  echo "$source"
fi
