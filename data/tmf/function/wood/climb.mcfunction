scoreboard players add #up tmf.tmp 1
$execute if score #up tmf.tmp matches ..48 if block ~ ~1 ~ #$(tag) positioned ~ ~1 ~ run return run function tmf:wood/climb {tag:"$(tag)"}
return run function tmf:wood/leaves_near
