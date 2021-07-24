#!/bin/sh
pushd ~/Projects/docker-image-update-system
tmux new-session -s dius -n BE-vim -d
tmux new-window -t dius -d -n BE-run
tmux new-window -t dius -d -n FE-vim
tmux new-window -t dius -d -n FE-run
tmux new-window -t dius -d -n WRK-vim
tmux new-window -t dius -d -n WRK-run
tmux new-window -t dius -d -n zsh

tmux send-keys -t dius:BE-vim "cd api && vim ." Enter
tmux send-keys -t dius:BE-run "cd api/src && npm run start"      Enter

tmux send-keys -t dius:FE-vim "cd frontend && vim ." Enter
tmux send-keys -t dius:FE-run "cd frontend && npm run start" Enter

tmux send-keys -t dius:WRK-vim "cd worker && vim ." Enter
tmux send-keys -t dius:WRK-run "cd worker" Enter

tmux select-window -t dius:BE-vim
tmux -u attach -t dius
popd
