execute if score #pet_teleport tmf.cfg matches 1.. run return run function tmf:admin/t/pet_teleport_off
scoreboard players set #pet_teleport tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Pet Teleport",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/mobs
