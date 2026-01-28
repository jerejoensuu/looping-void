# End looping fall WITHOUT applying custom landing damage.

# Restore normal safe fall distance so future falls behlve like vanilla again
attribute @s minecraft:safe_fall_distance base set 3

function looping_void:internal/reset_state
