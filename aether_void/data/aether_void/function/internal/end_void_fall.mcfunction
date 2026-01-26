# 1. Apply custom landing damage
function aether_void:internal/landing_damage/damage_mode

# 2. Restore normal safe fall distance so future falls behave like vanilla again
attribute @s minecraft:generic.safe_fall_distance base set 3

function aether_void:internal/reset_state
