# Increment global ID generator
scoreboard players add #idgen lv_idgen 1

# Assign this new ID to the player
scoreboard players operation @s lv_pid = #idgen lv_idgen
