#!/usr/bin/env fish

function foofunc
    argparse 'x' -- $argv ; or return

    if set --query --function _flag_x
        set myx yes
    else
        set myx no
    end
    
    echo '$x_flag_x is' $_flag_x
    echo '$myx is' $myx
end

foofunc -x
foofunc

# Fish does not have boolean values like other languages, so
# beware of assuming that a "boolean" variable will always
# exist or be set to 0, 1, true, false, $true or $false.

# Test for the existence of a "boolean" variable, then set it;
# otherwise, a set "boolean" will be set to it's own name (-x).

# Setting a new variable (like $myx) to yes/no can avoid ambiguity.
