#!/usr/bin/env fish

function foofunc
    argparse 'n/name=?' 'y/year=?' 'v/verbose' -- $argv ; or return

    # Set defaults by creating new variables with --function scope
    set --function name Billy
    set --function year 1967
    set --function verbose no

    # Update these new variables if necessary
    if set --query --function _flag_name
        set name $_flag_name
    end

    if set --query --function _flag_year
        set year $_flag_year
    end
    
    if set --query --function _flag_verbose
        set verbose yes
    end

    # Use the new variables, not the $_flag_variables
    echo "------------------"
    echo "Name: $name"
    echo "Year: $year"
    echo "Verbose: $verbose"
end

foofunc
foofunc --name=Justine --year=1979 
foofunc --year=1998 --name=Sheila
foofunc -v


# There are multiple ways to handle default arguments. This is just one way.

# Fish does not have boolean values, so using yes/no can avoid frustration:
#   if test $verbose = 'yes'; echo "is self-explanatory"; end
#   if test $verbose; echo "is ambiguous"; end

