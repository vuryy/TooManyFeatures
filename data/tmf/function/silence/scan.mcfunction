execute as @e[type=!minecraft:player,tag=!tmf.silenced,name=Silence] run function tmf:silence/on
execute as @e[type=!minecraft:player,tag=!tmf.silenced,name=silence] run function tmf:silence/on
execute as @e[type=!minecraft:player,tag=!tmf.silenced,name=Quiet] run function tmf:silence/on
execute as @e[type=!minecraft:player,tag=!tmf.silenced,name=quiet] run function tmf:silence/on
execute as @e[type=!minecraft:player,tag=!tmf.silenced,name=Shh] run function tmf:silence/on
execute as @e[type=!minecraft:player,tag=!tmf.silenced,name=shh] run function tmf:silence/on
execute as @e[type=!minecraft:player,tag=!tmf.silenced,name=Silent] run function tmf:silence/on
execute as @e[type=!minecraft:player,tag=!tmf.silenced,name=silent] run function tmf:silence/on
execute as @e[tag=tmf.silenced] unless function tmf:silence/has_name run function tmf:silence/off
