data modify storage tmf:tmp sc.in set from block ~ ~ ~ Items
$data modify storage tmf:tmp sc.in append from block ~$(sx) ~ ~$(sz) Items[]
function tmf:sort/run
data modify block ~ ~ ~ Items set from storage tmf:tmp sc.first
$data modify block ~$(sx) ~ ~$(sz) Items set from storage tmf:tmp sc.second
function tmf:sort/done
