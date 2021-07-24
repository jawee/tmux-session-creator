#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
FILE_PATH=$SCRIPT_DIR/tmux-config.json
SESSION_NAME=`jq -r ".name" $FILE_PATH`
DIR_PATH=`jq -r ".path" $FILE_PATH`
echo $DIR_PATH

pushd "$HOME$DIR_PATH"
tmux new-session -s $SESSION_NAME -d
while read -r window; do
  WINDOW_NAME=$(echo $window | jq -r '.name')
  COMMAND_STR=$(echo $window | jq -r '.command')

  tmux new-window -t $SESSION_NAME -d -n $WINDOW_NAME
  tmux send-keys -t $SESSION_NAME:$WINDOW_NAME "$COMMAND_STR" Enter
done <<< "$(cat $FILE_PATH | jq -c '.windows[]')"

tmux -u attach -t $SESSION_NAME

popd
