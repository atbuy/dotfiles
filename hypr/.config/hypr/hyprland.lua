------------------
---- MONITORS ----
------------------

hl.monitor({
  output = "",
  mode = "preferred",
  position = "auto",
  scale = "auto",
})

hl.monitor({
  output = "HDMI-A-1",
  mode = "1920x1080@60",
  position = "3440x0",
  scale = 1,
})

hl.monitor({
  output = "DP-2",
  mode = "3440x1440@180",
  position = "0x0",
  scale = 1,
})

hl.monitor({
  output = "DP-1",
  mode = "2560x1440@75",
  position = "-1440x0",
  scale = 1,
  transform = 1,
})


---------------------
---- MY PROGRAMS ----
---------------------

local terminal = "ghostty"
local fileManager = "nautilus"
local menu = "rofi -show combi -modes combi -combi-modes 'window,drun,run'"


-------------------
---- AUTOSTART ----
-------------------

-- exec-once is replaced by the hyprland.start event in Lua.
hl.on("hyprland.start", function()
  hl.exec_cmd("waybar --config ~/.config/waybar/config.jsonc")
  hl.exec_cmd("waybar --config ~/.config/waybar/config.top.jsonc")
  hl.exec_cmd('swaybg --output HDMI-A-1 --image ~/.config/backgrounds/right-background.jpg --mode "stretch"')
  hl.exec_cmd('swaybg --output DP-2 --image ~/.config/backgrounds/center-background.jpg --mode "fit"')
  hl.exec_cmd('swaybg --output DP-1 --image ~/.config/backgrounds/left-background.jpg --mode "fit"')
  hl.exec_cmd("streamdeck")
  hl.exec_cmd("hyprctl dispatch workspace 1")
  hl.exec_cmd("mako")
  hl.exec_cmd("~/.config/hypr/scripts/low_battery.sh")

  -- Fix fonts for GTK
  hl.exec_cmd("gsettings set org.gnome.desktop.interface font-name 'Noto Sans 11'")
  hl.exec_cmd("gsettings set org.gnome.desktop.interface document-font-name 'Noto Sans 12'")
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- Keyboard layouts / IBus
hl.env("GTK_IM_MODULE", "ibus")
hl.env("QT_IM_MODULE", "ibus")
hl.env("XMODIFIERS", "@im=ibus")


-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 10,
    border_size = 2,

    col = {
      active_border = {
        colors = { "rgba(b777f2ff)", "rgba(643dbfff)" },
        angle = 45,
      },
      inactive_border = "rgba(595959aa)",
    },

    resize_on_border = false,
    allow_tearing = false,
    layout = "dwindle",
  },

  decoration = {
    rounding = 10,

    active_opacity = 1.0,
    inactive_opacity = 1.0,

    shadow = {
      enabled = true,
      range = 4,
      render_power = 3,
      color = 0xee1a1a1a,
    },

    blur = {
      enabled = true,
      size = 1,
      passes = 3,
      vibrancy = 0.1696,
    },
  },

  animations = {
    enabled = true,
  },
})


---------------------
---- ANIMATIONS -----
---------------------

hl.curve("easeOutQuint", {
  type = "bezier",
  points = { { 0.23, 1 }, { 0.32, 1 } },
})

hl.curve("easeInOutCubic", {
  type = "bezier",
  points = { { 0.65, 0.05 }, { 0.36, 1 } },
})

hl.curve("linear", {
  type = "bezier",
  points = { { 0, 0 }, { 1, 1 } },
})

hl.curve("almostLinear", {
  type = "bezier",
  points = { { 0.5, 0.5 }, { 0.75, 1.0 } },
})

hl.curve("quick", {
  type = "bezier",
  points = { { 0.15, 0 }, { 0.1, 1 } },
})

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })


--------------------------
---- WORKSPACE RULES ----
--------------------------

hl.workspace_rule({ workspace = "1", monitor = "DP-2" })
hl.workspace_rule({ workspace = "2", monitor = "DP-2" })
hl.workspace_rule({ workspace = "3", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "4", monitor = "DP-1" })


----------------
---- DWINDLE ---
----------------

hl.config({
  dwindle = {
    preserve_split = true,
  },
})


----------------
---- MASTER ----
----------------

hl.config({
  master = {
    new_status = "master",
  },
})


--------------
---- MISC ----
--------------

hl.config({
  misc = {
    force_default_wallpaper = 1,
    disable_hyprland_logo = true,
  },
})


---------------
---- INPUT ----
---------------

hl.config({
  input = {
    kb_layout = "us,gr",
    kb_variant = "",
    kb_model = "",
    kb_options = "grp:win_space_toggle",
    kb_rules = "",

    follow_mouse = 1,
    sensitivity = 0,
    accel_profile = "flat",

    touchpad = {
      natural_scroll = false,
    },
  },

  gestures = {
    -- Preserve the old `workspace_swipe_invert = false`.
    workspace_swipe_invert = false,
  },
})


-- The Lua gesture API replaces the old workspace swipe binding.
hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace",
})


------------------------
---- PER-DEVICE INPUT --
------------------------

hl.device({
  name = "epic-mouse-v1",
  sensitivity = -0.5,
})


---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "ALT"

-- Terminal
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))

-- Window management
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + ESCAPE", hl.dsp.exit())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + E", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + K", hl.dsp.layout("swapsplit"))

-- Screenshots
hl.bind("CONTROL + F12", hl.dsp.exec_cmd('grim -g "$(slurp -d)" - | wl-copy'))
hl.bind("CONTROL + F11", hl.dsp.exec_cmd("XDG_CURRENT_DESKTOP=sway flameshot gui"))

-- Brightness
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s +10%"))

-- Lock screen
hl.bind(mainMod .. " + SHIFT + BACKSPACE", hl.dsp.exec_cmd("hyprlock"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Move window with mainMod + shift + arrow keys
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))

-- Switch workspaces and move windows to workspaces.
for i = 1, 10 do
  local key = i % 10

  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({
    workspace = i,
    follow = false,
  }))
end

-- Special workspace
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({
  workspace = "special:magic",
  follow = false,
}))

-- Scroll through existing workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Volume and microphone
hl.bind(
  "XF86AudioRaiseVolume",
  hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%"),
  { locked = true, repeating = true }
)

hl.bind(
  "XF86AudioLowerVolume",
  hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"),
  { locked = true, repeating = true }
)

hl.bind(
  "XF86AudioMute",
  hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"),
  { locked = true, repeating = true }
)

hl.bind(
  "XF86AudioMicMute",
  hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle"),
  { locked = true, repeating = true }
)

-- Multimedia
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- Ignore maximize requests from apps.
hl.window_rule({
  name = "suppress-maximize-events",
  match = {
    class = ".*",
  },
  suppress_event = "maximize",
})

-- Fix some dragging issues with XWayland.
hl.window_rule({
  name = "fix-xwayland-drags",
  match = {
    class = "^$",
    title = "^$",
    xwayland = true,
    float = true,
    fullscreen = false,
    pin = false,
  },
})

-- Configure Flameshot to work with all screens.
hl.window_rule({
  name = "flameshot-multi-display-fix",
  match = {
    class = "^(flameshot)$",
  },
  animation = "fade",
  rounding = 0,
  border_size = 0,
  fullscreen_state = "0 0",
  float = true,
  pin = true,
  monitor = "DP-1",
  move = "0 0",
  size = "6800 2560",
})

-- Used by xdg-desktop-portal-hyprland for screen sharing.
hl.on("hyprland.start", function()
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
end)
