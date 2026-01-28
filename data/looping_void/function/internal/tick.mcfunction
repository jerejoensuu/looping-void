# Config trigger
# triggers
scoreboard players enable @a looping_void_config
execute as @a[scores={looping_void_config=1..}] at @s run function looping_void:_config
execute as @a[scores={looping_void_config=1..}] run scoreboard players set @s looping_void_config 0

# Ensure lv_state exists for all players (creates entry with 0 if missing)
scoreboard players add @a lv_state 0

# Ensure every player has a unique lv_pid (ID)
execute as @a unless score @s lv_pid matches 1.. run function looping_void:internal/assign_id

# Update last grounded position markers for all players
execute as @a at @s run function looping_void:internal/sample_ground


# ==== VOID DETECTION PER DIMENSION ====

# Overworld
execute as @a[scores={lv_state=0}] in minecraft:overworld at @s \
    if score #triggerOverworld lv_cfg matches 1 \
    if predicate looping_void:is_in_void \
    run function looping_void:internal/begin_void_fall_inner

# Nether
execute as @a[scores={lv_state=0}] in minecraft:the_nether at @s \
    if score #triggerNether lv_cfg matches 1 \
    if predicate looping_void:is_in_void \
    run function looping_void:internal/begin_void_fall_inner

# End
execute as @a[scores={lv_state=0}] in minecraft:the_end at @s \
    if score #triggerEnd lv_cfg matches 1 \
    if predicate looping_void:is_in_void \
    run function looping_void:internal/begin_void_fall_inner


# Per tick logic for players currently in forgiven fall state
execute as @a[scores={lv_state=1}] at @s run function looping_void:internal/void_fall_tick
