set -g fish_greeting

set -gx EDITOR /usr/bin/micro
set -gx GOPATH ~/Go

fish_add_path {$GOPATH}/bin
fish_add_path ~/Work/GitHub/fish-scripts

source ~/.env.fish

alias cdgit "cd (git rev-parse --show-toplevel)"
