execute unless score #spawn_tp tmf.cfg matches 1 run return run function tmf:menu/open
execute if score @s tmf.tpc matches 1.. run return run function tmf:tpa/cooldown
scoreboard players operation @s tmf.tpc = #tp_cd tmf.cfg
execute if data storage tmf:data spawn.dim run return run function tmf:spawn_tp/custom with storage tmf:data spawn
# the world spawn is only known to functions the server runs itself, so teleport from a scheduled function
tag @s add tmf.tpspawn
schedule function tmf:spawn_tp/world 1t replace
