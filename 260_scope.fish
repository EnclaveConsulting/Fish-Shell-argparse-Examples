#!/usr/bin/env fish

# Run the script with an argument, "tree": ./260_scope.fish tree

function foofunc
    argparse 'x=' -- $argv ; or return

    set_color green
    set --show _flag_x   #local scope inside the function

    set_color yellow
    set --show argv      #local scope inside the function

    # A block defines a new scope with it's own local variables
    # unless a variable is explicitly given a different scope
    begin
        set --global gscope "Has global scope"
        set --function fscope "Has function scope"
        set --local lscope "Has local scope inside the block"
    end

    set_color white
    echo $fscope   #prints 'Has function scope' in white
    echo $lscope   #prints nothing, the variable is out of scope
end

foofunc -x 3 5     #3 goes into $_flag_x, 5 goes into the local $argv[1] 

set_color red
echo $argv[1]      #global to the script, prints 'tree' in red

set_color brblue
set --show gscope
echo $gscope       #prints 'Has global scope' in bright blue



# Eventually, you might have to care about the scope of variables;
# however, this is unlikely when you are getting started with Fish.
# See https://fishshell.com/docs/current/language.html#variable-scope
# To show information about a variable and it's scope, use "set --show".

# Run this script and pass in "tree" as an argument to the script.
# The word "tree" is just an arbitrary string, it has no special meaning.

# The $_flag_x variable created by argparse is local to the function.
# The function has another local variable: $argv.
# But the script as a whole also has a GLOBAL variable named $argv.

# Inside the function, the begin-end block defines another scope.
# Inside the begin-end block, new variables are local to the block
# by default, but variables may be set explicitly to different scopes
# such that they are visible outside of the begin-end block; for
# example, variables in the block can be made visible inside the
# function (set --function) or outside the function (set --global).
# An exported variable (not shown here) is copied into child processes.
# A universal variable (not shown here) would be visible in every Fish
# process, script, function or block, even after a reboot.
