scoreboard players set #found tmf.tmp 1
execute store result score #age tmf.tmp run data get entity @s Age
execute store result score #love tmf.tmp run data get entity @s InLove
scoreboard players operation #t tmf.tmp = #age tmf.tmp
execute if score #t tmf.tmp matches ..-1 run scoreboard players operation #t tmf.tmp *= #m1 tmf.c
scoreboard players operation #t tmf.tmp /= #20 tmf.c
scoreboard players operation #mm tmf.tmp = #t tmf.tmp
scoreboard players operation #mm tmf.tmp /= #60 tmf.c
scoreboard players operation #ss tmf.tmp = #t tmf.tmp
scoreboard players operation #ss tmf.tmp %= #60 tmf.c
data modify storage tmf:tmp br set value {z:""}
execute if score #ss tmf.tmp matches ..9 run data modify storage tmf:tmp br.z set value "0"
execute store result storage tmf:tmp br.m int 1 run scoreboard players get #mm tmf.tmp
execute store result storage tmf:tmp br.s int 1 run scoreboard players get #ss tmf.tmp
scoreboard players set @a[tag=tmf.hs_player] tmf.abt 10
execute if score #love tmf.tmp matches 1.. run return run title @a[tag=tmf.hs_player] actionbar [{text:"❤ ",color:"red"},{text:"In love – looking for a partner",color:"light_purple"}]
execute if score #age tmf.tmp matches 0 run return run title @a[tag=tmf.hs_player] actionbar [{text:"❤ ",color:"red"},{text:"Ready to breed",color:"green"}]
execute if score #age tmf.tmp matches 1.. run return run function tmf:breed/cooldown with storage tmf:tmp br
function tmf:breed/baby with storage tmf:tmp br
