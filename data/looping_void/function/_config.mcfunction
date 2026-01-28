  #
  # Looping Void – General Settings
  #
  tellraw @s [{"text":"Looping Void settings","color":"green"}]

  #
  # Dimension toggles
  #

  tellraw @s [{"text":"\n>> ","color":"dark_gray"}, {"text":"Dimension toggles","color":"green"}]

  # Overworld trigger toggle
  execute if score #triggerOverworld lv_cfg matches 1.. run tellraw @s [ \
    {"text":" - ","color":"white"}, \
    {"text":"Overworld void handling - ","color":"gray"}, \
    {"text":"[ON]","bold":true,"color":"green"}, \
    {"text":"/","color":"gray"}, \
    { \
      "text":"[OFF]", \
      "color":"gray", \
      "click_event":{"action":"run_command","command":"/function looping_void:internal/config/set_enabled_overworld {enabled:0}"}, \
      "hover_event":{"action":"show_text","value":{"text":"Disable Looping Void in the Overworld","color":"red"}} \
    } \
  ]

  execute if score #triggerOverworld lv_cfg matches ..0 run tellraw @s [ \
    {"text":" - ","color":"white"}, \
    {"text":"Overworld void handling - ","color":"gray"}, \
    { \
      "text":"[ON]", \
      "color":"gray", \
      "click_event":{"action":"run_command","command":"/function looping_void:internal/config/set_enabled_overworld {enabled:1}"}, \
      "hover_event":{"action":"show_text","value":{"text":"Enable Looping Void in the Overworld","color":"green"}} \
    }, \
    {"text":"/","color":"gray"}, \
    {"text":"[OFF]","bold":true,"color":"red"} \
  ]

  # Nether trigger toggle
  execute if score #triggerNether lv_cfg matches 1.. run tellraw @s [ \
    {"text":" - ","color":"white"}, \
    {"text":"Nether void handling     - ","color":"gray"}, \
    {"text":"[ON]","bold":true,"color":"green"}, \
    {"text":"/","color":"gray"}, \
    { \
      "text":"[OFF]", \
      "color":"gray", \
      "click_event":{"action":"run_command","command":"/function looping_void:internal/config/set_enabled_nether {enabled:0}"}, \
      "hover_event":{"action":"show_text","value":{"text":"Disable Looping Void in the Nether","color":"green"}} \
    } \
  ]

  execute if score #triggerNether lv_cfg matches ..0 run tellraw @s [ \
    {"text":" - ","color":"white"}, \
    {"text":"Nether void handling     - ","color":"gray"}, \
    { \
      "text":"[ON]", \
      "color":"gray", \
      "click_event":{"action":"run_command","command":"/function looping_void:internal/config/set_enabled_nether {enabled:1}"}, \
      "hover_event":{"action":"show_text","value":{"text":"Enable Looping Void in the Nether","color":"red"}} \
    }, \
    {"text":"/","color":"gray"}, \
    {"text":"[OFF]","bold":true,"color":"red"} \
  ]

  # End trigger toggle
  execute if score #triggerEnd lv_cfg matches 1.. run tellraw @s [ \
    {"text":" - ","color":"white"}, \
    {"text":"End void handling         - ","color":"gray"}, \
    {"text":"[ON]","bold":true,"color":"green"}, \
    {"text":"/","color":"gray"}, \
    { \
      "text":"[OFF]", \
      "color":"gray", \
      "click_event":{"action":"run_command","command":"/function looping_void:internal/config/set_enabled_end {enabled:0}"}, \
      "hover_event":{"action":"show_text","value":{"text":"Disable Looping Void in the End","color":"red"}} \
    } \
  ]

  execute if score #triggerEnd lv_cfg matches ..0 run tellraw @s [ \
    {"text":" - ","color":"white"}, \
    {"text":"End void handling         - ","color":"gray"}, \
    { \
      "text":"[ON]", \
      "color":"gray", \
      "click_event":{"action":"run_command","command":"/function looping_void:internal/config/set_enabled_end {enabled:1}"}, \
      "hover_event":{"action":"show_text","value":{"text":"Enable Looping Void in the End","color":"green"}} \
    }, \
    {"text":"/","color":"gray"}, \
    {"text":"[OFF]","bold":true,"color":"red"} \
  ]


  #
  # Teleport behlviour
  #
  tellraw @s [{"text":"\n>> ","color":"dark_gray"}, {"text":"Teleport behlviour","color":"green"}]

  # Return to last grounded toggle (#returnToLastGrounded)
  execute if score #returnToLastGrounded lv_cfg matches 1.. run tellraw @s [ \
    {"text":" - ","color":"white"}, \
    {"text":"Return to last grounded - ","color":"gray"}, \
    {"text":"[ON]","bold":true,"color":"green"}, \
    {"text":"/","color":"gray"}, \
    { \
      "text":"[OFF]", \
      "color":"gray", \
      "click_event":{"action":"run_command","command":"/function looping_void:internal/config/set_return_to_last_grounded {enabled:0}"}, \
      "hover_event":{"action":"show_text","value":{"text":"Teleport above current position instead","color":"red"}} \
    } \
  ]

  execute if score #returnToLastGrounded lv_cfg matches ..0 run tellraw @s [ \
    {"text":" - ","color":"white"}, \
    {"text":"Return to last grounded - ","color":"gray"}, \
    { \
      "text":"[ON]", \
      "color":"gray", \
      "click_event":{"action":"run_command","command":"/function looping_void:internal/config/set_return_to_last_grounded {enabled:1}"}, \
      "hover_event":{"action":"show_text","value":{"text":"Teleport relative to last grounded marker","color":"green"}} \
    }, \
    {"text":"/","color":"gray"}, \
    {"text":"[OFF]","bold":true,"color":"red"} \
  ]


  #
  # Damage settings
  #
  tellraw @s [{"text":"\n>> ","color":"dark_gray"}, {"text":"Landing damage settings","color":"green"}]

  # Damage mode enum row:
  # Damage mode:
  # 0 = Normal
  # 1 = PreventDeath
  # 2 = Absolute
  # Case: PreventDeath active
  execute if score #damageMode lv_cfg matches 1 run tellraw @s [ \
    {"text":" - ","color":"white"}, \
    {"text":"Damage mode - ","color":"gray"}, \
    { \
      "text":"[PreventDeath]", \
      "bold":true, \
      "color":"green", \
      "hover_event":{"action":"show_text","value":{"text":"Clamp to half a heart","color":"green"}} \
    }, \
    {"text":" ","color":"gray"}, \
    { \
      "text":"[Absolute]", \
      "color":"gray", \
      "click_event":{"action":"run_command","command":"/function looping_void:internal/config/set_damage_mode {mode:2}"}, \
      "hover_event":{"action":"show_text","value":{"text":"Use fixed damage from config","color":"yellow"}} \
    }, \
    {"text":" ","color":"gray"}, \
    { \
      "text":"[Normal]", \
      "color":"gray", \
      "click_event":{"action":"run_command","command":"/function looping_void:internal/config/set_damage_mode {mode:0}"}, \
      "hover_event":{"action":"show_text","value":{"text":"Use vanilla / other landing damage","color":"yellow"}} \
    } \
  ]

  # Case: Absolute active
  execute if score #damageMode lv_cfg matches 2 run tellraw @s [ \
    {"text":" - ","color":"white"}, \
    {"text":"Damage mode - ","color":"gray"}, \
    { \
      "text":"[PreventDeath]", \
      "color":"gray", \
      "click_event":{"action":"run_command","command":"/function looping_void:internal/config/set_damage_mode {mode:1}"}, \
      "hover_event":{"action":"show_text","value":{"text":"Clamp to half a heart","color":"green"}} \
    }, \
    {"text":" ","color":"gray"}, \
    { \
      "text":"[Absolute]", \
      "bold":true, \
      "color":"green", \
      "hover_event":{"action":"show_text","value":{"text":"Use fixed damage from config","color":"yellow"}} \
    }, \
    {"text":" ","color":"gray"}, \
    { \
      "text":"[Normal]", \
      "color":"gray", \
      "click_event":{"action":"run_command","command":"/function looping_void:internal/config/set_damage_mode {mode:0}"}, \
      "hover_event":{"action":"show_text","value":{"text":"Use vanilla / other landing damage","color":"yellow"}} \
    } \
  ]

  # Case: Normal active
  execute if score #damageMode lv_cfg matches 0 run tellraw @s [ \
    {"text":" - ","color":"white"}, \
    {"text":"Damage mode - ","color":"gray"}, \
    { \
      "text":"[PreventDeath]", \
      "color":"gray", \
      "click_event":{"action":"run_command","command":"/function looping_void:internal/config/set_damage_mode {mode:1}"}, \
      "hover_event":{"action":"show_text","value":{"text":"Clamp to half a heart","color":"green"}} \
    }, \
    {"text":" ","color":"gray"}, \
    { \
      "text":"[Absolute]", \
      "color":"gray", \
      "click_event":{"action":"run_command","command":"/function looping_void:internal/config/set_damage_mode {mode:2}"}, \
      "hover_event":{"action":"show_text","value":{"text":"Use fixed damage from config","color":"yellow"}} \
    }, \
    {"text":" ","color":"gray"}, \
    { \
      "text":"[Normal]", \
      "bold":true, \
      "color":"green", \
      "hover_event":{"action":"show_text","value":{"text":"Use vanilla / other landing damage","color":"yellow"}} \
    } \
  ]

  # Absolute damage value shown only when Absolute is active
  execute if score #damageMode lv_cfg matches 2 run tellraw @s [ \
    {"text":"   ","color":"white"}, \
    {"text":"Absolute damage - ","color":"gray"}, \
    { \
      "text":"[-1]", \
      "color":"red", \
      "click_event":{"action":"run_command","command":"/function looping_void:internal/config/adjust_absolute_damage {delta:-1}"}, \
      "hover_event":{"action":"show_text","value":{"text":"Decrease absolute landing damage by 1","color":"red"}} \
    }, \
    {"text":" [","color":"yellow"}, \
    {"score":{"name":"#absoluteDamage","objective":"lv_cfg"},"color":"yellow"}, \
    {"text":"]","color":"yellow"}, \
    {"text":" ","color":"white"}, \
    { \
      "text":"[+1]", \
      "color":"green", \
      "click_event":{"action":"run_command","command":"/function looping_void:internal/config/adjust_absolute_damage {delta:1}"}, \
      "hover_event":{"action":"show_text","value":{"text":"Increase absolute landing damage by 1","color":"green"}} \
    } \
  ]


  #
  # Distance Settings per Dimension
  #
  tellraw @s [{"text":"\n>> ","color":"dark_gray"}, {"text":"Return height settings","color":"green"}]

  # Overworld return height (absolute Y), with ±1/5/10 buttons
  tellraw @s [ \
    {"text":" - ","color":"white"}, \
    {"text":"Overworld return Y - ","color":"gray"}, \
    { \
      "text":"[-10]", \
      "color":"red", \
      "click_event":{"action":"run_command","command":"/function looping_void:internal/config/remove_height_overworld {value:10}"}, \
      "hover_event":{"action":"show_text","value":{"text":"Lower overworld return height by 10","color":"red"}} \
    }, \
    {"text":" ","color":"white"}, \
    { \
      "text":"[-5]", \
      "color":"red", \
      "click_event":{"action":"run_command","command":"/function looping_void:internal/config/remove_height_overworld {value:5}"}, \
      "hover_event":{"action":"show_text","value":{"text":"Lower overworld return height by 5","color":"red"}} \
    }, \
    {"text":" ","color":"white"}, \
    { \
      "text":"[-1]", \
      "color":"red", \
      "click_event":{"action":"run_command","command":"/function looping_void:internal/config/remove_height_overworld {value:1}"}, \
      "hover_event":{"action":"show_text","value":{"text":"Lower overworld return height by 1","color":"red"}} \
    }, \
    {"text":"  [","color":"yellow"}, \
    {"score":{"name":"#fallingHeightOverworld","objective":"lv_cfg"},"color":"yellow"}, \
    {"text":"]  ","color":"yellow"}, \
    { \
      "text":"[+1]", \
      "color":"green", \
      "click_event":{"action":"run_command","command":"/function looping_void:internal/config/add_height_overworld {value:1}"}, \
      "hover_event":{"action":"show_text","value":{"text":"Raise overworld return height by 1","color":"green"}} \
    }, \
    {"text":" ","color":"white"}, \
    { \
      "text":"[+5]", \
      "color":"green", \
      "click_event":{"action":"run_command","command":"/function looping_void:internal/config/add_height_overworld {value:5}"}, \
      "hover_event":{"action":"show_text","value":{"text":"Raise overworld return height by 5","color":"green"}} \
    }, \
    {"text":" ","color":"white"}, \
    { \
      "text":"[+10]", \
      "color":"green", \
      "click_event":{"action":"run_command","command":"/function looping_void:internal/config/add_height_overworld {value:10}"}, \
      "hover_event":{"action":"show_text","value":{"text":"Raise overworld return height by 10","color":"green"}} \
    } \
  ]

  # Nether return height
  tellraw @s [ \
    {"text":" - ","color":"white"}, \
    {"text":"Nether return Y     - ","color":"gray"}, \
    { \
      "text":"[-10]", \
      "color":"red", \
      "click_event":{"action":"run_command","command":"/function looping_void:internal/config/remove_height_nether {value:10}"}, \
      "hover_event":{"action":"show_text","value":{"text":"Lower nether return height by 10","color":"red"}} \
    }, \
    {"text":" ","color":"white"}, \
    { \
      "text":"[-5]", \
      "color":"red", \
      "click_event":{"action":"run_command","command":"/function looping_void:internal/config/remove_height_nether {value:5}"}, \
      "hover_event":{"action":"show_text","value":{"text":"Lower nether return height by 5","color":"red"}} \
    }, \
    {"text":" ","color":"white"}, \
    { \
      "text":"[-1]", \
      "color":"red", \
      "click_event":{"action":"run_command","command":"/function looping_void:internal/config/remove_height_nether {value:1}"}, \
      "hover_event":{"action":"show_text","value":{"text":"Lower nether return height by 1","color":"red"}} \
    }, \
    {"text":"  [","color":"yellow"}, \
    {"score":{"name":"#fallingHeightNether","objective":"lv_cfg"},"color":"yellow"}, \
    {"text":"]  ","color":"yellow"}, \
    { \
      "text":"[+1]", \
      "color":"green", \
      "click_event":{"action":"run_command","command":"/function looping_void:internal/config/add_height_nether {value:1}"}, \
      "hover_event":{"action":"show_text","value":{"text":"Raise nether return height by 1","color":"green"}} \
    }, \
    {"text":" ","color":"white"}, \
    { \
      "text":"[+5]", \
      "color":"green", \
      "click_event":{"action":"run_command","command":"/function looping_void:internal/config/add_height_nether {value:5}"}, \
      "hover_event":{"action":"show_text","value":{"text":"Raise nether return height by 5","color":"green"}} \
    }, \
    {"text":" ","color":"white"}, \
    { \
      "text":"[+10]", \
      "color":"green", \
      "click_event":{"action":"run_command","command":"/function looping_void:internal/config/add_height_nether {value:10}"}, \
      "hover_event":{"action":"show_text","value":{"text":"Raise nether return height by 10","color":"green"}} \
    } \
  ]

  # End return height
  tellraw @s [ \
    {"text":" - ","color":"white"}, \
    {"text":"End return Y         - ","color":"gray"}, \
    { \
      "text":"[-10]", \
      "color":"red", \
      "click_event":{"action":"run_command","command":"/function looping_void:internal/config/remove_height_end {value:10}"}, \
      "hover_event":{"action":"show_text","value":{"text":"Lower end return height by 10","color":"red"}} \
    }, \
    {"text":" ","color":"white"}, \
    { \
      "text":"[-5]", \
      "color":"red", \
      "click_event":{"action":"run_command","command":"/function looping_void:internal/config/remove_height_end {value:5}"}, \
      "hover_event":{"action":"show_text","value":{"text":"Lower end return height by 5","color":"red"}} \
    }, \
    {"text":" ","color":"white"}, \
    { \
      "text":"[-1]", \
      "color":"red", \
      "click_event":{"action":"run_command","command":"/function looping_void:internal/config/remove_height_end {value:1}"}, \
      "hover_event":{"action":"show_text","value":{"text":"Lower end return height by 1","color":"red"}} \
    }, \
    {"text":"  [","color":"yellow"}, \
    {"score":{"name":"#fallingHeightEnd","objective":"lv_cfg"},"color":"yellow"}, \
    {"text":"]  ","color":"yellow"}, \
    { \
      "text":"[+1]", \
      "color":"green", \
      "click_event":{"action":"run_command","command":"/function looping_void:internal/config/add_height_end {value:1}"}, \
      "hover_event":{"action":"show_text","value":{"text":"Raise end return height by 1","color":"green"}} \
    }, \
    {"text":" ","color":"white"}, \
    { \
      "text":"[+5]", \
      "color":"green", \
      "click_event":{"action":"run_command","command":"/function looping_void:internal/config/add_height_end {value:5}"}, \
      "hover_event":{"action":"show_text","value":{"text":"Raise end return height by 5","color":"green"}} \
    }, \
    {"text":" ","color":"white"}, \
    { \
      "text":"[+10]", \
      "color":"green", \
      "click_event":{"action":"run_command","command":"/function looping_void:internal/config/add_height_end {value:10}"}, \
      "hover_event":{"action":"show_text","value":{"text":"Raise end return height by 10","color":"green"}} \
    } \
  ]
