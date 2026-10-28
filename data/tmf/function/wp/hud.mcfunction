scoreboard players operation #tx tmf.tmp = @s tmf.wx
scoreboard players operation #ty tmf.tmp = @s tmf.wy
scoreboard players operation #tz tmf.tmp = @s tmf.wz
scoreboard players operation #wl tmf.tmp = @s tmf.wn
function tmf:wp/label
function tmf:util/dim_code
execute unless score @s tmf.wd = #cd tmf.tmp run return run function tmf:wp/hud_other
# nav/compute resets tmf:tmp nv, so keep the name elsewhere meanwhile
data modify storage tmf:tmp wpn set from storage tmf:tmp nv.n
function tmf:nav/compute
data modify storage tmf:tmp nv.n set from storage tmf:tmp wpn
function tmf:wp/hud_m with storage tmf:tmp nv
