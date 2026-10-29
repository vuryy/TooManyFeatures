$execute unless entity @a[scores={tmf.id=$(id)},tag=!tmf.off.tpa] run return run function tmf:tpa/gone
$data modify storage tmf:tmp tp.name set from storage tmf:data online[{id:$(id)}].name
function tmf:tpa/pick_dialog with storage tmf:tmp tp
