execute if score #stats_card tmf.cfg matches 1.. run return run function tmf:admin/t/stats_card_off
scoreboard players set #stats_card tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Stats Card",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/multiplayer
