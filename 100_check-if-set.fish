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
