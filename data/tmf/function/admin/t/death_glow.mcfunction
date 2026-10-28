execute if score #death_glow tmf.cfg matches 1.. run return run function tmf:admin/t/death_glow_off
scoreboard players set #death_glow tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Death-Drop Glow",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/combat
