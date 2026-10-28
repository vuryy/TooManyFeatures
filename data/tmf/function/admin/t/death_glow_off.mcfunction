scoreboard players set #death_glow tmf.cfg 0

function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Death-Drop Glow",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/combat
