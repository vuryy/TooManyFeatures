data modify storage tmf:tmp dn set value {i:0,d:0}
$data modify storage tmf:tmp dn.color set value "$(color)"
$data modify storage tmf:tmp dn.suffix set value "$(suffix)"
scoreboard players operation #di tmf.tmp = #dmg tmf.tmp
scoreboard players operation #di tmf.tmp /= #10 tmf.c
scoreboard players operation #dd tmf.tmp = #dmg tmf.tmp
scoreboard players operation #dd tmf.tmp %= #10 tmf.c
execute store result storage tmf:tmp dn.i int 1 run scoreboard players get #di tmf.tmp
execute store result storage tmf:tmp dn.d int 1 run scoreboard players get #dd tmf.tmp
execute if score #dmg tmf.tmp matches 999 run return run function tmf:combat/spawn_number {txt:"60+",color:"dark_red",suffix:""}
function tmf:combat/number_txt with storage tmf:tmp dn
