execute if score #spawn_tp tmf.cfg matches 1.. run return run function tmf:admin/t/spawn_tp_off
scoreboard players set #spawn_tp tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Spawn Teleport",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/movement
