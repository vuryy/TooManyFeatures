execute unless data storage tmf:tmp cf.e[0] run return 0
data modify storage tmf:tmp cg.cur set from storage tmf:tmp cf.e[0]
data remove storage tmf:tmp cf.e[0]
data modify storage tmf:tmp cg.cmp set from storage tmf:tmp cg.id
execute store success score #diff tmf.tmp run data modify storage tmf:tmp cg.cmp set from storage tmf:tmp cg.cur.id
execute if score #diff tmf.tmp matches 1 run data modify storage tmf:tmp cf.rest append from storage tmf:tmp cg.cur
execute if score #diff tmf.tmp matches 0 run function tmf:campfire/group_add
function tmf:campfire/group_scan
