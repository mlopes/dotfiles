#! /usr/bin/env bash

if [ `ip link | grep wireguard | wc -l` = 1 ]
then
  echo "WG "
else
  echo "%{F#774433}WG "
fi
