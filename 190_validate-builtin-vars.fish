#!/usr/bin/env fish

function _validate_year
    echo '$_argparse_cmd: ' $_argparse_cmd
    echo '$_flag_name:    ' $_flag_name
    echo '$_flag_value:   ' $_flag_value
    return 0
end

function foofunc
    argparse 'year=?!_validate_year' -- $argv ; or return
    
    echo $_flag_year
end

foofunc --year=1979 
