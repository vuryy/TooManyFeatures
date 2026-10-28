data modify storage tmf:tmp sc.e set from storage tmf:tmp sc.work[0]
data remove storage tmf:tmp sc.work[0]
execute store result score #er tmf.tmp run data get storage tmf:tmp sc.e.r
execute if score #er tmf.tmp < #hr tmf.tmp run return run function tmf:sort/swap_hold
data modify storage tmf:tmp sc.rest append from storage tmf:tmp sc.e
execute if data storage tmf:tmp sc.work[0] run function tmf:sort/scan
