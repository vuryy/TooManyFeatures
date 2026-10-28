scoreboard players set #on tmf.tmp 1
execute store result storage tmf:tmp ip.hp int 1 run data get entity @s Health
execute store result storage tmf:tmp ip.fo int 1 run data get entity @s foodLevel
execute store result storage tmf:tmp ip.lv int 1 run data get entity @s XpLevel
execute store result storage tmf:tmp ip.x int 1 run data get entity @s Pos[0]
execute store result storage tmf:tmp ip.y int 1 run data get entity @s Pos[1]
execute store result storage tmf:tmp ip.z int 1 run data get entity @s Pos[2]
function tmf:util/dim_code
execute if score #cd tmf.tmp matches 0 run data modify storage tmf:tmp ip.dn set value "Overworld"
execute if score #cd tmf.tmp matches 1 run data modify storage tmf:tmp ip.dn set value "The Nether"
execute if score #cd tmf.tmp matches 2 run data modify storage tmf:tmp ip.dn set value "The End"
execute if score #cd tmf.tmp matches 3 run data modify storage tmf:tmp ip.dn set value "another dimension"
data modify storage tmf:tmp ip.gm set value "Survival"
execute if entity @s[gamemode=creative] run data modify storage tmf:tmp ip.gm set value "Creative"
execute if entity @s[gamemode=adventure] run data modify storage tmf:tmp ip.gm set value "Adventure"
execute if entity @s[gamemode=spectator] run data modify storage tmf:tmp ip.gm set value "Spectator"
data modify storage tmf:tmp ip.afk set value ""
execute if entity @s[tag=tmf.afk] run data modify storage tmf:tmp ip.afk set value "  (AFK)"
execute store result storage tmf:tmp ip.oid int 1 run scoreboard players get @s tmf.id
function tmf:insp/session with storage tmf:tmp ip
function tmf:insp/online_text with storage tmf:tmp ip
