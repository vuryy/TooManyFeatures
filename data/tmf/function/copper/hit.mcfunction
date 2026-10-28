execute unless block ~ ~ ~ #tmf:copper/any run return fail
data modify storage tmf:tmp cu set value {s:"Unaffected",c:"gold",w:"not waxed",wc:"gray"}
execute if block ~ ~ ~ #tmf:copper/exposed run data modify storage tmf:tmp cu merge value {s:"Exposed",c:"#c58f6a"}
execute if block ~ ~ ~ #tmf:copper/weathered run data modify storage tmf:tmp cu merge value {s:"Weathered",c:"#6a9f84"}
execute if block ~ ~ ~ #tmf:copper/oxidized run data modify storage tmf:tmp cu merge value {s:"Oxidized",c:"#4fbf9f"}
execute if block ~ ~ ~ #tmf:copper/waxed run data modify storage tmf:tmp cu merge value {w:"waxed",wc:"yellow"}
scoreboard players set @s tmf.abt 10
function tmf:copper/show with storage tmf:tmp cu
