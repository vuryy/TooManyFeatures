data modify storage tmf:tmp sb.cur set from storage tmf:tmp sb.items[0].item
data remove storage tmf:tmp sb.items[0]
execute unless data storage tmf:tmp sb.cur.count run data modify storage tmf:tmp sb.cur.count set value 1
function tmf:shulker/add with storage tmf:tmp sb.cur
execute if data storage tmf:tmp sb.items[0] run function tmf:shulker/collect
