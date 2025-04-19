#!/usr/bin/env fish

function foofunc
    argparse 'foo-bar=' -- $argv ; or return

    echo $_flag_foo_bar #dash replaced by underscore
end

foofunc --foo-bar spaceboy

# Any characters in a flag name that would not be valid in a
# variable name, such as a dash (-), will be replaced with
# underscores (_) in the $_flag_<flagname> created by fish.
# However, a single dash can be used to define an option
# which results in only the long variable being created, 
# such as "x-xray=", but this is not shown in this example.




function foofunc2
    argparse 'x-xray=' -- $argv ; or return

    echo "Short" $_flag_x      #empty
    echo "Long"  $_flag_xray   #succeeds
end

foofunc2 -x annie
foofunc2 --xray annie

# The dash (-) in "x-xray=" means that the $_flag_x variable
# will not be created, while the $_flag_xray variable will still
# be created as expected.  When a slash (/) is used instead for
# the option, such as "x/xray=", both variables will be created.
# The "x-xray=" option string can be created with this command:
#   fish_opt --short x --long xray --long-only --required-val
# When the function is called, both the "-x" and "--xray" flags
# are acceptable, but whatever argument is given ("-x annie")
# will be assigned to only the long variable ($_flag_xray).
# For simplicity, it might be better to avoid using the dash,
# like in "x-ray=", and only use the slash, like in "x/ray=".
