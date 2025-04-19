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

# Flag must be a positive or negative whole integer
# and match the "^--?\d+$" regex pattern, hence,
# the following examples fail:
foofunc --year apple
foofunc -y 0xFF
foofunc -+33
foofunc -3.141592

# The "argparse 'y#year'" flag cannot be postfixed with 
# with "=" or "=?", hence, these examples both fail:
#       argparse 'y#year=' -- $argv ; or return
#       argparse 'y#year=?' -- $argv ; or return
