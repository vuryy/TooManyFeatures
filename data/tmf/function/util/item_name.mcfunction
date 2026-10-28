# in: storage tmf:tmp it.id ("minecraft:iron_ore")  out: it.n ("iron_ore"), it.p ("item" / "block")
data modify storage tmf:tmp it.n set string storage tmf:tmp it.id 10
data modify storage tmf:tmp it.p set value "item"
function tmf:util/item_kind with storage tmf:tmp it
