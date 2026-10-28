execute if score #zombie_doors tmf.cfg matches 1.. run return run function tmf:admin/t/zombie_doors_off
scoreboard players set #zombie_doors tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"No Zombie Door Breaking",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/griefing
