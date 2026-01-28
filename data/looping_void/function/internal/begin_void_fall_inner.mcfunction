# Mark this player as in looping fall
scoreboard players set @s lv_state 1
scoreboard players set @s lv_timer 0

# Optional: store current health for later logic if needed
execute store result score @s lv_health run data get entity @s Health 1

# Give huge safe fall distance so vanilla never applies fall damage for this fall
execute if score #damageMode lv_cfg matches 1.. run attribute @s minecraft:safe_fall_distance base set 1000

# Teleport logic with returnToLastGrounded support

# Case 1: return to last grounded position
execute if score #returnToLastGrounded lv_cfg matches 1 run function looping_void:internal/begin_void_fall_return_to_grounded

# Case 2: teleport up from current position by fallingHeight
execute unless score #returnToLastGrounded lv_cfg matches 1 run function looping_void:internal/tp_up_from_self
