execute if score #pet_health tmf.cfg matches 1.. run return run function tmf:admin/t/pet_health_off
scoreboard players set #pet_health tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Pet Health",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/mobs
