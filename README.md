# docker-klotho

---

## Overview
This repository contains source for the [klothoplatform/klotho](https://hub.docker.com/r/klothoplatform/klotho) Klotho quickstart Docker image.
This image includes the Klotho compiler and its dependencies and is the fastest way to get started using Klotho.

## Get Klotho

Pull the latest version of Klotho by running the following shell command:

```shell
docker pull klothoplatform/klotho:latest
```

To download a specific version of Klotho, replace the `latest` tag with the Klotho version you need (e.g. `v1.0.0`).
 
## Shell Aliases

Use these shell aliases to easily invoke Klotho or its dependencies in your terminal.

Run the commands below to add these aliases to your shell environment.

```shell
alias docker-klotho='docker run --platform linux/amd64 --rm -it -w /usr/src/project -v ${HOME}/.klotho:/root/.klotho -v $(pwd):/usr/src/project klothoplatform/klotho:latest klotho'
alias docker-pulumi='docker run --platform linux/amd64 --rm -it -w /usr/src/project -v ${HOME}/.pulumi:/root/.pulumi -v ${HOME}/.aws:/root/.aws -v $(pwd):/usr/src/project -v /var/run/docker.sock:/var/run/docker.sock klothoplatform/klotho:latest pulumi'
alias docker-npm='docker run --platform linux/amd64 --rm -it -w /usr/src/project -v ${HOME}/.npm:/root/.npm -v $(pwd):/usr/src/project klothoplatform/klotho:latest npm'
alias docker-tsc='docker run --platform linux/amd64 --rm -it -w /usr/src/project -v $(pwd):/usr/src/project klothoplatform/klotho:latest npx tsc'
alias docker-aws='docker run --platform linux/amd64 --rm -it -w /usr/src/project -v $(pwd):/usr/src/project -v ${HOME}/.aws:/root/.aws klothoplatform/klotho:latest aws' 
```
To make these aliases persistent, add them to your shell profile (e.g. `.bashrc`, `.profile`, etc.).

After adding the aliases to your environment, you can run
