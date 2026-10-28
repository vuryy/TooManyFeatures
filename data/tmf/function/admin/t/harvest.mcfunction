execute if score #harvest tmf.cfg matches 1.. run return run function tmf:admin/t/harvest_off
scoreboard players set #harvest tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Right-Click Harvest",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/farming
