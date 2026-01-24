# If preventDeath is disabled, just always deal 19 and stop
execute if score #preventDeath av_cfg matches 0 run damage @s 19

# If preventDeath disabled, we are done
execute if score #preventDeath av_cfg matches 0 run return 0

# Non lethal path:

# 1. Get current health as integer
execute store result score @s av_health run data get entity @s Health 1

# 2. If health <= 1, do nothing
execute if score @s av_health matches ..1 run return 0

# 3. Piecewise clamp:
#    We want: damage = min(19, health - 1)
#    Health is in health points (20 = 10 hearts)

# Health >= 21: damage 19 is always fine
execute if score @s av_health matches 21.. run damage @s 19

# Health == 20: damage 19 -> leaves 1
execute if score @s av_health matches 20 run damage @s 19

# Health == 19: damage 18 -> leaves 1
execute if score @s av_health matches 19 run damage @s 18
execute if score @s av_health matches 18 run damage @s 17
execute if score @s av_health matches 17 run damage @s 16
execute if score @s av_health matches 16 run damage @s 15
execute if score @s av_health matches 15 run damage @s 14
execute if score @s av_health matches 14 run damage @s 13
execute if score @s av_health matches 13 run damage @s 12
execute if score @s av_health matches 12 run damage @s 11
execute if score @s av_health matches 11 run damage @s 10
execute if score @s av_health matches 10 run damage @s 9
execute if score @s av_health matches 9 run damage @s 8
execute if score @s av_health matches 8 run damage @s 7
execute if score @s av_health matches 7 run damage @s 6
execute if score @s av_health matches 6 run damage @s 5
execute if score @s av_health matches 5 run damage @s 4
execute if score @s av_health matches 4 run damage @s 3
execute if score @s av_health matches 3 run damage @s 2
execute if score @s av_health matches 2 run damage @s 1
