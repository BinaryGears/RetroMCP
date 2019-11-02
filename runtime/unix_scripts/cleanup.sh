#!/bin/bash

command=""
if [ -f "runtime/command" ]; then
    echo "! Running custom python command! Some things may not work correctly!"
    command=read -r firstline<runtime/command
else
    command=./runtime/bin/python/bin/pypy3
fi

"${command}" runtime/cleanup.py "$@"

if [ $? -ne 1 ]; then
    rm -f ./cleanup.sh
fi