execute if score #afk tmf.cfg matches 1.. run return run function tmf:admin/t/afk_off
scoreboard players set #afk tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"AFK Detection",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/multiplayer
