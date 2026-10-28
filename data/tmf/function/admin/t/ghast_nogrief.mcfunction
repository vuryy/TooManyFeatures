execute if score #ghast_nogrief tmf.cfg matches 1.. run return run function tmf:admin/t/ghast_nogrief_off
scoreboard players set #ghast_nogrief tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Ghast No-Grief",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/griefing
