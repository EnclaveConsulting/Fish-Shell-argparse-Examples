#!/usr/bin/env fish

function foofunc
    argparse --exclusive apple,orange \
             --exclusive up,down \
             'apple=?' 'up=?' \
             'orange=?' 'down=?' -- $argv ; or return

    echo "Status $status"
end

# Permitted
foofunc --apple=2 --up=3
foofunc --orange=4 --down=5

# Forbidden
foofunc --apple=2 --orange=4
foofunc --up=3 --down=5

# --exclusive takes a comma-delimited list of options
# that cannot be used together.  Multiple uses of
# --exclusive is permitted, as shown in this example.
