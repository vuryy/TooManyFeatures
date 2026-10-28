execute if score #entity_warning tmf.cfg matches 1.. run return run function tmf:admin/t/entity_warning_off
scoreboard players set #entity_warning tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Entity Crowd Warning",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/multiplayer
