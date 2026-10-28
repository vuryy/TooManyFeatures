scoreboard players operation #dx tmf.tmp = #tx tmf.tmp
scoreboard players operation #dx tmf.tmp -= @s tmf.px
scoreboard players operation #dz tmf.tmp = #tz tmf.tmp
scoreboard players operation #dz tmf.tmp -= @s tmf.pz
scoreboard players operation #ax tmf.tmp = #dx tmf.tmp
execute if score #ax tmf.tmp matches ..-1 run scoreboard players operation #ax tmf.tmp *= #m1 tmf.c
scoreboard players operation #az tmf.tmp = #dz tmf.tmp
execute if score #az tmf.tmp matches ..-1 run scoreboard players operation #az tmf.tmp *= #m1 tmf.c
scoreboard players operation #big tmf.tmp = #ax tmf.tmp
scoreboard players operation #big tmf.tmp > #az tmf.tmp
scoreboard players operation #small tmf.tmp = #ax tmf.tmp
scoreboard players operation #small tmf.tmp < #az tmf.tmp
scoreboard players operation #small tmf.tmp *= #2 tmf.c
scoreboard players operation #small tmf.tmp /= #5 tmf.c
scoreboard players operation #big tmf.tmp += #small tmf.tmp
scoreboard players operation #big tmf.tmp /= #10 tmf.c
data modify storage tmf:tmp tr set value {ns:"",ew:""}
scoreboard players operation #a2 tmf.tmp = #ax tmf.tmp
scoreboard players operation #a2 tmf.tmp *= #2 tmf.c
scoreboard players operation #z2 tmf.tmp = #az tmf.tmp
scoreboard players operation #z2 tmf.tmp *= #2 tmf.c
execute if score #dz tmf.tmp matches ..-1 unless score #z2 tmf.tmp < #ax tmf.tmp run data modify storage tmf:tmp tr.ns set value "north"
execute if score #dz tmf.tmp matches 1.. unless score #z2 tmf.tmp < #ax tmf.tmp run data modify storage tmf:tmp tr.ns set value "south"
execute if score #dx tmf.tmp matches 1.. unless score #a2 tmf.tmp < #az tmf.tmp run data modify storage tmf:tmp tr.ew set value "east"
execute if score #dx tmf.tmp matches ..-1 unless score #a2 tmf.tmp < #az tmf.tmp run data modify storage tmf:tmp tr.ew set value "west"
execute store result storage tmf:tmp tr.d int 1 run scoreboard players get #big tmf.tmp
function tmf:trader/tell_m with storage tmf:tmp tr
playsound minecraft:entity.wandering_trader.ambient player @s ~ ~ ~ 0.6 1
