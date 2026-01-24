# Ensure av_state exists for all players (creates entry with 0 if missing)
scoreboard players add @a av_state 0

# Ensure every player has a unique av_pid (ID)
execute as @a unless score @s av_pid matches 1.. run function aether_void:assign_id

# Update last grounded position markers for all players
execute as @a at @s run function aether_void:sample_ground


# ==== VOID DETECTION PER DIMENSION ====

# Overworld
execute as @a[scores={av_state=0}] in minecraft:overworld at @s \
    if score #triggerOverworld av_cfg matches 1 \
    if predicate aether_void:is_in_void \
    run function aether_void:begin_void_fall_inner

# Nether
execute as @a[scores={av_state=0}] in minecraft:the_nether at @s \
    if score #triggerNether av_cfg matches 1 \
    if predicate aether_void:is_in_void \
    run function aether_void:begin_void_fall_inner

# End
execute as @a[scores={av_state=0}] in minecraft:the_end at @s \
    if score #triggerEnd av_cfg matches 1 \
    if predicate aether_void:is_in_void \
    run function aether_void:begin_void_fall_inner


# Per tick logic for players currently in forgiven fall state
execute as @a[scores={av_state=1}] at @s run function aether_void:void_fall_tick
