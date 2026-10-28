$execute if entity @a[scores={tmf.id=$(id)}] run return run data modify storage tmf:tmp lv.keep append from storage tmf:tmp lv.cur
# player left: remember when (for the player inspector), then session length
$execute store result storage tmf:data names[{id:$(id)}].left int 1 run scoreboard players get #tick tmf.c
$scoreboard players set #st tmf.tmp $(start)
scoreboard players operation #len tmf.tmp = #tick tmf.c
scoreboard players operation #len tmf.tmp -= #st tmf.tmp
scoreboard players operation #lh tmf.tmp = #len tmf.tmp
scoreboard players operation #lh tmf.tmp /= #72000 tmf.c
scoreboard players operation #lm tmf.tmp = #len tmf.tmp
scoreboard players operation #lm tmf.tmp /= #1200 tmf.c
scoreboard players operation #lm tmf.tmp %= #60 tmf.c
$execute if score #join_leave tmf.cfg matches 1 run tellraw @a [{text:"👋 ",color:"gray"},{text:"$(name)",color:"gray"},{text:" played for ",color:"dark_gray"},{score:{name:"#lh",objective:"tmf.tmp"},color:"gray"},{text:"h ",color:"gray"},{score:{name:"#lm",objective:"tmf.tmp"},color:"gray"},{text:"m this session. See you soon!",color:"dark_gray"}]
