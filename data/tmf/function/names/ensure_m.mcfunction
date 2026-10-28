$execute if data storage tmf:data names[{id:$(id)}] run return 0
summon minecraft:item_display ~ ~ ~ {Tags:["tmf.namebuf"]}
loot replace entity @n[type=minecraft:item_display,tag=tmf.namebuf] contents loot tmf:player_head
$data modify storage tmf:tmp ne.e set value {id:$(id),name:"?"}
data modify storage tmf:tmp ne.e.name set from entity @n[type=minecraft:item_display,tag=tmf.namebuf] item.components."minecraft:profile".name
kill @e[type=minecraft:item_display,tag=tmf.namebuf]
function tmf:names/store with storage tmf:tmp ne.e
