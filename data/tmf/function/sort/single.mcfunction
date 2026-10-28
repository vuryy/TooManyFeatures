data modify storage tmf:tmp sc.in set from block ~ ~ ~ Items
function tmf:sort/run
data modify block ~ ~ ~ Items set from storage tmf:tmp sc.first
function tmf:sort/done
