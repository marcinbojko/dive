# Dive

## Description

A tool for exploring a docker image, layer contents, and discovering ways to shrink your Docker image size - [https://github.com/wagoodman/dive](https://github.com/wagoodman/dive)

## Features

* Install and uninstall via Chocolatey
* Supports 64-bit version

## Changelog

### 2019-05-16 Build 0.7.2

* version 0.7.2
* 64-bit version - [https://www.virustotal.com/#/file/16388360124bdbd55d67cf8fe129b93aa2ae7d220c9fd986cb5c655cb42d3dc6/detection](https://www.virustotal.com/#/file/16388360124bdbd55d67cf8fe129b93aa2ae7d220c9fd986cb5c655cb42d3dc6/detection)

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
