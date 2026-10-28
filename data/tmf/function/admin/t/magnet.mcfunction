execute if score #magnet tmf.cfg matches 1.. run return run function tmf:admin/t/magnet_off
scoreboard players set #magnet tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Item Magnet",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/inventory
