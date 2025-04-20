#!/usr/bin/env fish

function foofunc
    for a in $argv
        switch $a
            case 3
                echo Three
            case 5
                echo Five
                break
            case \*
                echo Other
        end
    end
end

foofunc 3 7
foofunc 3 5 7 9

# Use of argparse is not mandatory.
# $argv collects all arguments not processed by argparse.
