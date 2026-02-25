#!/usr/bin/env fish

function foofunc
    argparse 'x=+' -- $argv ; or return

    echo "x: $_flag_x"
end

foofunc -x #error
foofunc -x3 -x5 -x7

# The "=+" postfix in "x=+" permits multiple uses in one command.
# The $_flag_x variable is automatically created by Fish and
# it will contain "3 5 7" joined with spaces in the above example.
# It does not concatenate them without spaces, e.g., "357". Note
# that "-x" with no argument will throw an error that an argument
# is required.



# Starting with fish 4.1.0 (released 27.Sep.2025), the "=*" postfix
# may also be used to allow multiple optional arguments.  It is
# very similar to "=+", except that no argument is required when
# the option is used, e.g., "-y" does not show an error.

function barfunc
    argparse 'y=*' -- $argv ; or return

    echo "y: $_flag_y"
end

barfunc -y #no-error
barfunc -y2 -y4 -y8

