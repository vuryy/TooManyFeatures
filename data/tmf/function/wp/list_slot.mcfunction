$data modify storage tmf:tmp ws set from storage tmf:tmp w.e.s$(slot)
$data modify storage tmf:tmp ws.slot set value $(slot)
data modify storage tmf:tmp ws.act set value ""
$execute if score @s tmf.ws matches $(slot) run data modify storage tmf:tmp ws.act set value "  (guiding)"
execute store result score #wl tmf.tmp run data get storage tmf:tmp ws.l
function tmf:wp/label
data modify storage tmf:tmp ws.n set from storage tmf:tmp nv.n
execute if data storage tmf:tmp ws{d:0} run data modify storage tmf:tmp ws.dn set value "Overworld"
execute if data storage tmf:tmp ws{d:1} run data modify storage tmf:tmp ws.dn set value "The Nether"
execute if data storage tmf:tmp ws{d:2} run data modify storage tmf:tmp ws.dn set value "The End"
execute if data storage tmf:tmp ws{d:3} run data modify storage tmf:tmp ws.dn set value "another dimension"
function tmf:wp/list_slot_m with storage tmf:tmp ws
