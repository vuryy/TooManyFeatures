$execute if entity @a[scores={tmf.id=$(id)}] run data modify storage tmf:tmp ie merge value {dot:"●",col:"green"}
function tmf:insp/list_add with storage tmf:tmp ie
