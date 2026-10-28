data modify storage tmf:tmp ce set value {}
$data modify storage tmf:tmp ce.id set from block ~ ~ ~ Items[{Slot:$(i)b}].id
$execute store result score #a tmf.tmp run data get block ~ ~ ~ CookingTimes[$(i)]
$execute store result score #sec tmf.tmp run data get block ~ ~ ~ CookingTotalTimes[$(i)]
scoreboard players operation #sec tmf.tmp -= #a tmf.tmp
scoreboard players add #sec tmf.tmp 19
scoreboard players operation #sec tmf.tmp /= #20 tmf.c
execute if score #sec tmf.tmp matches ..-1 run scoreboard players set #sec tmf.tmp 0
execute store result storage tmf:tmp ce.s int 1 run scoreboard players get #sec tmf.tmp
data modify storage tmf:tmp cf.e append from storage tmf:tmp ce
