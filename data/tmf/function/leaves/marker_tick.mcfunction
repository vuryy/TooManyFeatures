scoreboard players add @s tmf.ldt 5
execute if score @s tmf.ldt matches 15 align xyz run function tmf:leaves/process
execute if score @s tmf.ldt matches 40 align xyz run function tmf:leaves/process
execute if score @s tmf.ldt matches 40.. run kill @s
