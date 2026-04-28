# Godot Touch Screen Joystick 🕹️  
*A lightweight and customizable on-screen joystick for Godot 4 projects.*

![Godot](https://img.shields.io/badge/Godot-4.x-blue?logo=godot-engine&logoColor=white)
![License](https://img.shields.io/badge/license-GPL--2.0-orange)
![Platform](https://img.shields.io/badge/platform-Mobile%20%7C%20Desktop-green)
![Language](https://img.shields.io/badge/language-GDScript-yellow)

---

## 📖 Overview

**Godot Touch Screen Joystick** provides a simple and flexible solution for adding virtual joystick controls to your Godot 4 projects.  
It supports **touchscreen** and **mouse** input, making it ideal for **mobile games**, **tablets**, and even **desktop testing**.  

The joystick is highly configurable, emits clear signals for input handling, and can be easily integrated into any Godot UI setup.

---

## ✨ Features

- 🖐️ Works seamlessly with **touch and mouse** input  
- 🎮 **Multi-touch support** — multiple joysticks at once  
- ⚙️ **Customizable radius, sensitivity, and visuals**  
- 🚀 **Lightweight** and easy to integrate  
- 🔊 Emits **signals** for start, move, and release events  
- 🧩 **Demo scene** included for quick testing  
- 🪶 Written purely in **GDScript** — no external dependencies  

---

## 🧩 Installation

1. Download or clone this repository into your Godot project folder:  
   ```bash
   git clone https://github.com/abdulroufsidhu/godot_touch_screen_joystick.git
   ```
2. Copy the `addons/touch_joystick` directory into your project’s `addons/` folder.
3. In Godot, go to  
   **Project → Project Settings → Plugins**  
   and **enable** the “Touch Joystick” plugin.
4. Add the joystick scene (or node) to your `CanvasLayer` or UI layer.

---

## 🚀 Usage

1. Drag the `TouchJoystick` scene into your main scene (usually under a `CanvasLayer`).
2. Connect to its signals in your player or controller script to read joystick input.
3. Use the emitted `Vector2` value to move or rotate your character.

**Example:**

```gdscript
func _ready():
    $TouchJoystick.connect("joystick_moved", self, "_on_joystick_moved")

func _on_joystick_moved(direction: Vector2):
    # direction is normalized (-1..1)
    velocity = direction * speed
```

---

## ⚙️ Configuration

| Property | Description | Default |
|-----------|--------------|----------|
| `radius` | Maximum distance knob can move from center | `100` |
| `dead_zone` | Minimum distance before input starts registering | `0.1` |
| `dynamic_position` | If true, joystick appears where touched | `false` |
| `show_on_touch` | Show joystick only while active | `true` |
| `sensitivity` | Adjusts how far the knob moves per drag distance | `1.0` |

You can customize the joystick’s **base**, **handle**, and **visuals** directly via the Inspector or by enabling *Editable Children*.

---

## 📡 Signals

| Signal | Description |
|--------|--------------|
| `joystick_started(Vector2 position)` | Fired when a touch or drag begins |
| `joystick_moved(Vector2 direction)` | Fired while the joystick is being dragged |
| `joystick_released()` | Fired when touch/mouse is released |

---

## 🧪 Example Scene

The repository includes:
- `example.tscn` — a ready-to-run demo scene  
- `example.gd` — shows how to connect and handle signals  
- Visual preview of joystick movement  

Add the example to your project to quickly see the joystick in action.

---

## 💡 Tips

- Place the joystick on a **CanvasLayer** to ensure it stays above gameplay elements.  
- Enable **Emulate Touch From Mouse** in *Project Settings* for desktop testing.  
- Use multiple joystick instances for **dual-stick controls** (e.g., movement + camera).  
- Implement a **dead zone** to prevent jitter when the joystick is nearly at rest.  
- If dynamic placement is enabled, the joystick will spawn at the touch location.  

---

## 🪪 License

This project is licensed under the **MIT License**.  
You’re free to use, modify, and redistribute it under the same terms.

---

## 🖼️ Preview

[watch demo](https://github.com/abdulroufsidhu/godot_touch_screen_joystick/raw/refs/heads/master/demo_video/Screencast_01_27_2025_01:15:47_PM.webm)
