#!/usr/bin/env fish

function foofunc
    argparse 'year=!_validate_int --min=1967 --max=1979' -- $argv ; or return
    
    echo $_flag_year
end


# Passes validation
foofunc --year 1967
foofunc --year 1979

# Fails validation
foofunc --year 17
foofunc --year 'Soma'


# The _validate_int function is built into fish.
