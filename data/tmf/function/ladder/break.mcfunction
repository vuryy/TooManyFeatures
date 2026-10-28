execute unless entity @s[gamemode=creative] run setblock ~ ~ ~ minecraft:air destroy
execute if entity @s[gamemode=creative] run setblock ~ ~ ~ minecraft:air
playsound minecraft:block.ladder.break block @a ~ ~ ~ 1 1
