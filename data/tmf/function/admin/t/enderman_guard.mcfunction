execute if score #enderman_guard tmf.cfg matches 1.. run return run function tmf:admin/t/enderman_guard_off
scoreboard players set #enderman_guard tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Enderman Anti-Grief",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/mobs
