tag @s add tmf.mag_me
execute as @e[type=minecraft:item,distance=1.2..7,tag=!tmf.nomag] at @s facing entity @a[tag=tmf.mag_me,limit=1] feet run tp @s ^ ^ ^0.35
execute as @e[type=minecraft:experience_orb,distance=1.2..7] at @s facing entity @a[tag=tmf.mag_me,limit=1] feet run tp @s ^ ^ ^0.35
tag @s remove tmf.mag_me
