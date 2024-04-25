# Setup note for HomeBrew

[Official](https://brew.sh/)

- [install/uninstall](https://github.com/homebrew/install)

## Tips

- man

```sh
man brew
```

- uninstall all packages

```sh
brew uninstall --force $(brew list)
```

- cleanup cache

```sh
brew cleanup -s

# clean all cache includes installed formulae
rm -rf $(brew --cache)
```

## Useful Packages

### Language

- [zig](https://ziglang.org/)
    - [formulae](https://formulae.brew.sh/formula/zig)
- [go](https://go.dev/)
    - [formulae](https://formulae.brew.sh/formula/go)

### Security

- [trivy](https://github.com/aquasecurity/trivy)
    - [formulae](https://formulae.brew.sh/formula/trivy)

### AWS

- [awscli](https://aws.amazon.com/cli/)
    - [formulae](https://formulae.brew.sh/formula/awscli)
- [sam-cli](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/install-sam-cli.html)
    - [formulae](https://formulae.brew.sh/formula/aws-sam-cli)

### Utils

- [fzf](https://github.com/junegunn/fzf)
    - [formulae](https://formulae.brew.sh/formula/fzf)
