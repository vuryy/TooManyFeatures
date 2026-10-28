execute if score #coords_hud tmf.cfg matches 1.. run return run function tmf:admin/t/coords_hud_off
scoreboard players set #coords_hud tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Coordinates HUD",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/info
