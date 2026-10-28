scoreboard players set #trader_alert tmf.cfg 0

function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Wandering Trader Alert",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/mobs
