#!/usr/bin/env fish

function foofunc
    argparse 'v/verbose' -- $argv ; or return

    echo Count v: (count $_flag_v)
    echo Count verbose: (count $_flag_verbose)
end


# Count v: 0
# Count verbose: 0
# $_flag_v does not even exist.
foofunc

# Count v: 1
# Count verbose: 1
foofunc -v

# Multiple uses is permitted.
# Count v: 2
# Count verbose: 2
foofunc -v -v
foofunc -vv

# Count v: 5
# Count verbose: 5
foofunc --verbose -v -v --verbose -v
foofunc -vvvvv



# Fish does not have boolean values like other languages,
# so beware of assuming that a "boolean" variable will always
# exist or be set to 0, 1, true, false, $true or $false.
