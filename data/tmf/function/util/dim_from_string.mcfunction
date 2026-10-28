# in: storage tmf:tmp dm.s (dimension id)  out: #dc tmf.tmp
scoreboard players set #dc tmf.tmp 3
execute if data storage tmf:tmp dm{s:"minecraft:overworld"} run scoreboard players set #dc tmf.tmp 0
execute if data storage tmf:tmp dm{s:"minecraft:the_nether"} run scoreboard players set #dc tmf.tmp 1
execute if data storage tmf:tmp dm{s:"minecraft:the_end"} run scoreboard players set #dc tmf.tmp 2
