execute if score #breed_info tmf.cfg matches 1.. run return run function tmf:admin/t/breed_info_off
scoreboard players set #breed_info tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Breeding Info",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/mobs
