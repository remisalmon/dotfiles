#!/usr/bin/env fish

function dotcopy
    set sourcefile $argv[1]
    set destfile $argv[2]

    if not test -e $sourcefile
        return
    else if test -e $destfile
    and diff $destfile $sourcefile
        return
    end

    mkdir -p (dirname $destfile)
    cp -i -p -v $sourcefile $destfile
end

cd (status dirname)

source env.fish

switch $argv[1]
    case "backup"
        for dotfile in $dotfiles
            dotcopy $dotfile (string replace ~ dotfiles $dotfile)
        end

    case "restore"
        for dotfile in $dotfiles
            dotcopy (string replace ~ dotfiles $dotfile) $dotfile
        end

    case "clean"
        rm -r -f -v dotfiles/.*
        touch dotfiles/.empty

    case "*"
        echo "usage: "(status basename)" backup|restore|clean"
        exit 1
end
