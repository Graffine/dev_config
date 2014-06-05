#!/bin/bash
tmux new-session -d -s HRS

tmux rename-window -t HRS:0 'Local'
tmux new-window -t HRS:1 -n 'AWS-HRS-Server' 'ssh AWS-HRS-Server'
tmux new-window -t HRS:2 -n 'AWS-HRS-RabbitMQ' 'ssh AWS-HRS-RabbitMQ'

tmux select-window -t HRS:0
tmux -2 attach-session -t HRS
