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
    if test (ls -a dotfiles | wc -l) -gt 2
        rm -r -f -v dotfiles/.*
    end

    exit 0
end

source env.fish

for dotfile in $dotfiles
    set source $dotfile
    set backup dotfiles(string split -f 2 ~ $dotfile)

    if test $argv[1] = 'backup'
    and test -e $source
    and not dotdiff $backup $source
        mkdir -p (dirname $backup)
        cp -i -p -v $source $backup

    else if test $argv[1] = 'restore'
    and test -e $backup
    and test -e (dirname $source)
    and not dotdiff $source $backup
        cp -i -p -v $backup $source
    end
end
