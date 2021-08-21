if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting

set -gx EDITOR nano
set -gx GOPATH ~/Go

fish_add_path {$GOPATH}/bin

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/remi/Work/Miniforge3/bin/conda
    eval /home/remi/Work/Miniforge3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/remi/Work/Miniforge3/etc/fish/conf.d/conda.fish"
        . "/home/remi/Work/Miniforge3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/remi/Work/Miniforge3/bin" $PATH
    end
end
# <<< conda initialize <<<
