$data remove storage tmf:data names[{id:$(id)}]
$data modify storage tmf:tmp nm set value {id:$(id),name:"$(name)"}
data modify storage tmf:tmp nm.uuid set from entity @s UUID
data modify storage tmf:data names append from storage tmf:tmp nm
