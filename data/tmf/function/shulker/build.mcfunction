data modify storage tmf:tmp sb.e set from storage tmf:tmp sb.agg[0]
data remove storage tmf:tmp sb.agg[0]
data modify storage tmf:tmp sb.e.p set string storage tmf:tmp sb.e.id 10
function tmf:shulker/line with storage tmf:tmp sb.e
execute if data storage tmf:tmp sb.agg[0] run function tmf:shulker/build
