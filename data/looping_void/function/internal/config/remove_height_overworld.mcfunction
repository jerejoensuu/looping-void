# Remove the specified value from the Overworld return height
$scoreboard players remove #fallingHeightOverworld lv_cfg $(value)
# Refresh the config display
function looping_void:_config
