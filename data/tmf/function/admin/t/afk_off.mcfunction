scoreboard players set #afk tmf.cfg 0
function tmf:afk/clear_all
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"AFK Detection",color:"white"},{text:" disabled",color:"red"}]
function tmf:admin/cat/multiplayer
