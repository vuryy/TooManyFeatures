data modify storage tmf:tmp lv.cur set from storage tmf:tmp lv.todo[0]
data remove storage tmf:tmp lv.todo[0]
function tmf:join/check_one_m with storage tmf:tmp lv.cur
execute if data storage tmf:tmp lv.todo[0] run function tmf:join/check_one
