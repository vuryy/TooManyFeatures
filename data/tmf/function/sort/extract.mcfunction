data modify storage tmf:tmp sc.hold set from storage tmf:tmp sc.work[0]
data remove storage tmf:tmp sc.work[0]
data modify storage tmf:tmp sc.rest set value []
execute store result score #hr tmf.tmp run data get storage tmf:tmp sc.hold.r
execute if data storage tmf:tmp sc.work[0] run function tmf:sort/scan
data modify storage tmf:tmp sc.sorted append from storage tmf:tmp sc.hold
data modify storage tmf:tmp sc.work set from storage tmf:tmp sc.rest
execute if data storage tmf:tmp sc.work[0] run function tmf:sort/extract
