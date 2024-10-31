#!/bin/bash

tmpfile=$(mktemp)
tmux list-windows | sort -k2 >$tmpfile

cat $tmpfile | awk -F ":" '{ print " -s " $1 " -t 5" NR-1 }' |
  xargs -I {} sh -c 'tmux move-window -d {}'

# Move them back down, retaining the order
tmux move-window -d -r
rm $tmpfile
