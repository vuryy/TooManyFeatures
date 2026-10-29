execute if score #v tmf.tmp matches 7010 run return run function tmf:spawn_tp/go
execute unless score #tpa tmf.cfg matches 1 run return run function tmf:menu/open
execute if entity @s[tag=tmf.off.tpa] run return run function tmf:menu/open
execute if score #v tmf.tmp matches 7000 run return run function tmf:tpa/open
execute if score #v tmf.tmp matches 7001 run return run function tmf:tpa/cancel
scoreboard players operation #tid tmf.tmp = #v tmf.tmp
scoreboard players operation #tid tmf.tmp %= #100000 tmf.c
scoreboard players operation #me tmf.tmp = @s tmf.id
data modify storage tmf:tmp tp set value {name:"?"}
execute store result storage tmf:tmp tp.id int 1 run scoreboard players get #tid tmf.tmp
scoreboard players operation #c tmf.tmp = #tid tmf.tmp
execute store result storage tmf:tmp tp.go int 1 run scoreboard players add #c tmf.tmp 300000
scoreboard players operation #c tmf.tmp = #tid tmf.tmp
execute store result storage tmf:tmp tp.here int 1 run scoreboard players add #c tmf.tmp 400000
scoreboard players operation #c tmf.tmp = #me tmf.tmp
execute store result storage tmf:tmp tp.acc int 1 run scoreboard players add #c tmf.tmp 500000
scoreboard players operation #c tmf.tmp = #me tmf.tmp
execute store result storage tmf:tmp tp.den int 1 run scoreboard players add #c tmf.tmp 600000
execute if score #v tmf.tmp matches 500001..599999 run return run function tmf:tpa/accept with storage tmf:tmp tp
execute if score #v tmf.tmp matches 600001..699999 run return run function tmf:tpa/deny with storage tmf:tmp tp
execute if score #tid tmf.tmp = #me tmf.tmp run return run function tmf:tpa/open
execute if score #v tmf.tmp matches 200001..299999 run return run function tmf:tpa/pick with storage tmf:tmp tp
data modify storage tmf:tmp tp.mode set value 1
data modify storage tmf:tmp tp.what set value "wants to teleport to you"
execute if score #v tmf.tmp matches 400001..499999 run data modify storage tmf:tmp tp.mode set value 2
execute if score #v tmf.tmp matches 400001..499999 run data modify storage tmf:tmp tp.what set value "asks you to teleport to them"
function tmf:tpa/send with storage tmf:tmp tp
