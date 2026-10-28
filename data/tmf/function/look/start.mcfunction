# as a sneaking player
scoreboard players set #fp tmf.tmp 0
scoreboard players set #fo tmf.tmp 0
execute if score #pet_health tmf.cfg matches 1 if entity @s[tag=!tmf.off.pet_health] run scoreboard players set #fp tmf.tmp 1
execute if score #animal_owners tmf.cfg matches 1 if entity @s[tag=!tmf.off.animal_owners] run scoreboard players set #fo tmf.tmp 1
execute if score #fp tmf.tmp matches 1 if function tmf:pets/look run return 1
execute if score #fp tmf.tmp matches 0 if score #fo tmf.tmp matches 1 if function tmf:pets/look run return 1
scoreboard players set #lk tmf.tmp 0
scoreboard players set #fcu tmf.tmp 0
scoreboard players set #fcr tmf.tmp 0
scoreboard players set #fcf tmf.tmp 0
scoreboard players set #ffu tmf.tmp 0
execute if score #copper_info tmf.cfg matches 1 if entity @s[tag=!tmf.off.copper_info] run scoreboard players set #fcu tmf.tmp 1
execute if score #crop_info tmf.cfg matches 1 if entity @s[tag=!tmf.off.crop_info] run scoreboard players set #fcr tmf.tmp 1
execute if score #campfire_info tmf.cfg matches 1 if entity @s[tag=!tmf.off.campfire_info] run scoreboard players set #fcf tmf.tmp 1
execute if score #furnace_info tmf.cfg matches 1 if entity @s[tag=!tmf.off.furnace_info] run scoreboard players set #ffu tmf.tmp 1
scoreboard players operation #lk tmf.tmp += #fcu tmf.tmp
scoreboard players operation #lk tmf.tmp += #fcr tmf.tmp
scoreboard players operation #lk tmf.tmp += #fcf tmf.tmp
scoreboard players operation #lk tmf.tmp += #ffu tmf.tmp
execute if score #lk tmf.tmp matches 0 run return 0
scoreboard players set #r tmf.tmp 0
execute anchored eyes positioned ^ ^ ^ run function tmf:look/ray
