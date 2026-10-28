data modify storage tmf:tmp sc.cur set from storage tmf:tmp sc.sorted[0]
data remove storage tmf:tmp sc.sorted[0]
function tmf:sort/merge_one
execute if data storage tmf:tmp sc.sorted[0] run function tmf:sort/merge
