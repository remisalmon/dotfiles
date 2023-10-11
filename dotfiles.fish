#!/usr/bin/env fish

function dotdiff
    if not test -e $argv[1]
    or not test -e $argv[2]
        return 1
    end

    git diff --no-index $argv
end

cd (status dirname)

source env.fish

switch $argv[1]
    case "backup"
        for dotfile in $dotfiles
            set backupfile (string replace ~ dotfiles $dotfile)

            if test -e $dotfile
            and not dotdiff $backupfile $dotfile
                mkdir -p (dirname $backupfile)
                cp -i -p -v $dotfile $backupfile
            end
        end

    case "restore"
        for dotfile in $dotfiles
            set backupfile (string replace ~ dotfiles $dotfile)

            if test -e $backupfile
            and not dotdiff $dotfile $backupfile
                mkdir -p (dirname $dotfile)
                cp -i -p -v $backupfile $dotfile
            end
        end

    case "clean"
        if test (ls -A dotfiles | count) -gt 0
            rm -r -f -v dotfiles/.*
            touch dotfiles/.empty
        end

    case "*"
        echo "usage: dotfiles.fish backup|restore|clean"
        exit 1
end
