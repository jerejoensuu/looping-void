# End aether fall WITHOUT applying custom landing damage.

# Restore normal safe fall distance so future falls behave like vanilla again
attribute @s minecraft:generic.safe_fall_distance base set 3

function aether_void:internal/reset_state
