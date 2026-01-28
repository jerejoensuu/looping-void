# ==== SCOREBOARDS ====

# Trigger
scoreboard objectives add looping_void_config trigger

# 0 = normal, 1 = in looping void fall
scoreboard objectives add lv_state dummy

# Timer for looping void fall (ticks)
scoreboard objectives add lv_timer dummy

# Scratch storage for health (used in landing damage)
scoreboard objectives add lv_health dummy

# Config holder (fake players)
scoreboard objectives add lv_cfg dummy

# Per-player ID for marker ownership
scoreboard objectives add lv_pid dummy

# Global ID generator for unique lv_pid values
scoreboard objectives add lv_idgen dummy

# TP coordinates
scoreboard objectives add lv_x dummy
scoreboard objectives add lv_y dummy
scoreboard objectives add lv_z dummy

# ==== CONFIG VALUES (EDIT VIA /scoreboard) ====

# Height to drop players from (Y)
execute unless score #fallingHeightOverworld lv_cfg matches 0.. run scoreboard players set #fallingHeightOverworld lv_cfg 300
execute unless score #fallingHeightNether lv_cfg matches 0.. run scoreboard players set #fallingHeightNether lv_cfg 300
execute unless score #fallingHeightEnd lv_cfg matches 0.. run scoreboard players set #fallingHeightEnd lv_cfg 160

# Max ticks allowed in looping void fall before failsafe kicks in
execute unless score #maxTicks lv_cfg matches 0.. run scoreboard players set #maxTicks lv_cfg 220

# PreventDeath: 1 = clamp damage to lelve 1 health, 0 = do full damage
execute unless score #preventDeath lv_cfg matches 0.. run scoreboard players set #preventDeath lv_cfg 1

# Dimension toggles
execute unless score #triggerOverworld lv_cfg matches 0.. run scoreboard players set #triggerOverworld lv_cfg 1
execute unless score #triggerNether lv_cfg matches 0.. run scoreboard players set #triggerNether lv_cfg 0
execute unless score #triggerEnd lv_cfg matches 0.. run scoreboard players set #triggerEnd lv_cfg 1

# Return to last grounded:
# 1 = teleport above last grounded position
# 0 = teleport straight up from current position
execute unless score #returnToLastGrounded lv_cfg matches 0.. run scoreboard players set #returnToLastGrounded lv_cfg 1

# Damage mode:
# 0 = Normal
# 1 = PreventDeath
# 2 = Absolute
execute unless score #damageMode lv_cfg matches 0.. run scoreboard players set #damageMode lv_cfg 1

# Damage amount for absolute mode
execute unless score #absoluteDamage lv_cfg matches 0.. run scoreboard players set #absoluteDamage lv_cfg 19

# Init ID generator
execute unless score #idgen lv_idgen matches 0.. run scoreboard players set #idgen lv_idgen 0


# ==== CLEANUP ON RELOAD ====

function looping_void:internal/reset_state
scoreboard players reset @a lv_pid

# Clear player marker tags so we rebuild cleanly
tag @a remove hasLastGroundMarker

# Clean up old marker armor stands
kill @e[type=minecraft:marker,tag=last_ground_marker]

say Looping Void loaded!