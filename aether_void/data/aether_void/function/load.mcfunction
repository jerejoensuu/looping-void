# ==== SCOREBOARDS ====

# 0 = normal, 1 = in a forgiven void fall
scoreboard objectives add av_state dummy

# Timer for forgiven fall (ticks)
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
scoreboard players set #fallingHeightOverworld av_cfg 300
scoreboard players set #fallingHeightNether av_cfg 300
scoreboard players set #fallingHeightEnd av_cfg 160

# Max ticks allowed in forgiven fall before failsafe kicks in
scoreboard players set #maxTicks av_cfg 200

# PreventDeath: 1 = clamp damage to leave 1 health, 0 = do full damage
scoreboard players set #preventDeath av_cfg 1

# Dimension toggles
scoreboard players set #triggerOverworld av_cfg 1
scoreboard players set #triggerNether av_cfg 1
scoreboard players set #triggerEnd av_cfg 1

# Return to last grounded:
# 1 = teleport above last grounded position
# 0 = teleport straight up from current position
scoreboard players set #returnToLastGrounded av_cfg 1

# Init ID generator
scoreboard players set #idgen av_idgen 0


# ==== CLEANUP ON RELOAD ====

scoreboard players set @a av_state 0
scoreboard players reset @a av_timer
scoreboard players reset @a av_health
scoreboard players reset @a av_pid

# Clear player marker tags so we rebuild cleanly
tag @a remove hasLastGroundMarker

# Clean up old marker armor stands
kill @e[type=minecraft:marker,tag=last_ground_marker]
