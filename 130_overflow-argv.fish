#!/usr/bin/env fish

function foofunc
    argparse 'x=' 'h' -- $argv ; or return
    
    for arg in $argv; echo $arg; end
end

foofunc -x 33 -h apple "pie is good" orange

# Error: "-z" is unknown
foofunc -x 33 -h -z dog kitty





function foofunc2
    argparse --ignore-unknown 'x=' 'h' -- $argv ; or return
    
    for arg in $argv; echo $arg; end
end

# Success: "-z" and "--why=44" added to $argv
foofunc2 -x 33 -h -z --why=44 dog kitty




# $argv catches the remaining arguments, if any, that 
# were not assigned to named options.  Attempting to
# use an undefined option (-z) throws an error, unless
# argparse --ignore-unknown is used, in which case the
# unknown option(s) are added to $argv too.
