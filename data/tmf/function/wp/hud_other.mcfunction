execute if score @s tmf.wd matches 0 run data modify storage tmf:tmp nv.dn set value "Overworld"
execute if score @s tmf.wd matches 1 run data modify storage tmf:tmp nv.dn set value "The Nether"
execute if score @s tmf.wd matches 2 run data modify storage tmf:tmp nv.dn set value "The End"
execute if score @s tmf.wd matches 3 run data modify storage tmf:tmp nv.dn set value "another dimension"
function tmf:wp/hud_other_m with storage tmf:tmp nv
