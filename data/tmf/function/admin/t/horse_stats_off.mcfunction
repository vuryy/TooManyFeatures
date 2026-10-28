scoreboard players set #horse_stats tmf.cfg 0

function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Horse Stats",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/mobs
