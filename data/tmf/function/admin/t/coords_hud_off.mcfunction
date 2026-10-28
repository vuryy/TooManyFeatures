scoreboard players set #coords_hud tmf.cfg 0

function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Coordinates HUD",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/info
