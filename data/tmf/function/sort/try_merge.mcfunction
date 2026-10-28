data modify storage tmf:tmp sc.a set from storage tmf:tmp sc.merged[-1]
data modify storage tmf:tmp sc.b set from storage tmf:tmp sc.cur
data remove storage tmf:tmp sc.a.count
data remove storage tmf:tmp sc.b.count
execute store success score #diff tmf.tmp run data modify storage tmf:tmp sc.a set from storage tmf:tmp sc.b
execute if score #diff tmf.tmp matches 1 run return run data modify storage tmf:tmp sc.merged append from storage tmf:tmp sc.cur
execute store result score #pc tmf.tmp run data get storage tmf:tmp sc.merged[-1].count
execute store result score #cc tmf.tmp run data get storage tmf:tmp sc.cur.count
execute store result score #mx tmf.tmp run data get storage tmf:tmp sc.cur.m
scoreboard players operation #space tmf.tmp = #mx tmf.tmp
scoreboard players operation #space tmf.tmp -= #pc tmf.tmp
execute if score #space tmf.tmp matches ..0 run return run data modify storage tmf:tmp sc.merged append from storage tmf:tmp sc.cur
scoreboard players operation #mv tmf.tmp = #space tmf.tmp
scoreboard players operation #mv tmf.tmp < #cc tmf.tmp
scoreboard players operation #pc tmf.tmp += #mv tmf.tmp
scoreboard players operation #cc tmf.tmp -= #mv tmf.tmp
execute store result storage tmf:tmp sc.merged[-1].count int 1 run scoreboard players get #pc tmf.tmp
execute if score #cc tmf.tmp matches ..0 run return 0
execute store result storage tmf:tmp sc.cur.count int 1 run scoreboard players get #cc tmf.tmp
data modify storage tmf:tmp sc.merged append from storage tmf:tmp sc.cur
