#!/usr/bin/env fish

function foofunc
    argparse 'y/year=?' 'h/help' -- $argv ; or return

    if set --query --function _flag_h
        echo "Some help"
        return 1
    end

    if set --query --function _flag_y
        echo $_flag_y
    else
        set _flag_y 1967
        echo $_flag_y
    end
end

foofunc --year=1979
foofunc --help
foofunc --year=1979 --help
foofunc

# When there is an option that does not require an argument (y/year=?)
# and that option is not used when calling a function, the flag variable
# that is normally created to hold the argument to that option is 
# not created at all.  Test for a variable with "set --query".

# When an option that never takes an argument (h/help) is
# not used when calling the function, the flag variable for 
# that option ($_flag_h) is not created at all.  If that variable
# is created, it does not contain 0, true or $true (it is not 
# actually a boolean), it contains other text.
