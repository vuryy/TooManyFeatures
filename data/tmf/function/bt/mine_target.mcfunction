execute if block ~ ~ ~ #tmf:bt_skip run return fail
execute align xyz if function tmf:bt/needs_swap run return run function tmf:bt/swap_now
return fail
