# We are running AS the player here (@s is the player)

# 1. Clear temporary marker tag
tag @e[type=minecraft:marker,tag=last_ground_marker] remove av_temp

# 2. Copy this player's ID into #cur_owner
scoreboard players operation #cur_owner av_pid = @s av_pid

# 3. Mark markers that belong to this player (av_pid matches)
execute as @e[type=minecraft:marker,tag=last_ground_marker] \
    if score @s av_pid = #cur_owner av_pid \
    run tag @s add av_temp

# 4. If this player has no marker yet, create one
execute unless entity @e[type=minecraft:marker,tag=av_temp] at @s run function aether_void:internal/create_marker

# 5. Re-mark the owner's marker (in case we just created one)
tag @e[type=minecraft:marker,tag=last_ground_marker] remove av_temp
scoreboard players operation #cur_owner av_pid = @s av_pid
execute as @e[type=minecraft:marker,tag=last_ground_marker] \
    if score @s av_pid = #cur_owner av_pid \
    run tag @s add av_temp

# 6. If player is grounded, move their marker to their current position
# (THIS was wrong before)
execute if predicate aether_void:is_landed at @s run tp @e[type=minecraft:marker,tag=av_temp,limit=1] ~ ~ ~
