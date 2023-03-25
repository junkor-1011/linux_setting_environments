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
