execute unless data storage tmf:tmp tl[0] run return 0
data modify storage tmf:tmp te set from storage tmf:tmp tl[0]
data remove storage tmf:tmp tl[0]
execute store result score #c tmf.tmp run data get storage tmf:tmp te.id
execute store result storage tmf:tmp te.code int 1 run scoreboard players add #c tmf.tmp 200000
execute unless score #c tmf.tmp = #cm tmf.tmp run function tmf:tpa/list_m with storage tmf:tmp te
function tmf:tpa/list_next
