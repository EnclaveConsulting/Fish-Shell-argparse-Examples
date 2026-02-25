#!/usr/bin/env fish

function foofunc
    argparse --ignore-unknown 'x/xray' 'y/year' 'z/zoo' -- $argv ; or return

    echo '     $argv: ' $argv
    echo '$argv_opts: ' $argv_opts
end

foofunc -uxyz
foofunc -xuyz
foofunc -xyuz
foofunc -xyzu


# Starting with fish 3.1b1 (released 26.Jan.2020), argparse may
# be run with "--ignore-unknown", but this has been deprecated and
# should no longer be used.  In the examples above, x, y and z are 
# defined (or "known") flags, while u is unknown/undefined. The 
# output of the above script is:
#        $argv:  -uxyz
#   $argv_opts:
#        $argv:  -uyz
#   $argv_opts:  -x
#        $argv:  -uz
#   $argv_opts:  -xy
#        $argv:  -u
#   $argv_opts:  -xyz
# In $argv, every option prior (or to the left of) the unknown
# option u is moved from $argv to $argv_opts. Notice that it is 
# not the unknown u which is moved, but everything to the left/prior
# to it, hence, when u is last, x, y and z are all moved. Again,
# this deprecated feature should no longer be used.


echo '---------------------------------'

function barfunc
    argparse --move-unknown 'a/ant' 'b/bear' 'c/cat' -- $argv ; or return
    echo '         a: ' $_flag_a
    echo '         b: ' $_flag_b
    echo '         c: ' $_flag_c
    echo '     $argv: ' $argv
    echo '$argv_opts: ' $argv_opts
    echo 
end

barfunc -abc
barfunc -uabc
barfunc -aubc
barfunc -abuc
barfunc -abcu


# Starting with fish 4.1.0 (released 27.Jan.2025), argparse may
# be run with "--move-unknown" to better handle short-named
# options than "--ignore-unknown", which has been deprecated. When
# the above code with barfunc is run, the following output is
# produced. Notice that $argv is never filled, but $argv_ops
# sometimes is. As short-named options are parsed from left to right,
# flag variables are filled when possible, but once an unknown
# argument (like u) is encountered, no further flag variables are
# filled; however, $argv_opts always contains all the options.
#
#            a:  -a
#            b:  -b
#            c:  -c
#        $argv:
#   $argv_opts:  -abc
#
#            a:  
#            b:  
#            c:  
#        $argv:
#   $argv_opts:  -uabc
#
#            a:  -a
#            b:  
#            c:  
#        $argv:
#   $argv_opts:  -aubc
#
#            a:  -a
#            b:  -b
#            c:  
#        $argv:
#   $argv_opts:  -abuc
#
#            a:  -a
#            b:  -b
#            c:  -c
#        $argv:
#   $argv_opts:  -abcu
#
# However, the above behavior can further be modified by using
# "argparse --unknown-arguments <KIND>", which implies "--move-unknown"
# too, and changes the behavior based on the <KIND> of the option.  And
# then even this customizable behavior can change with "--stop-nonopt"
# too. And all of these short options handling gymnastics can be replaced
# with "--strict-longopts" so that only long-named options may be used
# to avoid the inevitable confusion.




