$execute unless entity @a[scores={tmf.id=$(id)},tag=!tmf.off.tpa] run return run function tmf:tpa/gone
execute if score @s tmf.tpc matches 1.. run return run function tmf:tpa/cooldown
$data modify storage tmf:tmp tp.name set from storage tmf:data online[{id:$(id)}].name
$scoreboard players set @s tmf.tpt $(id)
$scoreboard players set @s tmf.tpm $(mode)
scoreboard players set @s tmf.tpx 60
function tmf:tpa/notify with storage tmf:tmp tp
