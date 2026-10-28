execute if score #silence_mobs tmf.cfg matches 1.. run return run function tmf:admin/t/silence_mobs_off
scoreboard players set #silence_mobs tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Silence Mobs",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/mobs
