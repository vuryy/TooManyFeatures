execute store result score #a tmf.tmp run clear @s minecraft:arrow 0
execute store result score #s tmf.tmp run clear @s minecraft:spectral_arrow 0
execute store result score #t tmf.tmp run clear @s minecraft:tipped_arrow 0
data modify storage tmf:tmp ar set value {l:[]}
execute if score #a tmf.tmp matches 1.. run data modify storage tmf:tmp ar.l append value {text:"",extra:[{score:{name:"#a",objective:"tmf.tmp"},color:"white"},{text:" arrows",color:"gray"}]}
execute if score #s tmf.tmp matches 1.. run data modify storage tmf:tmp ar.l append value {text:"",extra:[{score:{name:"#s",objective:"tmf.tmp"},color:"yellow"},{text:" spectral",color:"gray"}]}
execute if score #t tmf.tmp matches 1.. run data modify storage tmf:tmp ar.l append value {text:"",extra:[{score:{name:"#t",objective:"tmf.tmp"},color:"aqua"},{text:" tipped",color:"gray"}]}
execute unless data storage tmf:tmp ar.l[0] run data modify storage tmf:tmp ar.l append value {text:"no arrows!",color:"red"}
execute if items entity @s weapon.* #tmf:launchers[minecraft:enchantments~[{enchantments:"minecraft:infinity"}]] run data modify storage tmf:tmp ar.l append value {text:"∞ Infinity",color:"light_purple"}
title @s actionbar [{text:"🏹 ",color:"gold"},{nbt:"ar.l[]",storage:"tmf:tmp",interpret:true,separator:{text:"  ·  ",color:"dark_gray"}}]
