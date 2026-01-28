# ==== SCOREBOARDS ====

# Trigger
scoreboard objectives add aether_void_config trigger

# 0 = normal, 1 = in aether void fall
scoreboard objectives add av_state dummy

# Timer for aether void fall (ticks)
scoreboard objectives add av_timer dummy

# Scratch storage for health (used in landing damage)
scoreboard objectives add av_health dummy

# Config holder (fake players)
scoreboard objectives add av_cfg dummy

# Per-player ID for marker ownership
scoreboard objectives add av_pid dummy

# Global ID generator for unique av_pid values
scoreboard objectives add av_idgen dummy

# TP coordinates
scoreboard objectives add av_x dummy
scoreboard objectives add av_y dummy
scoreboard objectives add av_z dummy

# ==== CONFIG VALUES (EDIT VIA /scoreboard) ====

# Height to drop players from (Y)
execute unless score #fallingHeightOverworld av_cfg matches 0.. run scoreboard players set #fallingHeightOverworld av_cfg 300
execute unless score #fallingHeightNether av_cfg matches 0.. run scoreboard players set #fallingHeightNether av_cfg 300
execute unless score #fallingHeightEnd av_cfg matches 0.. run scoreboard players set #fallingHeightEnd av_cfg 160

# Max ticks allowed in aether void fall before failsafe kicks in
execute unless score #maxTicks av_cfg matches 0.. run scoreboard players set #maxTicks av_cfg 220

# PreventDeath: 1 = clamp damage to leave 1 health, 0 = do full damage
execute unless score #preventDeath av_cfg matches 0.. run scoreboard players set #preventDeath av_cfg 1

# Dimension toggles
execute unless score #triggerOverworld av_cfg matches 0.. run scoreboard players set #triggerOverworld av_cfg 1
execute unless score #triggerNether av_cfg matches 0.. run scoreboard players set #triggerNether av_cfg 0
execute unless score #triggerEnd av_cfg matches 0.. run scoreboard players set #triggerEnd av_cfg 1

# Return to last grounded:
# 1 = teleport above last grounded position
# 0 = teleport straight up from current position
execute unless score #returnToLastGrounded av_cfg matches 0.. run scoreboard players set #returnToLastGrounded av_cfg 1

# Damage mode:
# 0 = Normal
# 1 = PreventDeath
# 2 = Absolute
execute unless score #damageMode av_cfg matches 0.. run scoreboard players set #damageMode av_cfg 1

# Damage amount for absolute mode
execute unless score #absoluteDamage av_cfg matches 0.. run scoreboard players set #absoluteDamage av_cfg 19

# Init ID generator
execute unless score #idgen av_idgen matches 0.. run scoreboard players set #idgen av_idgen 0


# ==== CLEANUP ON RELOAD ====

function aether_void:internal/reset_state
scoreboard players reset @a av_pid

# Clear player marker tags so we rebuild cleanly
tag @a remove hasLastGroundMarker

# Clean up old marker armor stands
kill @e[type=minecraft:marker,tag=last_ground_marker]

say Aether Void loaded!