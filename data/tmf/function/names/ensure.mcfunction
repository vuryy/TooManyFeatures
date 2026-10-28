execute unless score @s tmf.id matches 1.. run return 0
execute store result storage tmf:tmp ne.id int 1 run scoreboard players get @s tmf.id
function tmf:names/ensure_m with storage tmf:tmp ne
