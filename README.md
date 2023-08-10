# Dive

## Description

A tool for exploring a docker image, layer contents, and discovering ways to shrink your Docker image size - [https://github.com/wagoodman/dive](https://github.com/wagoodman/dive)

## Features

* Install and uninstall via Chocolatey
* Supports 64-bit version

## Usage

### Direct

```cmd
choco install dive -y
```

### YAML (Foreman, puppetlabs/chocolatey module)

```yaml
dive:
  ensure: latest
  provider: chocolatey
```

or

```yaml
dive:
  ensure: latest
```
