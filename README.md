# Aether Void
A datapack that replaces Minecraft’s default void death with a controlled, configurable recovery system. Instead of instantly dying, players are detected before void death triggers and are teleported to a safe height, either above their last grounded position or above their current X/Z, and then handled by a configurable landing-damage mode.

---

## Features

### Void detection
- Separate enable/disable flags per dimension:  
  - `#triggerOverworld`  
  - `#triggerNether`  
  - `#triggerEnd`
- Detection uses a predicate (`is_in_void`) to avoid false positives.
- Only triggers when player is not already in a void-fall state.

### Return position
- Tracks last grounded location via per-player marker entities.
- Two teleport behaviors:
  - Above last grounded block (`#returnToLastGrounded = 1`)
  - Above current horizontal location (`#returnToLastGrounded = 0`)
- Dimension specific teleport heights:  
  - `#fallingHeightOverworld`  
  - `#fallingHeightNether`  
  - `#fallingHeightEnd`

### Landing damage modes
Aether Void provides explicit landing damage modes, resolved in priority order:

1. **PreventDeath mode** (`#dmPreventDeath`)  
   Leaves player at half a heart. Uses real Health NBT.

2. **Absolute mode** (`#dmAbsolute`)  
   Applies exactly `#dmAbsoluteDamageTaken` damage (via macros). Can kill.

3. **Normal mode** (`#dmNormal`)  
   Allows vanilla (or modded) fall damage untouched.

Priority:  
**PreventDeath > Absolute > Normal**

### Per-player state
- `av_state = 1` while inside a void fall, blocking re-entry.
- `av_pid` assigns each player a stable unique ID for marker ownership.
- State resets automatically on landing or death.

---

## Configuration Menu

Run:

```
/function aether_void:config
```

Includes:

### Dimension toggles  
Simple ON/OFF buttons for:
- Overworld  
- Nether  
- End  

### Teleport mode  
- Toggle `Return to last grounded`.

### Damage mode selector (enum-style)  
Three side-by-side buttons:
- `[PreventDeath]`
- `[Absolute]`
- `[Normal]`

Only one is active at a time.

### Absolute damage value  
Displayed only when `#dmAbsolute = 1`.  
Includes:  
`[-1]   [value]   [+1]`

### Return height settings  
For each dimension:  
`[-10] [-5] [-1]   [value]   [+1] [+5] [+10]`

All via dedicated small functions.

---

## Macro Usage

The pack uses macro-powered commands:

```mcfunction
$tp @s $(x) $(y) $(z)
$damage @s $(amount)
```

Combined with:

```mcfunction
function aether_void:some_function with storage aether_void:coords
```

This allows:
- dynamic teleport heights
- dynamic damage values
- lightweight parameter passing

---

## Internal Structure

```
aether_void/
  data/
    aether_void/
      functions/
        config/...
        internal/...
        begin_void_fall*
        void_fall_tick
        end_void_fall
        sample_ground
        damage_prevent_death
        damage_absolute
        damage_absolute_from_config
        tp_from_storage
    predicates/
      is_in_void.json
    storage/
      coords
      damage
```

---

## Compatibility

- Fully vanilla datapack.
- Multiplayer-safe.
- Does not block vanilla fall damage unless configured.
- Uses `marker` entities (invisible).

---

## Limitations

- Absolute mode can kill players (intentionally).
- PreventDeath only applies to landing damage — external sources can still kill during recovery.
- Return height must be chosen sensibly to avoid teleporting into terrain.

---

## Installation

Place the folder in:

```
<world>/datapacks/
```

Reload:

```
/reload
```

Initialize:

```
/function aether_void:load
```

Open config:

```
/function aether_void:config
```
