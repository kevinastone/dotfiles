#!/bin/bash

CUR_SHELL=$(basename "$SHELL")

PANES=$(tmux list-panes -a -F "#{pane_current_command} #{pane_id}" | grep -e "^${CUR_SHELL}" | cut -d " " -f 2)
for pane in $PANES
do
    tmux kill-pane -t "$pane"
done

