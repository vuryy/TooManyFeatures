# needed = ceil(active * base / 100), at least 1;  pct = floor(needed * 100 / total)
scoreboard players operation #need tmf.tmp = #act tmf.tmp
scoreboard players operation #need tmf.tmp *= #sleep_pct tmf.cfg
scoreboard players add #need tmf.tmp 99
scoreboard players operation #need tmf.tmp /= #100 tmf.c
execute if score #need tmf.tmp matches ..0 run scoreboard players set #need tmf.tmp 1
scoreboard players operation #pct tmf.tmp = #need tmf.tmp
scoreboard players operation #pct tmf.tmp *= #100 tmf.c
scoreboard players operation #pct tmf.tmp /= #tot tmf.tmp
