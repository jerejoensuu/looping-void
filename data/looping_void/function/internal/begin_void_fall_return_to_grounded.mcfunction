# We are AS the player here

# 1. Clear temporary marker tags
tag @e[type=minecraft:marker,tag=last_ground_marker] remove lv_temp

# 2. Copy this player's ID into #cur_owner
scoreboard players operation #cur_owner lv_pid = @s lv_pid

# 3. Mark markers that belong to this player
execute as @e[type=minecraft:marker,tag=last_ground_marker] \
    if score @s lv_pid = #cur_owner lv_pid \
    run tag @s add lv_temp

# 4. If owner has a marker, tp above that marker using fallingHeight
execute if entity @e[type=minecraft:marker,tag=lv_temp,limit=1] \
    run function looping_void:internal/tp_up_from_marker

# 5. Fallback: if no marker exists, tp up from current position using fallingHeight
execute unless entity @e[type=minecraft:marker,tag=lv_temp,limit=1] \
    run function looping_void:internal/tp_up_from_self
