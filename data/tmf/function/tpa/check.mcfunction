# is there a live request from player $(id) to me (#me)?
scoreboard players set #ok tmf.tmp 0
$execute as @a[scores={tmf.id=$(id),tmf.tpx=1..}] if score @s tmf.tpt = #me tmf.tmp run scoreboard players set #ok tmf.tmp 1
