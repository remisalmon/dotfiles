#!/usr/bin/env fish

function diff
    if not test -e $argv[1]
    or not test -e $argv[2]
        return
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
    if test -s dotfiles/
        rm -r -f -v dotfiles/.*
    end
    exit
end

source env.fish

for dotfile in $dotfiles
    set path (string split -f 2 ~ (dirname $dotfile))
    set file (basename $dotfile)

    if test $argv[1] = 'backup'
    and test -e $dotfile
        diff dotfiles{$path}/{$file} $dotfile
        mkdir -p dotfiles{$path}
        cp -i -p -v $dotfile dotfiles{$path}

    else if test $argv[1] = 'restore'
    and test -e ~/{$path}
    and test -e dotfiles{$path}/{$file}
        diff $dotfile dotfiles{$path}/{$file}
        cp -i -p -v dotfiles{$path}/{$file} $dotfile
    end
end
