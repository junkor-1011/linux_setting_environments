# note for podman

- https://github.com/containers/podman/issues/5114

```sh
sudo rm -rf ~/.local/share/containers/
```

- https://github.com/containers/buildah/issues/3726

```sh
# for `WARN[0000] "/" is not a shared mount`
sudo mount --make-rshared
```

- https://github.com/containers/podman/issues/2788
- https://github.com/moby/moby/issues/41812

```sh
sudo chmod u+s /usr/sbin/newuidmap
sudo chmod u+s /usr/sbin/newgidmap
```
