set -g fish_greeting

set -gx EDITOR /opt/local/bin/micro
set -gx GOPATH /Users/remi.salmon/Work/Go
# set -gx JAVA_HOME /Library/Java/JavaVirtualMachines/openjdk17-temurin/Contents/Home # Macports

fish_add_path /opt/local/bin /opt/local/sbin # Macports
fish_add_path /opt/local/libexec/gnubin # Macports
# fish_add_path /opt/local/libexec/docker/cli-plugins/ # Macports
# fish_add_path {$JAVA_HOME}/bin # Macports
# fish_add_path /opt/podman/bin # Podman Desktop
fish_add_path ~/.local/bin # pipx
fish_add_path {$GOPATH}/bin # Go
fish_add_path ~/Work/GitHub/remi.salmon/fish-scripts # me

source ~/.env.fish

alias cdgit "cd (git rev-parse --show-toplevel)"
