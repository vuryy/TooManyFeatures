scoreboard players set #b tmf.tmp 0
execute if biome ~ ~ ~ minecraft:badlands run scoreboard players set #b tmf.tmp 1
execute if biome ~ ~ ~ minecraft:bamboo_jungle run scoreboard players set #b tmf.tmp 2
execute if biome ~ ~ ~ minecraft:basalt_deltas run scoreboard players set #b tmf.tmp 3
execute if biome ~ ~ ~ minecraft:beach run scoreboard players set #b tmf.tmp 4
execute if biome ~ ~ ~ minecraft:birch_forest run scoreboard players set #b tmf.tmp 5
execute if biome ~ ~ ~ minecraft:cherry_grove run scoreboard players set #b tmf.tmp 6
execute if biome ~ ~ ~ minecraft:cold_ocean run scoreboard players set #b tmf.tmp 7
execute if biome ~ ~ ~ minecraft:crimson_forest run scoreboard players set #b tmf.tmp 8
execute if biome ~ ~ ~ minecraft:dappled_forest run scoreboard players set #b tmf.tmp 9
execute if biome ~ ~ ~ minecraft:dark_forest run scoreboard players set #b tmf.tmp 10
execute if biome ~ ~ ~ minecraft:deep_cold_ocean run scoreboard players set #b tmf.tmp 11
execute if biome ~ ~ ~ minecraft:deep_dark run scoreboard players set #b tmf.tmp 12
execute if biome ~ ~ ~ minecraft:deep_frozen_ocean run scoreboard players set #b tmf.tmp 13
execute if biome ~ ~ ~ minecraft:deep_lukewarm_ocean run scoreboard players set #b tmf.tmp 14
execute if biome ~ ~ ~ minecraft:deep_ocean run scoreboard players set #b tmf.tmp 15
execute if biome ~ ~ ~ minecraft:desert run scoreboard players set #b tmf.tmp 16
execute if biome ~ ~ ~ minecraft:dripstone_caves run scoreboard players set #b tmf.tmp 17
execute if biome ~ ~ ~ minecraft:end_barrens run scoreboard players set #b tmf.tmp 18
execute if biome ~ ~ ~ minecraft:end_highlands run scoreboard players set #b tmf.tmp 19
execute if biome ~ ~ ~ minecraft:end_midlands run scoreboard players set #b tmf.tmp 20
execute if biome ~ ~ ~ minecraft:eroded_badlands run scoreboard players set #b tmf.tmp 21
execute if biome ~ ~ ~ minecraft:flower_forest run scoreboard players set #b tmf.tmp 22
execute if biome ~ ~ ~ minecraft:forest run scoreboard players set #b tmf.tmp 23
execute if biome ~ ~ ~ minecraft:frozen_ocean run scoreboard players set #b tmf.tmp 24
execute if biome ~ ~ ~ minecraft:frozen_peaks run scoreboard players set #b tmf.tmp 25
execute if biome ~ ~ ~ minecraft:frozen_river run scoreboard players set #b tmf.tmp 26
execute if biome ~ ~ ~ minecraft:grove run scoreboard players set #b tmf.tmp 27
execute if biome ~ ~ ~ minecraft:ice_spikes run scoreboard players set #b tmf.tmp 28
execute if biome ~ ~ ~ minecraft:jagged_peaks run scoreboard players set #b tmf.tmp 29
execute if biome ~ ~ ~ minecraft:jungle run scoreboard players set #b tmf.tmp 30
execute if biome ~ ~ ~ minecraft:lukewarm_ocean run scoreboard players set #b tmf.tmp 31
execute if biome ~ ~ ~ minecraft:lush_caves run scoreboard players set #b tmf.tmp 32
execute if biome ~ ~ ~ minecraft:mangrove_swamp run scoreboard players set #b tmf.tmp 33
execute if biome ~ ~ ~ minecraft:meadow run scoreboard players set #b tmf.tmp 34
execute if biome ~ ~ ~ minecraft:mushroom_fields run scoreboard players set #b tmf.tmp 35
execute if biome ~ ~ ~ minecraft:nether_wastes run scoreboard players set #b tmf.tmp 36
execute if biome ~ ~ ~ minecraft:ocean run scoreboard players set #b tmf.tmp 37
execute if biome ~ ~ ~ minecraft:old_growth_birch_forest run scoreboard players set #b tmf.tmp 38
execute if biome ~ ~ ~ minecraft:old_growth_pine_taiga run scoreboard players set #b tmf.tmp 39
execute if biome ~ ~ ~ minecraft:old_growth_spruce_taiga run scoreboard players set #b tmf.tmp 40
execute if biome ~ ~ ~ minecraft:pale_garden run scoreboard players set #b tmf.tmp 41
execute if biome ~ ~ ~ minecraft:plains run scoreboard players set #b tmf.tmp 42
execute if biome ~ ~ ~ minecraft:river run scoreboard players set #b tmf.tmp 43
execute if biome ~ ~ ~ minecraft:savanna run scoreboard players set #b tmf.tmp 44
execute if biome ~ ~ ~ minecraft:savanna_plateau run scoreboard players set #b tmf.tmp 45
execute if biome ~ ~ ~ minecraft:small_end_islands run scoreboard players set #b tmf.tmp 46
execute if biome ~ ~ ~ minecraft:snowy_beach run scoreboard players set #b tmf.tmp 47
execute if biome ~ ~ ~ minecraft:snowy_plains run scoreboard players set #b tmf.tmp 48
execute if biome ~ ~ ~ minecraft:snowy_slopes run scoreboard players set #b tmf.tmp 49
execute if biome ~ ~ ~ minecraft:snowy_taiga run scoreboard players set #b tmf.tmp 50
execute if biome ~ ~ ~ minecraft:soul_sand_valley run scoreboard players set #b tmf.tmp 51
execute if biome ~ ~ ~ minecraft:sparse_jungle run scoreboard players set #b tmf.tmp 52
execute if biome ~ ~ ~ minecraft:stony_peaks run scoreboard players set #b tmf.tmp 53
execute if biome ~ ~ ~ minecraft:stony_shore run scoreboard players set #b tmf.tmp 54
execute if biome ~ ~ ~ minecraft:sulfur_caves run scoreboard players set #b tmf.tmp 55
execute if biome ~ ~ ~ minecraft:sunflower_plains run scoreboard players set #b tmf.tmp 56
execute if biome ~ ~ ~ minecraft:swamp run scoreboard players set #b tmf.tmp 57
execute if biome ~ ~ ~ minecraft:taiga run scoreboard players set #b tmf.tmp 58
execute if biome ~ ~ ~ minecraft:the_end run scoreboard players set #b tmf.tmp 59
execute if biome ~ ~ ~ minecraft:the_void run scoreboard players set #b tmf.tmp 60
execute if biome ~ ~ ~ minecraft:warm_ocean run scoreboard players set #b tmf.tmp 61
execute if biome ~ ~ ~ minecraft:warped_forest run scoreboard players set #b tmf.tmp 62
execute if biome ~ ~ ~ minecraft:windswept_forest run scoreboard players set #b tmf.tmp 63
execute if biome ~ ~ ~ minecraft:windswept_gravelly_hills run scoreboard players set #b tmf.tmp 64
execute if biome ~ ~ ~ minecraft:windswept_hills run scoreboard players set #b tmf.tmp 65
execute if biome ~ ~ ~ minecraft:windswept_savanna run scoreboard players set #b tmf.tmp 66
execute if biome ~ ~ ~ minecraft:wooded_badlands run scoreboard players set #b tmf.tmp 67
execute if score #b tmf.tmp matches 0 run return 0
execute if score #b tmf.tmp = @s tmf.bio run return run scoreboard players set @s tmf.bic 0
# a new biome must be seen twice in a row (2 seconds) so walking along a border doesn't spam
execute unless score #b tmf.tmp = @s tmf.bic run return run scoreboard players operation @s tmf.bic = #b tmf.tmp
execute unless score @s tmf.bio matches 1.. run return run scoreboard players operation @s tmf.bio = #b tmf.tmp
scoreboard players operation @s tmf.bio = #b tmf.tmp
scoreboard players set @s tmf.bic 0
execute if score @s tmf.abt matches 1.. run return 0
scoreboard players set @s tmf.abt 40
execute if score #b tmf.tmp matches 1 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.badlands",color:"white"}]
execute if score #b tmf.tmp matches 2 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.bamboo_jungle",color:"white"}]
execute if score #b tmf.tmp matches 3 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.basalt_deltas",color:"white"}]
execute if score #b tmf.tmp matches 4 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.beach",color:"white"}]
execute if score #b tmf.tmp matches 5 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.birch_forest",color:"white"}]
execute if score #b tmf.tmp matches 6 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.cherry_grove",color:"white"}]
execute if score #b tmf.tmp matches 7 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.cold_ocean",color:"white"}]
execute if score #b tmf.tmp matches 8 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.crimson_forest",color:"white"}]
execute if score #b tmf.tmp matches 9 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.dappled_forest",color:"white"}]
execute if score #b tmf.tmp matches 10 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.dark_forest",color:"white"}]
execute if score #b tmf.tmp matches 11 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.deep_cold_ocean",color:"white"}]
execute if score #b tmf.tmp matches 12 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.deep_dark",color:"white"}]
execute if score #b tmf.tmp matches 13 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.deep_frozen_ocean",color:"white"}]
execute if score #b tmf.tmp matches 14 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.deep_lukewarm_ocean",color:"white"}]
execute if score #b tmf.tmp matches 15 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.deep_ocean",color:"white"}]
execute if score #b tmf.tmp matches 16 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.desert",color:"white"}]
execute if score #b tmf.tmp matches 17 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.dripstone_caves",color:"white"}]
execute if score #b tmf.tmp matches 18 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.end_barrens",color:"white"}]
execute if score #b tmf.tmp matches 19 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.end_highlands",color:"white"}]
execute if score #b tmf.tmp matches 20 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.end_midlands",color:"white"}]
execute if score #b tmf.tmp matches 21 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.eroded_badlands",color:"white"}]
execute if score #b tmf.tmp matches 22 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.flower_forest",color:"white"}]
execute if score #b tmf.tmp matches 23 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.forest",color:"white"}]
execute if score #b tmf.tmp matches 24 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.frozen_ocean",color:"white"}]
execute if score #b tmf.tmp matches 25 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.frozen_peaks",color:"white"}]
execute if score #b tmf.tmp matches 26 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.frozen_river",color:"white"}]
execute if score #b tmf.tmp matches 27 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.grove",color:"white"}]
execute if score #b tmf.tmp matches 28 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.ice_spikes",color:"white"}]
execute if score #b tmf.tmp matches 29 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.jagged_peaks",color:"white"}]
execute if score #b tmf.tmp matches 30 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.jungle",color:"white"}]
execute if score #b tmf.tmp matches 31 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.lukewarm_ocean",color:"white"}]
execute if score #b tmf.tmp matches 32 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.lush_caves",color:"white"}]
execute if score #b tmf.tmp matches 33 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.mangrove_swamp",color:"white"}]
execute if score #b tmf.tmp matches 34 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.meadow",color:"white"}]
execute if score #b tmf.tmp matches 35 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.mushroom_fields",color:"white"}]
execute if score #b tmf.tmp matches 36 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.nether_wastes",color:"white"}]
execute if score #b tmf.tmp matches 37 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.ocean",color:"white"}]
execute if score #b tmf.tmp matches 38 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.old_growth_birch_forest",color:"white"}]
execute if score #b tmf.tmp matches 39 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.old_growth_pine_taiga",color:"white"}]
execute if score #b tmf.tmp matches 40 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.old_growth_spruce_taiga",color:"white"}]
execute if score #b tmf.tmp matches 41 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.pale_garden",color:"white"}]
execute if score #b tmf.tmp matches 42 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.plains",color:"white"}]
execute if score #b tmf.tmp matches 43 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.river",color:"white"}]
execute if score #b tmf.tmp matches 44 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.savanna",color:"white"}]
execute if score #b tmf.tmp matches 45 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.savanna_plateau",color:"white"}]
execute if score #b tmf.tmp matches 46 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.small_end_islands",color:"white"}]
execute if score #b tmf.tmp matches 47 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.snowy_beach",color:"white"}]
execute if score #b tmf.tmp matches 48 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.snowy_plains",color:"white"}]
execute if score #b tmf.tmp matches 49 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.snowy_slopes",color:"white"}]
execute if score #b tmf.tmp matches 50 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.snowy_taiga",color:"white"}]
execute if score #b tmf.tmp matches 51 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.soul_sand_valley",color:"white"}]
execute if score #b tmf.tmp matches 52 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.sparse_jungle",color:"white"}]
execute if score #b tmf.tmp matches 53 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.stony_peaks",color:"white"}]
execute if score #b tmf.tmp matches 54 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.stony_shore",color:"white"}]
execute if score #b tmf.tmp matches 55 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.sulfur_caves",color:"white"}]
execute if score #b tmf.tmp matches 56 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.sunflower_plains",color:"white"}]
execute if score #b tmf.tmp matches 57 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.swamp",color:"white"}]
execute if score #b tmf.tmp matches 58 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.taiga",color:"white"}]
execute if score #b tmf.tmp matches 59 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.the_end",color:"white"}]
execute if score #b tmf.tmp matches 60 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.the_void",color:"white"}]
execute if score #b tmf.tmp matches 61 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.warm_ocean",color:"white"}]
execute if score #b tmf.tmp matches 62 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.warped_forest",color:"white"}]
execute if score #b tmf.tmp matches 63 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.windswept_forest",color:"white"}]
execute if score #b tmf.tmp matches 64 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.windswept_gravelly_hills",color:"white"}]
execute if score #b tmf.tmp matches 65 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.windswept_hills",color:"white"}]
execute if score #b tmf.tmp matches 66 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.windswept_savanna",color:"white"}]
execute if score #b tmf.tmp matches 67 run return run title @s actionbar [{text:"Entering ",color:"gray"},{translate:"biome.minecraft.wooded_badlands",color:"white"}]
