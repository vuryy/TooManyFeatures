execute if score #double_doors tmf.cfg matches 1.. run return run function tmf:admin/t/double_doors_off
scoreboard players set #double_doors tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Double Doors",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/farming
