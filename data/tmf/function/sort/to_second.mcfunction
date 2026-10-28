scoreboard players operation #s2 tmf.tmp = #slot tmf.tmp
scoreboard players remove #s2 tmf.tmp 27
execute store result storage tmf:tmp sc.cur.Slot byte 1 run scoreboard players get #s2 tmf.tmp
data modify storage tmf:tmp sc.second append from storage tmf:tmp sc.cur
