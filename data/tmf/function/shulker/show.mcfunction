execute if score @s tmf.cd > #tick tmf.c run return 0
scoreboard players operation @s tmf.cd = #tick tmf.c
scoreboard players add @s tmf.cd 10
data modify storage tmf:tmp sb set value {items:[],agg:[],lines:[]}
data modify storage tmf:tmp sb.items set from entity @s SelectedItem.components."minecraft:container"
execute store result score #slots tmf.tmp run data get storage tmf:tmp sb.items
execute if score #slots tmf.tmp matches 0 run return run tellraw @s [{text:"📦 ",color:"light_purple"},{text:"This shulker box is empty.",color:"gray"}]
function tmf:shulker/collect
function tmf:shulker/build
tellraw @s [{text:"📦 ",color:"light_purple"},{text:"Shulker box",color:"light_purple",bold:true},{text:" – ",color:"dark_gray"},{score:{name:"#slots",objective:"tmf.tmp"},color:"gray"},{text:"/27 slots used",color:"gray"}]
tellraw @s [{text:"  "},{nbt:"sb.lines[]",storage:"tmf:tmp",interpret:true,separator:{text:", ",color:"dark_gray"}}]
playsound minecraft:block.shulker_box.open player @s ~ ~ ~ 0.4 1.6
