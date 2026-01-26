# Only start if not already handled
execute unless score @s av_state matches 1..1 run function aether_void:internal/begin_void_fall_inner
