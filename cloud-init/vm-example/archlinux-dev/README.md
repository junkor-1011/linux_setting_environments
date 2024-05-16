# Note for NoCloud archlinux in VM

(Under Construction...)

target:

- Hyper-V
- KVM
- (e.t.c.)

## execution

```sh
archinstall
```

Or, using configuration file:

```sh
curl -L https://raw.githubusercontent.com/foo/bar/baz/xxx/user-config-sample.json -o user_configuration.json
curl -L https://raw.githubusercontent.com/foo/bar/baz/xxx/user-credentials-sample.json -o user_credentials.json

archinstall -c ./user-config.json
```

### cloud-init

ref: [Cloud-init](https://wiki.archlinux.org/title/cloud-init)

- install `cloud-init`, `cloud-guest-utils` as optional dependencies
- after executing `archinstall`, do below:

```sh
# in installed archlinux

systemctl enable cloud-init
systemctl enable cloud-init-local
systemctl enable cloud-config
systemctl enable cloud-final
```

### behind proxy

before executing `archinstall`, execute below:

```sh
# root@archiso

proxy_url="<username>:<password>@XXX.XXX.XXX.XXX:80" # example

export http_proxy=$proxy_url
export HTTP_PROXY=$proxy_url
export https_proxy=$proxy_url
export HTTPS_PROXY=$proxy_url
export ftp_proxy=$proxy_url
export FTP_PROXY=$proxy_url

# systemctl status -l reflector.service
systemctl stop reflector.service
```

## Reference

- https://wiki.archlinux.jp/index.php/Archinstall
- https://github.com/archlinux/archinstall
- https://github.com/archlinux/archinstall/issues/1852
- https://wiki.archlinux.jp/index.php/Xorg
    - `xorg-server`, `xorg-apps`
    - `xf86-video-fbdev`, `xf86-video-vesa`
- https://gifnksm.hatenablog.jp/entry/2022/07/30/190419
- https://zenn.dev/usagiga/scraps/07cc37e277e54e
- [NoCloud (seed.iso) cloud-init configuration for Amazon Linux 2023 on KVM and VMware](https://docs.aws.amazon.com/linux/al2023/ug/seed-iso.html)
