#!/usr/bin/env fish


function foofunc1
    argparse 'x=' 'y=' -- $argv ; or return
    echo $status
end


function foofunc2
    argparse 'x=' 'y=' -- $argv
        or return
    echo $status
end


# The "or return" is not required
function foofunc3
    argparse 'x=' 'y=' -- $argv
    echo $status
end


# Minimum to use argparse at all
function foofunc4
    argparse -- $argv
    echo $status
end


foofunc1 -x 33 -y 1979
foofunc2 -x 33 -y 1979
foofunc3 -x 33 -y 1979
foofunc4


# The argparse function returns 0 when it successfully processes
# options and arguments without error; hence, the "or return" will 
# return a non-zero code number and exit the function where there
# is an argparse problem.

# Having "or return" somewhere is not required to use argparse.
