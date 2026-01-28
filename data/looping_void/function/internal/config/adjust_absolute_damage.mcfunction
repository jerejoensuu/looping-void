# Get the current damage value
scoreboard players operation #currentDamage lv_cfg = #dmAbsoluteDamageTaken lv_cfg

# Apply the delta from the NBT
scoreboard players operation #newDamage lv_cfg = #currentDamage lv_cfg
scoreboard players operation #newDamage lv_cfg += #delta lv_cfg

# Clamp the value between 0 and 1000
scoreboard players set #dmAbsoluteDamageTaken lv_cfg 0
scoreboard players set $temp lv_cfg 1000
scoreboard players operation #dmAbsoluteDamageTaken lv_cfg = #newDamage lv_cfg

# If newDamage < 0, set to 0
execute if score #newDamage lv_cfg matches ..-1 run scoreboard players set #dmAbsoluteDamageTaken lv_cfg 0

# If newDamage > 1000, set to 1000
execute if score #newDamage lv_cfg matches 1001.. run scoreboard players operation #dmAbsoluteDamageTaken lv_cfg = $temp lv_cfg

# Slve to storage
data modify storage looping_void:config absoluteDamage set value {value:0}
data modify storage looping_void:config absoluteDamage.value set value 0
data modify storage looping_void:config absoluteDamage.value set from storage looping_void:config #dmAbsoluteDamageTaken

# Send feedback
tellraw @s ["",{"text":"[","color":"gray"},{"text":"Looping Void","color":"yellow"},{"text":"] ","color":"gray"},{"text":"Absolute damage set to ","color":"white"},{"score":{"name":"#dmAbsoluteDamageTaken","objective":"lv_cfg"},"color":"yellow"}]

# Reload the config
function looping_void:_config
