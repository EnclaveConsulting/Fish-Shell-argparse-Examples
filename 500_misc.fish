#!/usr/bin/env fish

function foofunc
    argparse 'foo-bar=' -- $argv ; or return

    echo $_flag_foo_bar #dash replaced by underscore
end

foofunc --foo-bar spaceboy

# Any characters in a flag name that would not be valid in a
# variable name, such as a dash (-), will be replaced with
# underscores (_) in the $_flag_<flagname> created by fish.
