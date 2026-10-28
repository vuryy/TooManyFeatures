execute if score @s tmf.share > #tick tmf.c run return run tellraw @s {text:"Please wait a moment before sharing again.",color:"red"}
scoreboard players operation @s tmf.share = #tick tmf.c
scoreboard players add @s tmf.share 600
function tmf:stats/compute
tellraw @a [{text:"📊 ",color:"gold"},{selector:"@s",color:"gold"},{text:": ",color:"gray"},{score:{name:"#pd",objective:"tmf.tmp"},color:"yellow"},{text:"d ",color:"yellow"},{score:{name:"#ph",objective:"tmf.tmp"},color:"yellow"},{text:"h played",color:"yellow"},{text:" · ",color:"gray"},{score:{name:"@s",objective:"tmf.s.mobs"},color:"white"},{text:" mob kills · ",color:"gray"},{score:{name:"@s",objective:"tmf.s.deaths"},color:"white"},{text:" deaths · ",color:"gray"},{score:{name:"#fi",objective:"tmf.tmp"},color:"white"},{text:".",color:"white"},{score:{name:"#fd",objective:"tmf.tmp"},color:"white"},{text:" km walked",color:"gray"}]
