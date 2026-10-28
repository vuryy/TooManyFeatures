scoreboard players set #damage_numbers tmf.cfg 0
kill @e[type=minecraft:text_display,tag=tmf.dn]
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Damage Numbers",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/combat
