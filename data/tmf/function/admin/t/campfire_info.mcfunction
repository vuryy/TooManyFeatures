execute if score #campfire_info tmf.cfg matches 1.. run return run function tmf:admin/t/campfire_info_off
scoreboard players set #campfire_info tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Campfire Timer",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/info
