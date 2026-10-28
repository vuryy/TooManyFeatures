execute store result storage tmf:tmp ln.n int 1 if entity @e[type=!minecraft:player,distance=..64]
execute store result storage tmf:tmp ln.id int 1 run scoreboard players get @s tmf.id
function tmf:lag/near_m with storage tmf:tmp ln
