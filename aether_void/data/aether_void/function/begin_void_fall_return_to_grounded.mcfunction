# We are AS the player here

# 1. Clear temporary marker tags
tag @e[type=minecraft:marker,tag=last_ground_marker] remove av_temp

# 2. Copy this player's ID into #cur_owner
scoreboard players operation #cur_owner av_pid = @s av_pid

# 3. Mark markers that belong to this player
execute as @e[type=minecraft:marker,tag=last_ground_marker] \
    if score @s av_pid = #cur_owner av_pid \
    run tag @s add av_temp

# 4. If owner has a marker, tp above that marker using fallingHeight
execute if entity @e[type=minecraft:marker,tag=av_temp,limit=1] \
    run function aether_void:tp_up_from_marker

# 5. Fallback: if no marker exists, tp up from current position using fallingHeight
execute unless entity @e[type=minecraft:marker,tag=av_temp,limit=1] \
    run function aether_void:tp_up_from_self
