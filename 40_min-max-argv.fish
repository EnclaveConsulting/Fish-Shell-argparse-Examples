#!/usr/bin/env fish

function foofunc
    argparse --min-args=2 --max-args=4 -- $argv ; or return

    echo $argv
end

foofunc 1
foofunc 1 2
foofunc 1 2 3
foofunc 1 2 3 4
foofunc 1 2 3 4 5
