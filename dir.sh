#!/bin/bash

dirs=`ls ~/Documents/ | sed 's/^/[DIR] /'`
sessions=`tmux ls | grep -o "^[_a-zA-Z0-9\-]*:" | sed 's/://' | sed 's/^/====> /'`
selected=`printf "$sessions\n$dirs" | fzf | sed 's/^.\{6\}//' | sed 's/ *$//'`

if !(echo $sessions | grep -qs $selected); then
    dir=`echo $(echo "$selected") | sed 's/ /\\\ /g'`
    selected=`echo $selected | tr ' ' '-'`
    echo $selected
    eval "tmux new -s $selected -d -c ~/Documents/$dir"
fi

tmux switch -t $selected






