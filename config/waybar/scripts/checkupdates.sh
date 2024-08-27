#!/bin/bash

UPDATES_AVAILABLE=
count_updates=$(checkupdates | wc -l)

if [ $count_updates -ge 1 ]; then 
    echo "$UPDATES_AVAILABLE $count_updates"
else
    echo ""
fi
