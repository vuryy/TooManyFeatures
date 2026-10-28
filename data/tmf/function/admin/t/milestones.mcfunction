execute if score #milestones tmf.cfg matches 1.. run return run function tmf:admin/t/milestones_off
scoreboard players set #milestones tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Playtime Milestones",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/multiplayer
