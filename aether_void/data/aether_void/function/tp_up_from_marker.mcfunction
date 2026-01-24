# Read marker X and Z
execute store result score @s av_x run data get entity @e[type=minecraft:marker,tag=av_temp,limit=1] Pos[0] 1
execute store result score @s av_z run data get entity @e[type=minecraft:marker,tag=av_temp,limit=1] Pos[2] 1

# Set Y from config
execute if dimension minecraft:overworld run scoreboard players operation @s av_y = #fallingHeightOverworld av_cfg
execute if dimension minecraft:the_nether run scoreboard players operation @s av_y = #fallingHeightNether av_cfg
execute if dimension minecraft:the_end run scoreboard players operation @s av_y = #fallingHeightEnd av_cfg

# Dump to storage
execute store result storage aether_void:coords x double 1 run scoreboard players get @s av_x
execute store result storage aether_void:coords y double 1 run scoreboard players get @s av_y
execute store result storage aether_void:coords z double 1 run scoreboard players get @s av_z

function aether_void:tp_from_storage with storage aether_void:coords
