data modify storage tmf:tmp pk.e set from storage tmf:tmp pk.list[0]
data remove storage tmf:tmp pk.list[0]
function tmf:pickup/diff_m with storage tmf:tmp pk.e
execute if data storage tmf:tmp pk.list[0] run function tmf:pickup/diff
