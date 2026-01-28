# ===== DAMAGE MODE DISPATCH =====
# 0 = Normal
# 1 = PreventDeath
# 2 = Absolute

# Check damage mode and dispatch to appropriate handler
# This function is not called if damageMode is 0 (normal)
execute if score #damageMode lv_cfg matches 1 run function looping_void:internal/landing_damage/damage_prevent_death
execute if score #damageMode lv_cfg matches 1 run return 0

execute if score #damageMode lv_cfg matches 2 run function looping_void:internal/landing_damage/damage_absolute_from_config
execute if score #damageMode lv_cfg matches 2 run return 0
