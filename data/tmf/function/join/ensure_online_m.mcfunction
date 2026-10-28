$execute if data storage tmf:data online[{id:$(id)}] run return 0
scoreboard players operation @s tmf.sess = #tick tmf.c
summon minecraft:item_display ~ ~ ~ {Tags:["tmf.namebuf"]}
loot replace entity @n[type=minecraft:item_display,tag=tmf.namebuf] contents loot tmf:player_head
$data modify storage tmf:tmp on.entry set value {id:$(id),name:"?",start:0}
data modify storage tmf:tmp on.entry.name set from entity @n[type=minecraft:item_display,tag=tmf.namebuf] item.components."minecraft:profile".name
execute store result storage tmf:tmp on.entry.start int 1 run scoreboard players get #tick tmf.c
kill @e[type=minecraft:item_display,tag=tmf.namebuf]
data modify storage tmf:data online append from storage tmf:tmp on.entry
function tmf:names/store with storage tmf:tmp on.entry
