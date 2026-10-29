execute if score #tpa tmf.cfg matches 1.. run return run function tmf:admin/t/tpa_off
scoreboard players set #tpa tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Teleport Requests",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/multiplayer
