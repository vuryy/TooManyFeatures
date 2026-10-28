scoreboard players set @s tmf.or.0 0
scoreboard players set @s tmf.or.1 0
scoreboard players set @s tmf.or.2 0
scoreboard players set @s tmf.or.3 0
scoreboard players set @s tmf.or.4 0
scoreboard players set @s tmf.or.5 0
scoreboard players set @s tmf.or.6 0
scoreboard players set @s tmf.or.7 0
scoreboard players set @s tmf.or.8 0
scoreboard players set @s tmf.or.9 0
scoreboard players set @s tmf.or.10 0
scoreboard players set @s tmf.or.11 0
scoreboard players set @s tmf.or.12 0
scoreboard players set @s tmf.or.13 0
scoreboard players set @s tmf.or.14 0
scoreboard players set @s tmf.or.15 0
scoreboard players set @s tmf.or.16 0
scoreboard players set @s tmf.or.17 0
scoreboard players set @s tmf.or.18 0
execute if entity @s[tag=tmf.off.veinminer] run return 0
execute unless entity @s[predicate=tmf:sneaking,gamemode=!creative,gamemode=!spectator] run return 0
execute unless items entity @s weapon.mainhand #minecraft:pickaxes run return 0
$data modify storage tmf:tmp vm set value {tag:"$(tag)",xp:$(xp)}
scoreboard players set #r tmf.tmp 0
execute anchored eyes positioned ^ ^ ^ run function tmf:vein/ray
