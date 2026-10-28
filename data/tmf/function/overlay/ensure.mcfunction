$tag @e[type=minecraft:interaction,tag=tmf.ov.$(type),distance=..0.01] remove tmf.ov_stale
$execute unless entity @e[type=minecraft:interaction,tag=tmf.ov.$(type),distance=..0.01] run summon minecraft:interaction ~ ~ ~ {width:$(w)f,height:$(h)f,response:1b,Tags:["tmf.ov","tmf.ov.$(type)"]}
return 1
