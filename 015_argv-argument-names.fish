#!/usr/bin/env fish

function foofunc --argument-names argument1 argument2 argument3
    echo '$argv list:' $argv
    
    echo '$argument1:' $argument1
    echo '$argument2:' $argument2
    echo '$argument3:' $argument3
end

foofunc cat dog deer

foofunc blue yellow green red 


# Use of argparse is not mandatory.

# $argv collects all arguments not processed by argparse.
# Copies of arguments not handled by argparse may be
# assigned to the variable names after --argument-names
# in the definition of the function.  These variables
# will have local scope and will be unexported.  When
# arguments are copied to your own variables in this way, 
# $argv can be ignored or not used in your function.

# If more arguments are given than variable names defined, 
# no error is thrown; the extra arguments are simply not 
# assigned, e.g., the "red" argument above still goes into 
# $argv, but it is not also copied into another variable.
# Your own custom variables do not have to be named like
# $argument1, $argument2, etc., these are just examples.
