# End a forgiven fall WITHOUT applying custom landing damage.

# Restore normal safe fall distance so future falls behave like vanilla again
attribute @s minecraft:generic.safe_fall_distance base set 3

# Reset state
scoreboard players set @s av_state 0
scoreboard players reset @s av_timer
scoreboard players reset @s av_health

# Clear any lingering fall distance
data modify entity @s FallDistance set value 0f
