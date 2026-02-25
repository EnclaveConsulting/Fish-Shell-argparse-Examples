#!/usr/bin/env fish

function foofunc
    set --function a $argv[1]
    set --function b $argv[2]
    set --function c $argv[3]

    echo $a $b $c
    echo Count (count $argv)
end

foofunc apple orange soma
foofunc apple
foofunc 

# Use of argparse is not mandatory.
# $argv collects all arguments not processed by argparse.
# $argv is a list and so its elements may be accessed
# by their index numbers in the list, e.g., $argv[1].
