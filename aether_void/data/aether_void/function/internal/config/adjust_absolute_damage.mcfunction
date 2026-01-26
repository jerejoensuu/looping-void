# Get the current damage value
scoreboard players operation #currentDamage av_cfg = #dmAbsoluteDamageTaken av_cfg

# Apply the delta from the NBT
scoreboard players operation #newDamage av_cfg = #currentDamage av_cfg
scoreboard players operation #newDamage av_cfg += #delta av_cfg

# Clamp the value between 0 and 1000
scoreboard players set #dmAbsoluteDamageTaken av_cfg 0
scoreboard players set $temp av_cfg 1000
scoreboard players operation #dmAbsoluteDamageTaken av_cfg = #newDamage av_cfg

# If newDamage < 0, set to 0
execute if score #newDamage av_cfg matches ..-1 run scoreboard players set #dmAbsoluteDamageTaken av_cfg 0

# If newDamage > 1000, set to 1000
execute if score #newDamage av_cfg matches 1001.. run scoreboard players operation #dmAbsoluteDamageTaken av_cfg = $temp av_cfg

# Save to storage
data modify storage aether_void:config absoluteDamage set value {value:0}
data modify storage aether_void:config absoluteDamage.value set value 0
data modify storage aether_void:config absoluteDamage.value set from storage aether_void:config #dmAbsoluteDamageTaken

# Send feedback
tellraw @s ["",{"text":"[","color":"gray"},{"text":"Aether Void","color":"yellow"},{"text":"] ","color":"gray"},{"text":"Absolute damage set to ","color":"white"},{"score":{"name":"#dmAbsoluteDamageTaken","objective":"av_cfg"},"color":"yellow"}]

# Reload the config
function aether_void:_config
