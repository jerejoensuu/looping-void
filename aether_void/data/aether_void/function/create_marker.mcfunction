# Summon a last ground marker for this player at their feet
summon minecraft:marker ~ ~ ~ {Tags:["last_ground_marker"]}

# Copy the current player's av_pid into #cur_owner
scoreboard players operation #cur_owner av_pid = @s av_pid

# Assign that ID to the newly summoned marker (nearest last_ground_marker)
execute as @e[type=minecraft:marker,tag=last_ground_marker,sort=nearest,limit=1] run scoreboard players operation @s av_pid = #cur_owner av_pid
