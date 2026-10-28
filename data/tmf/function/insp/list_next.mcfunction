execute unless data storage tmf:tmp il[0] run return 0
data modify storage tmf:tmp ie set from storage tmf:tmp il[0]
data remove storage tmf:tmp il[0]
execute store result score #c tmf.tmp run data get storage tmf:tmp ie.id
scoreboard players add #c tmf.tmp 100000
execute store result storage tmf:tmp ie.code int 1 run scoreboard players get #c tmf.tmp
data modify storage tmf:tmp ie merge value {dot:"○",col:"gray"}
function tmf:insp/list_m with storage tmf:tmp ie
function tmf:insp/list_next
