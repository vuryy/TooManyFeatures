execute if score #waypoints tmf.cfg matches 1.. run return run function tmf:admin/t/waypoints_off
scoreboard players set #waypoints tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Waypoints",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/info
