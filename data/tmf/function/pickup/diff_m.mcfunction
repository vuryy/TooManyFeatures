$execute store result score #nc tmf.tmp run data get storage tmf:tmp pk.new."$(id)"
$execute store result score #oc tmf.tmp run data get storage tmf:tmp pk.old."$(id)"
scoreboard players operation #nc tmf.tmp -= #oc tmf.tmp
execute if score #nc tmf.tmp matches ..0 run return 0
scoreboard players add #shown tmf.tmp 1
execute if score #shown tmf.tmp matches 5.. run return 0
execute store result storage tmf:tmp pk.e.n int 1 run scoreboard players get #nc tmf.tmp
data modify storage tmf:tmp pk.e.p set string storage tmf:tmp pk.e.id 10
function tmf:pickup/line with storage tmf:tmp pk.e
