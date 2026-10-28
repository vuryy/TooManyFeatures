# #v -> storage tmf:tmp w2 {id, slot}
execute store result storage tmf:tmp w2.id int 1 run scoreboard players get @s tmf.id
scoreboard players operation #s tmf.tmp = #v tmf.tmp
scoreboard players remove #s tmf.tmp 4000
scoreboard players operation #s tmf.tmp %= #10 tmf.c
execute store result storage tmf:tmp w2.slot int 1 run scoreboard players get #s tmf.tmp
