execute if score #spawn_checker tmf.cfg matches 1.. run return run function tmf:admin/t/spawn_checker_off
scoreboard players set #spawn_checker tmf.cfg 1
function tmf:config/apply
tellraw @a[tag=tmf.admin] [{text:"[TMF] ",color:"gold"},{text:"Spawn-Proof Checker",color:"white"},{text:" enabled",color:"green"}]
function tmf:admin/cat/farming
