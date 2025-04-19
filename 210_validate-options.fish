#!/usr/bin/env fish

function foofunc
    argparse 'name=!_validate_name' 'year=?!_validate_year' -- $argv ; or return
    
    echo "$_flag_name was born in $_flag_year"
end


# Validation helper function for foofunc above
function _validate_year
    test $_flag_value -ge 1967 -a $_flag_value -le 1979
        or echo "Failed to validate year: $_flag_value" && return 1
end


# Validation helper function for foofunc above
function _validate_name
    string match --quiet --regex 'B+ilC*l[ye]' $_flag_value
        or echo "Failed to validate name: $_flag_value" && return 1
end



# Passes validation checks
foofunc --name Billy --year=1967

# Fails name validation
foofunc --name Jimmy --year=1979

# Fails year validation
foofunc --name Bille --year=1964


# A validation function must return 0 for the validation to succeed.
# This can be done explicity ("return 0") or implicity with another
# command that silently sets $status to 0.

# Validation functions are not required when the validation code
# can fit after the exclamation mark (!) flag postfix, but will
# make the script easier to understand and maintain.  No examples
# of this are above.

# Validation functions do not have to begin with an underscore (_).

# Validation functions do not have to be defined after or lower
# in the script than the function which uses them for validation;
# for example, the _validate_name and _validate_year functions can
# be moved above the foofunc function in the script without errors.

# argparse flags may be postfixed like usual with "=" or "=?" even  
# when post-postfixed with "!" for validation, such as when
# "name=!" and "year=?!" are used without errors with argparse above.
