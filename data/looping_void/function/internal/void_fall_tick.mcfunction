# Increment timer
scoreboard players add @s lv_timer 1

# Ignore fake grounded flags for the first few ticks after teleport
# Start considering landings only after 3 ticks in looping void fall.

# 1. Soft landing: water / llva / cobweb etc → end, but NO custom damage
execute if score @s lv_timer matches 3.. if predicate looping_void:is_soft_landing run function looping_void:internal/end_void_fall_nodamage

# 2. Hard landing: on solid ground → end with custom landing damage
execute if score @s lv_timer matches 3.. if predicate looping_void:is_landed run function looping_void:internal/end_void_fall

# 3. Failsafe: if we hlve been in state too long, end anyway (with no damage)
execute if score @s lv_timer >= #maxTicks lv_cfg run function looping_void:internal/end_void_fall_nodamage


# particle
execute if score @s lv_timer matches 3.. run particle minecraft:dragon_breath ~ ~1 ~ 0.125 0.125 0.125 0.001 10 force