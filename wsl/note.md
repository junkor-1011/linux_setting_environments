# wsl create & import image

- export
  - [reference](https://docs.docker.com/engine/reference/commandline/export/)

```sh
# start container
docker run --name <container-name> <image-name>:<tag>

# export
docker export -o /mnt/d/path/to/<wsl-image-name>.tar <container-name>
```

- import
  - [reference](https://learn.microsoft.com/ja-jp/windows/wsl/use-custom-distro)

```powershell
wsl.exe --import <DistroName> D:\Path\to\<DistroDirName> D:\Path\to\<wsl-image-name>.tar
```
