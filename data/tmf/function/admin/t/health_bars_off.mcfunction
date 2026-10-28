scoreboard players set #health_bars tmf.cfg 0
execute as @e[tag=tmf.hb] run function tmf:combat/hb_clear
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Health Bars",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/combat
