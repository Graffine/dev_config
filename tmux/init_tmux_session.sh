#!/bin/bash
tmux new-session -d -s Develop

tmux rename-window -t Develop:0 'git-operation'
tmux new-window -t Develop:1 -n 'dev'

tmux select-window -t Develop:1
tmux -2 attach-session -t Develop
