scoreboard players set #milestones tmf.cfg 0

function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Playtime Milestones",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/multiplayer
