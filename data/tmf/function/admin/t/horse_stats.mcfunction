execute if score #horse_stats tmf.cfg matches 1.. run return run function tmf:admin/t/horse_stats_off
scoreboard players set #horse_stats tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Horse Stats",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/mobs
