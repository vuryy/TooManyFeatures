execute if score #biome_info tmf.cfg matches 1.. run return run function tmf:admin/t/biome_info_off
scoreboard players set #biome_info tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Biome Change Info",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/info
