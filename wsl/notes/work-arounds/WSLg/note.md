# workaround for WSLg

## socket mount error

to fix: exec [link_sockets](./link_sockets.sh)

```bash
#!/bin/bash
set -eux

if [ ! -S /tmp/.X11-unix/X0 ]; then
    ln -s /mnt/wslg/.X11-unix/X0 /tmp/.X11-unix/
fi

if [ ! -S "$XDG_RUNTIME_DIR/wayland-0" ]; then
    ln -s /mnt/wslg/runtime-dir/wayland-0* "$XDG_RUNTIME_DIR/"
fi
```

(note)

problem of missing `wayland-0` socket:

- [Cannot use GUI apps/tools as Wayland socket doesn't exist in `XDG_RUNTIME_DIR`](https://github.com/microsoft/WSL/issues/11261)

problem of missing `/tmp/.X11-unix/X0` socket:

- [Unable to start X server in WSL2](https://github.com/microsoft/wslg/issues/1172)
- [WSL2で dbus と WSLg が使えなかったのをどうにかする](https://blog.hinaloe.net/2024/01/24/wsl2-dbus-wslg/)

### with systemd

exec `link_sockets.sh` automatically.

- create systemctl service

`~/.config/systemd/user/wslg_workarounds.service`

```systemd
[Unit]
Description=enable x11 & wayland
After=local-fs.target

[Service]
Type=simple
ExecStart=/home/<EDIT: username>/bin/link_sockets.sh
Restart=no

[Install]
WantedBy=default.target
```

- enable & start local service

```sh
systemctl enable wslg_workarounds.service --user
systemctl start wslg_workarounds.service --user
```

Reference:

- [学生たちの技術ブログ - Systemdで起動時にスクリプトを実行する](https://students-tech.blog/post/systemd-startup.html)
- [Qiita - systemdを用いたプログラムの自動起動](https://qiita.com/tkato/items/6a227e7c2c2bde19521c)
