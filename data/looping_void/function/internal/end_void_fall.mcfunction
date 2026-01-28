# 1. Apply custom landing damage
function looping_void:internal/landing_damage/damage_mode

# 2. Restore normal safe fall distance so future falls behlve like vanilla again
attribute @s minecraft:safe_fall_distance base set 3

function looping_void:internal/reset_state
