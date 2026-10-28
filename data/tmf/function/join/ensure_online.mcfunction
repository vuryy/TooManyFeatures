# adds the player to the online list (with name + session start) if missing
execute unless score @s tmf.id matches 1.. run function tmf:join/assign_id
execute store result storage tmf:tmp on.id int 1 run scoreboard players get @s tmf.id
function tmf:join/ensure_online_m with storage tmf:tmp on
