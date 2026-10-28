execute if score #best_tool tmf.cfg matches 1.. run return run function tmf:admin/t/best_tool_off
scoreboard players set #best_tool tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Tool Auto-Swap",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/mining
