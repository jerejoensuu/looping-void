# Copy absolute damage from config fake player into storage
# #absoluteDamage lv_cfg holds the configured amount

execute store result storage looping_void:damage amount double 1 run \
    scoreboard players get #absoluteDamage lv_cfg

# If config is 0 or less, bail out
execute store result score @s lv_cfg run scoreboard players get #absoluteDamage lv_cfg
execute if score @s lv_cfg matches ..0 run return 0

# Now call the macro damage function with this storage
function looping_void:internal/landing_damage/damage_absolute with storage looping_void:damage

return 0
