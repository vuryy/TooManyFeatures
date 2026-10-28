advancement revoke @s only tmf:tool_swap/damaged
execute unless score #tool_swap tmf.cfg matches 1 run return 0
execute unless entity @s[tag=tmf.on.tool_swap] run return 0
execute unless items entity @s weapon.mainhand *[minecraft:damage~{durability:{max:2}}] run return 0
data modify storage tmf:tmp swap set value {}
data modify storage tmf:tmp swap.id set from entity @s SelectedItem.id
execute if function tmf:tool_swap/find run return 1
# no spare found: warn (once per second at most)
execute if score @s tmf.swapcd > #tick tmf.c run return 0
scoreboard players operation @s tmf.swapcd = #tick tmf.c
scoreboard players add @s tmf.swapcd 20
function tmf:util/actionbar_cd
title @s actionbar [{text:"⚠ ",color:"red"},{text:"Your tool is about to break!",color:"gold"}]
playsound minecraft:block.note_block.bass player @s ~ ~ ~ 0.8 0.6
