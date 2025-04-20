#!/usr/bin/env fish

function foofunc
    argparse 'y#year' -- $argv ; or return
    
    echo $_flag_year
end

foofunc --year 1979
foofunc -y 1979
foofunc -y -1979
foofunc -1979
foofunc --1979

# Note the "#" in the "y#year" option string, not "/".
# Argument must be a positive or negative whole integer
# and match the "^--?\d+$" regex pattern, hence,
# the following examples will fail:

foofunc --year apple
foofunc -y 0xFF
foofunc -+33
foofunc -3.141592

# Even the short option name can be omitted (-1979).
# Negative arguments are allowed (--1979).

# The "argparse 'y#year'" flag cannot be postfixed with 
# with "=" or "=?", hence, these two examples both fail:
#       argparse 'y#year=' -- $argv ; or return
#       argparse 'y#year=?' -- $argv ; or return
