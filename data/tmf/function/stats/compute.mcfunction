# playtime
scoreboard players operation #pd tmf.tmp = @s tmf.s.play
scoreboard players operation #pd tmf.tmp /= #1728000 tmf.c
scoreboard players operation #ph tmf.tmp = @s tmf.s.play
scoreboard players operation #ph tmf.tmp /= #72000 tmf.c
scoreboard players operation #ph tmf.tmp %= #24 tmf.c
scoreboard players operation #pm tmf.tmp = @s tmf.s.play
scoreboard players operation #pm tmf.tmp /= #1200 tmf.c
scoreboard players operation #pm tmf.tmp %= #60 tmf.c
# time since last death
scoreboard players operation #dh tmf.tmp = @s tmf.s.since
scoreboard players operation #dh tmf.tmp /= #72000 tmf.c
scoreboard players operation #dm tmf.tmp = @s tmf.s.since
scoreboard players operation #dm tmf.tmp /= #1200 tmf.c
scoreboard players operation #dm tmf.tmp %= #60 tmf.c
# on foot (cm -> km x10)
scoreboard players set #foot tmf.tmp 0
scoreboard players operation #foot tmf.tmp += @s tmf.s.walk
scoreboard players operation #foot tmf.tmp += @s tmf.s.sprint
scoreboard players operation #foot tmf.tmp += @s tmf.s.crouch
scoreboard players operation #foot tmf.tmp += @s tmf.s.swim
scoreboard players operation #foot tmf.tmp += @s tmf.s.wow
scoreboard players operation #foot tmf.tmp += @s tmf.s.wuw
scoreboard players operation #foot tmf.tmp += @s tmf.s.climb
scoreboard players operation #foot tmf.tmp /= #10000 tmf.c
scoreboard players operation #fi tmf.tmp = #foot tmf.tmp
scoreboard players operation #fi tmf.tmp /= #10 tmf.c
scoreboard players operation #fd tmf.tmp = #foot tmf.tmp
scoreboard players operation #fd tmf.tmp %= #10 tmf.c
# riding / flying
scoreboard players set #ride tmf.tmp 0
scoreboard players operation #ride tmf.tmp += @s tmf.s.fly
scoreboard players operation #ride tmf.tmp += @s tmf.s.boat
scoreboard players operation #ride tmf.tmp += @s tmf.s.horse
scoreboard players operation #ride tmf.tmp += @s tmf.s.cart
scoreboard players operation #ride tmf.tmp += @s tmf.s.pig
scoreboard players operation #ride tmf.tmp += @s tmf.s.strider
scoreboard players operation #ride tmf.tmp += @s tmf.s.ghast
scoreboard players operation #ride tmf.tmp += @s tmf.s.naut
scoreboard players operation #ride tmf.tmp /= #10000 tmf.c
scoreboard players operation #ri tmf.tmp = #ride tmf.tmp
scoreboard players operation #ri tmf.tmp /= #10 tmf.c
scoreboard players operation #rd tmf.tmp = #ride tmf.tmp
scoreboard players operation #rd tmf.tmp %= #10 tmf.c
# damage (stat is in tenths of a health point; 20 = one heart)
scoreboard players operation #dmgd tmf.tmp = @s tmf.s.dmgd
scoreboard players set #20 tmf.tmp 20
scoreboard players operation #dmgd tmf.tmp /= #20 tmf.tmp
scoreboard players operation #dmgt tmf.tmp = @s tmf.s.dmgt
scoreboard players operation #dmgt tmf.tmp /= #20 tmf.tmp
# make sure unset stats show as 0
scoreboard players add @s tmf.s.deaths 0
scoreboard players add @s tmf.s.mobs 0
scoreboard players add @s tmf.s.pk 0
scoreboard players add @s tmf.s.jump 0
scoreboard players add @s tmf.s.fish 0
scoreboard players add @s tmf.s.bred 0
scoreboard players add @s tmf.s.trade 0
scoreboard players add @s tmf.s.ench 0
scoreboard players add @s tmf.s.sleep 0
