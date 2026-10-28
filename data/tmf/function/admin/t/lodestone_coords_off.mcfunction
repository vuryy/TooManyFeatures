scoreboard players set #lodestone_coords tmf.cfg 0

function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Compass Coordinates",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/info
