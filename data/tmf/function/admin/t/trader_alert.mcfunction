execute if score #trader_alert tmf.cfg matches 1.. run return run function tmf:admin/t/trader_alert_off
scoreboard players set #trader_alert tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Wandering Trader Alert",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/mobs
