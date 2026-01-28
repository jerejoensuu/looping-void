# Only start if not already handled
execute unless score @s lv_state matches 1..1 run function looping_void:internal/begin_void_fall_inner
