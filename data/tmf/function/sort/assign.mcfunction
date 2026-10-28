data modify storage tmf:tmp sc.cur set from storage tmf:tmp sc.merged[0]
data remove storage tmf:tmp sc.merged[0]
data remove storage tmf:tmp sc.cur.r
data remove storage tmf:tmp sc.cur.m
execute if score #slot tmf.tmp matches ..26 run function tmf:sort/to_first
execute if score #slot tmf.tmp matches 27.. run function tmf:sort/to_second
scoreboard players add #slot tmf.tmp 1
execute if data storage tmf:tmp sc.merged[0] run function tmf:sort/assign
