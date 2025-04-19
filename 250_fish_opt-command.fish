#!/usr/bin/env fish

# The fish_opt command can help create options for use with argparse.

fish_opt --short x
# x

fish_opt --short x --long xray
# x/xray

fish_opt --short x --long xray --required-val
# x/xray=

fish_opt --short x --long xray --multiple-vals
# x/xray=+

fish_opt --short x --long xray --optional-val
# x/xray=?

fish_opt --short x --long xray --required-val --long-only
# x-xray=


                                                                                                   
function foofunc
    set --function options
    set options $options (fish_opt --short x --long xray --required-val)
    set options $options (fish_opt --short y --long year --optional-val)
    set options $options (fish_opt --short c --long cert --multiple-vals)
    set options $options (fish_opt --short b --long byte --multiple-vals)
    set options $options (fish_opt --short l --long license)    
    set options $options (fish_opt --short v --long verbose)

    argparse $options -- $argv ; or return 
    echo $options
end

foofunc

# A variable may be created ($options) and filled with option strings by
# repeatedly running fish_opt while appending the output to the variable,
# then argparse could be called with this variable (argparse $options -- $argv).
# This might make the script easier to understand, especially when a comment
# line is added above each of the calls to fish_opt while filling the variable.
# Note that argparse does not have to be the first line of a function or script.
# Note that the above function (foofunc) runs without error without any arguments.
