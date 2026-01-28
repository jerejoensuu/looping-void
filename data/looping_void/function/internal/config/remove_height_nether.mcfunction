# Remove the specified value from the Nether return height
$scoreboard players remove #fallingHeightNether lv_cfg $(value)
# Refresh the config display
function looping_void:_config
