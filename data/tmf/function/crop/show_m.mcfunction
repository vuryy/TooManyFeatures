$data modify storage tmf:tmp cr merge value {k:"$(k)",s:$(s),m:$(m),p:$(p)}
scoreboard players set @s tmf.abt 10
$execute if data storage tmf:tmp cr{s:$(m)} run return run function tmf:crop/full with storage tmf:tmp cr
function tmf:crop/growing with storage tmf:tmp cr
