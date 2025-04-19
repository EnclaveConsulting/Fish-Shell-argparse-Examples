#!/usr/bin/env fish

function foofunc
    argparse --stop-nonopt 'x=' 'y=' -- $argv ; or return
    
    for arg in $argv; echo $arg; end

    echo "x is $_flag_x"
    echo "y is $_flag_y"
end

# x=good and y=bad as expected.
# apple and orange in $argv as expected.
foofunc -x good -y bad apple orange

echo '-------------------------------'

# x and y are not assigned.
# $argv is filled with everything.
foofunc apple orange -x good -y bad

echo '-------------------------------'

# x=good as expected.
# apple, orange, -y, bad, -z and -w go into $argv.
foofunc -x good apple -y bad orange -z -w



# With --stop-nonopt, as soon as a non-option argument
# is encountered when calling a function, such as 
# "apple" in the examples above, no further options
# are processed and assigned to variables; instead,
# everything after the first non-option ("apple") is
# simply appended to $argv.  This includes both defined
# options (-y bad) and unknown options (-z -w).
