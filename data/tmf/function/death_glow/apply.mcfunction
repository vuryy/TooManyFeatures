scoreboard players set #n tmf.tmp 0
$execute in $(dim) positioned $(x) $(y) $(z) as @e[type=minecraft:item,distance=..8,tag=!tmf.dg] run function tmf:death_glow/mark
$execute in $(dim) positioned $(x) $(y) $(z) as @e[type=minecraft:experience_orb,distance=..8] run data modify entity @s Glowing set value 1b
execute if score #n tmf.tmp matches 0 run return 0
$tellraw @s [{text:"☠ ",color:"red"},{text:"Your ",color:"gray"},{score:{name:"#n",objective:"tmf.tmp"},color:"yellow"},{text:" dropped stacks are glowing at ",color:"gray"},{text:"$(x) $(y) $(z)",color:"yellow",click_event:{action:"copy_to_clipboard",value:"$(x) $(y) $(z)"},hover_event:{action:"show_text",value:"Click to copy"}},{text:" ($(dim)). They stay for 10 minutes.",color:"gray"}]
