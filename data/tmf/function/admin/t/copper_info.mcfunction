execute if score #copper_info tmf.cfg matches 1.. run return run function tmf:admin/t/copper_info_off
scoreboard players set #copper_info tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Copper Oxidation Info",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/farming
