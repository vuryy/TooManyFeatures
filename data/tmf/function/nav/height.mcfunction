execute store result storage tmf:tmp nh.v int 1 run scoreboard players get #dy tmf.tmp
$data modify storage tmf:tmp nh.s set value "$(s)"
function tmf:nav/height_m with storage tmf:tmp nh
