#!/usr/bin/env fish

function dotdiff
    if not test -e $argv[1]
    or not test -e $argv[2]
        return 1
    end

    git diff --no-index $argv
end

if test (count $argv) -eq 0
or not contains $argv[1] 'backup' \
                         'restore' \
                         'clean'
    echo 'usage: dotfiles.fish backup|restore|clean'
    exit 1
end

if test $argv[1] = 'clean'
    if test (ls -A dotfiles | count) -gt 0
        rm -r -f -v dotfiles/.*
    end

    exit 0
end

source env.fish

for dotfile in $dotfiles
    set backupfile (string replace ~ dotfiles $dotfile)

    if test $argv[1] = 'backup'
    and test -e $dotfile
    and not dotdiff $backupfile $dotfile
        mkdir -p (dirname $backupfile)
        cp -i -p -v $dotfile $backupfile

    else if test $argv[1] = 'restore'
    and test -e $backupfile
    and test -e (dirname $dotfile)
    and not dotdiff $dotfile $backupfile
        cp -i -p -v $backupfile $dotfile
    end
end
