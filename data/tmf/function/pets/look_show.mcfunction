scoreboard players set #found tmf.tmp 1
data modify storage tmf:tmp pl set value {o:"an offline player",h:"",oc:"gray"}
execute store result score #h tmf.tmp run data get entity @s Health 10
scoreboard players operation #hi tmf.tmp = #h tmf.tmp
scoreboard players operation #hi tmf.tmp /= #10 tmf.c
scoreboard players operation #hf tmf.tmp = #h tmf.tmp
scoreboard players operation #hf tmf.tmp %= #10 tmf.c
execute store result storage tmf:tmp pl.hi int 1 run scoreboard players get #hi tmf.tmp
execute store result storage tmf:tmp pl.hf int 1 run scoreboard players get #hf tmf.tmp
execute store result storage tmf:tmp pl.mx int 1 run attribute @s minecraft:max_health get
data modify storage tmf:tmp pl.u set from entity @s Owner
function tmf:pets/owner_name with storage tmf:tmp pl
execute on owner run data modify storage tmf:tmp pl.oc set value "white"
scoreboard players set @a[tag=tmf.hs_player] tmf.abt 10
execute if score #fp tmf.tmp matches 1 if score #fo tmf.tmp matches 1 run return run function tmf:pets/show_both with storage tmf:tmp pl
execute if score #fp tmf.tmp matches 1 run return run function tmf:pets/show_health with storage tmf:tmp pl
function tmf:pets/show_owner with storage tmf:tmp pl
