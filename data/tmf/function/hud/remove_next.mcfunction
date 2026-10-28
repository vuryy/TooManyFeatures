scoreboard players add #i tmf.tmp 1
execute if score #i tmf.tmp > #next tmf.id run return 0
execute store result storage tmf:tmp hb.id int 1 run scoreboard players get #i tmf.tmp
function tmf:hud/hide_m with storage tmf:tmp hb
function tmf:hud/remove_next
