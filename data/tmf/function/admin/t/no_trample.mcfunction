execute if score #no_trample tmf.cfg matches 1.. run return run function tmf:admin/t/no_trample_off
scoreboard players set #no_trample tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"No Crop Trampling",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/farming
