tag @s add tmf.known
execute unless score @s tmf.id matches 1.. run function tmf:join/assign_id
scoreboard players set @s tmf.leave 0
function tmf:locks/apply_self
function tmf:join/ensure_online
execute unless score #join_leave tmf.cfg matches 1 run return 0
execute if entity @s[advancements={minecraft:story/root=true}] run return run function tmf:join/welcome
execute if items entity @s container.* * run return run function tmf:join/welcome
tellraw @a [{text:"✦ ",color:"gold"},{text:"Please welcome ",color:"yellow"},{selector:"@s",color:"gold",bold:true},{text:" – it's their first time here!",color:"yellow"}]
function tmf:join/welcome
