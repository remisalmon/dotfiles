#!/usr/bin/env fish

if test (count $argv) -eq 0 || not contains $argv[1] 'backup' \
                                                     'restore' \
                                                     'clean'
    echo 'usage: dotfiles.fish backup|restore|clean'
    exit 1
end

if test $argv[1] = 'clean'
    rm -r -f -v dotfiles && mkdir dotfiles
    exit
end

source env.fish

for dotfile in $dotfiles
    set path (string replace ~ '' (dirname $dotfile))

    if test $argv[1] = 'backup' && test -e $dotfile
        mkdir -p dotfiles{$path}
        cp -i -p -v $dotfile dotfiles{$path}
    else if test $argv[1] = 'restore' && test -e ~/{$path}
        cp -i -p -v dotfiles{$path}/(basename $dotfile) $dotfile
    end
end
