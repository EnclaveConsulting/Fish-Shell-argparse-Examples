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

# Note the "!" in argparse's option string.
# The "!" is followed by the name of a validation function.
# The _validate_int function is built into Fish.
