execute if score #campfire_regen tmf.cfg matches 1.. run return run function tmf:admin/t/campfire_regen_off
scoreboard players set #campfire_regen tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Campfire Regen",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/combat
