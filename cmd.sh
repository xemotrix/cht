#!/bin/bash

commands=`echo "kill create" | tr ' ' '\n'`

# selected=`echo "$commands" | fzf`
selected=`echo "$commands" | fzf`
bash ~/Documents/cht/$selected.sh

