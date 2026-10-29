scoreboard players set #tpa tmf.cfg 0
scoreboard players set @a tmf.tpx 0
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Teleport Requests",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/multiplayer
