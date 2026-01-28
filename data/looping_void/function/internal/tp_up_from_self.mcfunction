# Read current X and Z
execute store result score @s lv_x run data get entity @s Pos[0] 1
execute store result score @s lv_z run data get entity @s Pos[2] 1

# Set Y from config
execute if dimension minecraft:overworld run scoreboard players operation @s lv_y = #fallingHeightOverworld lv_cfg
execute if dimension minecraft:the_nether run scoreboard players operation @s lv_y = #fallingHeightNether lv_cfg
execute if dimension minecraft:the_end run scoreboard players operation @s lv_y = #fallingHeightEnd lv_cfg

# Dump to storage
execute store result storage looping_void:coords x double 1 run scoreboard players get @s lv_x
execute store result storage looping_void:coords y double 1 run scoreboard players get @s lv_y
execute store result storage looping_void:coords z double 1 run scoreboard players get @s lv_z

function looping_void:internal/tp_from_storage with storage looping_void:coords
