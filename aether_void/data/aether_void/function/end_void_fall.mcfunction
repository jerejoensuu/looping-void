# 1. Apply custom landing damage
function aether_void:landing_damage

# 2. Restore normal safe fall distance so future falls behave like vanilla again
attribute @s minecraft:generic.safe_fall_distance base set 3

# 3. Reset state
scoreboard players set @s av_state 0
scoreboard players reset @s av_timer
scoreboard players reset @s av_health
