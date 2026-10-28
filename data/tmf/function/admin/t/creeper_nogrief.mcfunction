execute if score #creeper_nogrief tmf.cfg matches 1.. run return run function tmf:admin/t/creeper_nogrief_off
scoreboard players set #creeper_nogrief tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Creeper No-Grief",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/griefing
