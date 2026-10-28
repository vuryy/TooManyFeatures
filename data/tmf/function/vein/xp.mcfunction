$scoreboard players set #xpv tmf.tmp $(xp)
execute if score #xpv tmf.tmp matches ..0 run return 0
$summon minecraft:experience_orb ~0.5 ~0.5 ~0.5 {Value:$(xp)s}
