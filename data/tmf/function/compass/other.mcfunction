execute if score #dc tmf.tmp matches 0 run data modify storage tmf:tmp cp.dn set value "Overworld"
execute if score #dc tmf.tmp matches 1 run data modify storage tmf:tmp cp.dn set value "The Nether"
execute if score #dc tmf.tmp matches 2 run data modify storage tmf:tmp cp.dn set value "The End"
execute if score #dc tmf.tmp matches 3 run data modify storage tmf:tmp cp.dn set value "another dimension"
function tmf:compass/other_m with storage tmf:tmp cp
