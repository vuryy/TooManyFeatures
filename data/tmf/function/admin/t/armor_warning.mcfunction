execute if score #armor_warning tmf.cfg matches 1.. run return run function tmf:admin/t/armor_warning_off
scoreboard players set #armor_warning tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Armor Warning",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/mining
