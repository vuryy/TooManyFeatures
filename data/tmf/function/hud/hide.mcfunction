execute store result storage tmf:tmp hb.id int 1 run scoreboard players get @s tmf.id
function tmf:hud/hide_m with storage tmf:tmp hb
tag @s remove tmf.hudbar
