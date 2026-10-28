$execute unless data storage tmf:tmp pk.new."$(id)" run data modify storage tmf:tmp pk.list append value {id:"$(id)"}
$execute store result score #c tmf.tmp run data get storage tmf:tmp pk.new."$(id)"
$scoreboard players add #c tmf.tmp $(count)
$execute store result storage tmf:tmp pk.new."$(id)" int 1 run scoreboard players get #c tmf.tmp
