#!/usr/bin/env fish

function foofunc
    for a in $argv
        echo $a
    end
end

foofunc 3 5 7

# Use of argparse is not mandatory.
# $argv collects all arguments not processed by argparse.
