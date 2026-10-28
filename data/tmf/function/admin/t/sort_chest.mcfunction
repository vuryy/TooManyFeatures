execute if score #sort_chest tmf.cfg matches 1.. run return run function tmf:admin/t/sort_chest_off
scoreboard players set #sort_chest tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Sort Chest",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/inventory
