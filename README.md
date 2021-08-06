# Script for creating tmux session from json file

## Requirements

* jq (`apt install jq`)

## How to run

```bash
chmod +x tmux-sessions
```

```bash
./tmux-sessions tmux-config.json
```

Can be called from a different directory.

```bash
./../../path/to/tmux-session/tmux-sessions tmux-config.json
```


## How to install
Place it somewhere in your PATH. 

## Configuration

path should be set relative to ~ (home directory). 
So `/projects/some-awesome-project/` will be `~/projects/some-awesome-project/`

Example configuration
```json
 {
   "path": "/projects/some-awesome-project/",
   "name": "some-awesome-project",
   "windows": [
     { 
       "name": "vim",
       "command": "vim ."
     },
     {
       "name": "zsh",
       "command": ""
     }
   ]
 }
```
