execute if score #veinminer tmf.cfg matches 1.. run return run function tmf:admin/t/veinminer_off
scoreboard players set #veinminer tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Veinminer",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/mining
