$execute unless data storage tmf:data wp[{id:$(id)}].s$(slot) run return fail
$execute store result score @s tmf.wx run data get storage tmf:data wp[{id:$(id)}].s$(slot).x
$execute store result score @s tmf.wy run data get storage tmf:data wp[{id:$(id)}].s$(slot).y
$execute store result score @s tmf.wz run data get storage tmf:data wp[{id:$(id)}].s$(slot).z
$execute store result score @s tmf.wd run data get storage tmf:data wp[{id:$(id)}].s$(slot).d
$execute store result score @s tmf.wn run data get storage tmf:data wp[{id:$(id)}].s$(slot).l
$scoreboard players set @s tmf.ws $(slot)
