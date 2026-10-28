data modify storage tmf:tmp sc.rest append from storage tmf:tmp sc.hold
data modify storage tmf:tmp sc.hold set from storage tmf:tmp sc.e
scoreboard players operation #hr tmf.tmp = #er tmf.tmp
execute if data storage tmf:tmp sc.work[0] run function tmf:sort/scan
