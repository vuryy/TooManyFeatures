data modify storage tmf:tmp pk.cur set from storage tmf:tmp pk.inv[0]
data remove storage tmf:tmp pk.inv[0]
execute unless data storage tmf:tmp pk.cur.count run data modify storage tmf:tmp pk.cur.count set value 1
function tmf:pickup/agg_m with storage tmf:tmp pk.cur
execute if data storage tmf:tmp pk.inv[0] run function tmf:pickup/agg
