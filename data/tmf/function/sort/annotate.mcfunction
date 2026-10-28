data modify storage tmf:tmp sc.cur set from storage tmf:tmp sc.in[0]
data remove storage tmf:tmp sc.in[0]
data remove storage tmf:tmp sc.cur.Slot
execute unless data storage tmf:tmp sc.cur.count run data modify storage tmf:tmp sc.cur.count set value 1
function tmf:sort/rank with storage tmf:tmp sc.cur
execute if data storage tmf:tmp sc.cur.components."minecraft:max_stack_size" run data modify storage tmf:tmp sc.cur.m set from storage tmf:tmp sc.cur.components."minecraft:max_stack_size"
data modify storage tmf:tmp sc.work append from storage tmf:tmp sc.cur
execute if data storage tmf:tmp sc.in[0] run function tmf:sort/annotate
