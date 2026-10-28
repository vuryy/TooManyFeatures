execute if score #health_bars tmf.cfg matches 1.. run return run function tmf:admin/t/health_bars_off
scoreboard players set #health_bars tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Health Bars",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/combat
