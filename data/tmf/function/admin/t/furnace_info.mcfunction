execute if score #furnace_info tmf.cfg matches 1.. run return run function tmf:admin/t/furnace_info_off
scoreboard players set #furnace_info tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Furnace Progress",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/info
