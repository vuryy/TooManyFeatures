$execute if block ~ ~ ~ minecraft:water[level=0] run setblock ~ ~ ~ minecraft:ladder[facing=$(f),waterlogged=true]
$execute unless block ~ ~ ~ minecraft:ladder run setblock ~ ~ ~ minecraft:ladder[facing=$(f)]
playsound minecraft:block.ladder.place block @a ~ ~ ~ 1 1
execute unless entity @s[gamemode=creative] run clear @s minecraft:ladder 1
swing @s mainhand
