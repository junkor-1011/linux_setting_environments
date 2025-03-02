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
- [ArchWiki - LXD](https://wiki.archlinux.jp/index.php/LXD#.E3.82.B3.E3.83.B3.E3.83.86.E3.83.8A.E5.86.85.E3.81.A7.E3.82.BD.E3.82.B1.E3.83.83.E3.83.88.E3.82.92.E9.81.A9.E5.88.87.E3.81.AA.E5.A0.B4.E6.89.80.E3.81.AB.E3.83.AA.E3.83.B3.E3.82.AF)

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

- ArchWiki
    - [systemd](https://wiki.archlinux.jp/index.php/Systemd)
    - [systemd/ユーザー](https://wiki.archlinux.jp/index.php/Systemd/%E3%83%A6%E3%83%BC%E3%82%B6%E3%83%BC)
- [学生たちの技術ブログ - Systemdで起動時にスクリプトを実行する](https://students-tech.blog/post/systemd-startup.html)
- [Qiita - systemdを用いたプログラムの自動起動](https://qiita.com/tkato/items/6a227e7c2c2bde19521c)
