scoreboard players set #st tmf.tmp 0
$execute store result score #st tmf.tmp run data get storage tmf:data online[{id:$(oid)}].start
scoreboard players operation #len tmf.tmp = #tick tmf.c
scoreboard players operation #len tmf.tmp -= #st tmf.tmp
scoreboard players operation #len tmf.tmp /= #1200 tmf.c
execute store result storage tmf:tmp ip.ses int 1 run scoreboard players get #len tmf.tmp
