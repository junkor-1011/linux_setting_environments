# workaround for WSLg

## socket mount error

to fix: exec [link_sockets](./link_sockets.sh)

(note)

problem of missing `wayland-0` socket:

- [Cannot use GUI apps/tools as Wayland socket doesn't exist in `XDG_RUNTIME_DIR`](https://github.com/microsoft/WSL/issues/11261)

problem of missing `/tmp/.X11-unix/X0` socket:

- [Unable to start X server in WSL2](https://github.com/microsoft/wslg/issues/1172)
- [WSL2で dbus と WSLg が使えなかったのをどうにかする](https://blog.hinaloe.net/2024/01/24/wsl2-dbus-wslg/)
