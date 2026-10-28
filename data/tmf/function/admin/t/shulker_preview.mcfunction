execute if score #shulker_preview tmf.cfg matches 1.. run return run function tmf:admin/t/shulker_preview_off
scoreboard players set #shulker_preview tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Shulker Preview",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/inventory
