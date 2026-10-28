execute if score #tool_swap tmf.cfg matches 1.. run return run function tmf:admin/t/tool_swap_off
scoreboard players set #tool_swap tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Tool Protector",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/mining
