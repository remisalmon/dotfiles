set -g fish_greeting

set -gx EDITOR /opt/local/bin/nano
set -gx GOPATH /Users/remisalmon/Go
# set -gx JAVA_HOME /Library/Java/JavaVirtualMachines/openjdk8/Contents/Home # Macports
# set -gx JAVA_HOME /Library/Java/JavaVirtualMachines/openjdk8-temurin/Contents/Home # Macports

fish_add_path /opt/local/bin /opt/local/sbin # Macports
fish_add_path /opt/local/libexec/gnubin # Macports
# fish_add_path /opt/local/libexec/docker/cli-plugins/ # Macports
# fish_add_path {$JAVA_HOME}/bin # Macports
# fish_add_path /opt/podman/bin # Podman Desktop
fish_add_path ~/.local/bin # pipx
fish_add_path {$GOPATH}/bin # Go

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/remisalmon/Work/Miniconda/bin/conda
    eval /Users/remisalmon/Work/Miniconda/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/Users/remisalmon/Work/Miniconda/etc/fish/conf.d/conda.fish"
        . "/Users/remisalmon/Work/Miniconda/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/Users/remisalmon/Work/Miniconda/bin" $PATH
    end
end
# <<< conda initialize <<<

conda activate hotelengine

source ~/.env