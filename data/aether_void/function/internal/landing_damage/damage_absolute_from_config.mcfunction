# Copy absolute damage from config fake player into storage
# #absoluteDamage av_cfg holds the configured amount

execute store result storage aether_void:damage amount double 1 run \
    scoreboard players get #absoluteDamage av_cfg

# If config is 0 or less, bail out
execute store result score @s av_cfg run scoreboard players get #absoluteDamage av_cfg
execute if score @s av_cfg matches ..0 run return 0

# Now call the macro damage function with this storage
function aether_void:internal/landing_damage/damage_absolute with storage aether_void:damage

return 0
