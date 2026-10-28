execute as @a[tag=tmf.afk] run tag @s remove tmf.afk
execute as @a[team=tmf.afk] run team leave @s
scoreboard players set @a tmf.afk 0
