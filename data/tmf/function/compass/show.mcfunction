execute store result score #tx tmf.tmp run data get storage tmf:tmp cp.t.pos[0]
execute store result score #ty tmf.tmp run data get storage tmf:tmp cp.t.pos[1]
execute store result score #tz tmf.tmp run data get storage tmf:tmp cp.t.pos[2]
execute store result storage tmf:tmp cp.x int 1 run scoreboard players get #tx tmf.tmp
execute store result storage tmf:tmp cp.y int 1 run scoreboard players get #ty tmf.tmp
execute store result storage tmf:tmp cp.z int 1 run scoreboard players get #tz tmf.tmp
data modify storage tmf:tmp dm.s set from storage tmf:tmp cp.t.dimension
function tmf:util/dim_from_string
function tmf:util/dim_code
execute unless score #dc tmf.tmp = #cd tmf.tmp run return run function tmf:compass/other
function tmf:nav/compute
data modify storage tmf:tmp cp.d set from storage tmf:tmp nv.d
function tmf:compass/show_m with storage tmf:tmp cp
