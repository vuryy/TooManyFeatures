data modify storage tmf:tmp lv set value {todo:[],keep:[]}
data modify storage tmf:tmp lv.todo set from storage tmf:data online
execute if data storage tmf:tmp lv.todo[0] run function tmf:join/check_one
data modify storage tmf:data online set from storage tmf:tmp lv.keep
