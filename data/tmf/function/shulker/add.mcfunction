$execute unless data storage tmf:tmp sb.agg[{id:"$(id)"}] run return run data modify storage tmf:tmp sb.agg append value {id:"$(id)",count:$(count)}
$execute store result score #c tmf.tmp run data get storage tmf:tmp sb.agg[{id:"$(id)"}].count
$scoreboard players add #c tmf.tmp $(count)
$execute store result storage tmf:tmp sb.agg[{id:"$(id)"}].count int 1 run scoreboard players get #c tmf.tmp
