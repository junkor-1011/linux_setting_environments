INITIAL SETUP
=================

## 1. keyboard

### 1-1. CapsLock to Ctrl

- use tweak tools

### 1-2. Keyboard Layout

```bash
# CLI
sudo dpkg-reconfigure keyboard-configuration

# GUI
# Startup Applications Preference
gnome-session-properties

# add command:
setxkbmap -layout jp
```

### 1-3. Keymap

change mozc-setting by using below:

- [keymap_like_macos.txt](./mozc/keymap_like_macos.txt)
