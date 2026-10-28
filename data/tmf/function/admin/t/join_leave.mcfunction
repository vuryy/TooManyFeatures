execute if score #join_leave tmf.cfg matches 1.. run return run function tmf:admin/t/join_leave_off
scoreboard players set #join_leave tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Join & Leave Messages",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/multiplayer
