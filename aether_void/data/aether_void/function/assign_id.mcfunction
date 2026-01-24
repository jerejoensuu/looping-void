# Increment global ID generator
scoreboard players add #idgen av_idgen 1

# Assign this new ID to the player
scoreboard players operation @s av_pid = #idgen av_idgen
