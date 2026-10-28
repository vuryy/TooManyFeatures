scoreboard players set #enderman_guard tmf.cfg 0
function tmf:enderman/strip_all
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Enderman Anti-Grief",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/mobs
