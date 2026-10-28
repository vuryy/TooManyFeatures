advancement revoke @s only tmf:bt/mining_hoe
execute if score @s tmf.fight > #tick tmf.c run return 0
scoreboard players operation @s tmf.mine = #tick tmf.c
scoreboard players add @s tmf.mine 100
