execute if score #lodestone_coords tmf.cfg matches 1.. run return run function tmf:admin/t/lodestone_coords_off
scoreboard players set #lodestone_coords tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Compass Coordinates",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/info
