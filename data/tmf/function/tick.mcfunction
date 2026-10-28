execute unless score #installed tmf.cfg matches 1 run return 0
scoreboard players add #tick tmf.c 1

# --- menus / triggers ---
execute as @a[scores={tmf=1..}] run function tmf:menu/trigger
execute as @a[scores={tmf.stats=1..}] run function tmf:stats/trigger
scoreboard players enable @a tmf
scoreboard players enable @a tmf.stats

# --- joins ---
execute as @a[tag=!tmf.known] at @s run function tmf:join/first_join
execute as @a[scores={tmf.leave=1..}] at @s run function tmf:join/rejoin

# --- death-drop glow ---
execute as @a[scores={tmf.deaths=1..}] run function tmf:death_glow/on_death

# --- shulker preview (on the tick the player starts sneaking) ---
execute if score #shulker_preview tmf.cfg matches 1 as @a[tag=!tmf.sneaking,tag=!tmf.off.shulker_preview,predicate=tmf:sneaking] if items entity @s weapon.mainhand #minecraft:shulker_boxes run function tmf:shulker/show
tag @a[tag=tmf.sneaking,predicate=!tmf:sneaking] remove tmf.sneaking
tag @a[tag=!tmf.sneaking,predicate=tmf:sneaking] add tmf.sneaking

# --- faster paths ---
execute if score #fast_paths tmf.cfg matches 1 as @a[tag=!tmf.onpath,tag=tmf.on.fast_paths,gamemode=!spectator] at @s if function tmf:paths/on_path run function tmf:paths/add
execute as @a[tag=tmf.onpath] at @s unless function tmf:paths/keep run function tmf:paths/remove

# --- click overlays (ladder dropping, right-click harvest, tool auto-swap) ---
function tmf:overlay/tick

# --- held-item flags used by event handlers ---
tag @a[tag=tmf.sh] remove tmf.sh
execute as @a if items entity @s weapon.mainhand minecraft:shears run tag @s add tmf.sh

# --- no crop trampling ---
execute if score #no_trample tmf.cfg matches 1 as @a[gamemode=!spectator,tag=!tmf.ntsf,predicate=tmf:falling_unprotected] at @s if function tmf:trample/above_farmland run function tmf:trample/protect
execute as @a[tag=tmf.ntsf,predicate=tmf:on_ground] run function tmf:trample/landed

# --- logs chopped (fast leaf decay + tree feller) / ores mined (veinminer) ---
execute if score #leaf_decay tmf.cfg matches 1 run function tmf:leaves/check_chops
execute unless score #leaf_decay tmf.cfg matches 1 if score #tree_feller tmf.cfg matches 1 run function tmf:leaves/check_chops
execute if score #veinminer tmf.cfg matches 1 run function tmf:vein/check

# --- fence jumping ---
execute if score #fence_jump tmf.cfg matches 1 as @a[tag=!tmf.fj,tag=tmf.on.fence_jump,gamemode=!spectator,predicate=tmf:on_ground] at @s if function tmf:fence/facing run function tmf:fence/add
execute as @a[tag=tmf.fj] at @s unless function tmf:fence/keep run function tmf:fence/remove


# --- pickup notices / magnet ---
execute if score #pickup_notices tmf.cfg matches 1 as @a[tag=tmf.invdirty,tag=!tmf.off.pickup_notices] run function tmf:pickup/process
tag @a[tag=tmf.invdirty] remove tmf.invdirty
execute as @a[scores={tmf.drop=1..}] at @s run function tmf:magnet/dropped
execute if score #magnet tmf.cfg matches 1 as @a[tag=tmf.on.magnet,gamemode=!spectator,predicate=!tmf:sneaking] at @s run function tmf:magnet/pull

# --- creeper / ghast no-grief: explosions are detected when the carried marker loses its ride ---
execute if score #ghast_nogrief tmf.cfg matches 1 as @e[type=minecraft:fireball,tag=!tmf.gng] at @s run function tmf:ghast/setup
execute as @e[type=minecraft:item_display,tag=tmf.bl] unless function tmf:blast/riding at @s run function tmf:blast/gone

# --- damage number animation ---
execute as @e[type=minecraft:text_display,tag=tmf.dn_new] run function tmf:combat/animate_number

# --- actionbar cooldown ---
scoreboard players remove @a[scores={tmf.abt=1..}] tmf.abt 1
