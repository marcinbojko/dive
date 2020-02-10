# Dive

## Description

A tool for exploring a docker image, layer contents, and discovering ways to shrink your Docker image size - [https://github.com/wagoodman/dive](https://github.com/wagoodman/dive)

## Features

* Install and uninstall via Chocolatey
* Supports 64-bit version

## Changelog

### 2020-02-10 Build 0.9.2

* version 0.9.2
* 64-bit version [https://www.virustotal.com/gui/file/4e8e48263077f94fccfb1f1c385a95640ef3c7a48fd8ca41cc7e5889ba82da28/detection](https://www.virustotal.com/gui/file/4e8e48263077f94fccfb1f1c385a95640ef3c7a48fd8ca41cc7e5889ba82da28/detection)

### 2019-11-11 Build 0.9.1

* version 0.9.1
* 64-bit version [https://www.virustotal.com/gui/file/33554caf4418b69b22366db4d8214b6c4be3d8944121e9839a0bc5190980c920/detection](https://www.virustotal.com/gui/file/33554caf4418b69b22366db4d8214b6c4be3d8944121e9839a0bc5190980c920/detection)

### 2019-11-05 Build 0.9.0

* version 0.9.0
* 64-bit version [https://www.virustotal.com/gui/file/3f4ffa3d4ca32bcea0e3aaa568bf1c6aef119672902f9e8b3984d7eb07085d64/detection](https://www.virustotal.com/gui/file/3f4ffa3d4ca32bcea0e3aaa568bf1c6aef119672902f9e8b3984d7eb07085d64/detection)

### 2019-09-07 Build 0.8.1

* version 0.8.1
* 64-bit version [https://www.virustotal.com/gui/file/98bf52df6d06901a3f5e11538957581c4e26de6e28ddbdf129c19194071c29c2/detection](https://www.virustotal.com/gui/file/98bf52df6d06901a3f5e11538957581c4e26de6e28ddbdf129c19194071c29c2/detection)

### 2019-09-03 Build 0.8.0

* version 0.8.0
* 64-bit version [https://www.virustotal.com/gui/file/c17991d1af68bb2d2d74071cc03146be8d0a3454fdafd2562f1551111650dc61/detection](https://www.virustotal.com/gui/file/c17991d1af68bb2d2d74071cc03146be8d0a3454fdafd2562f1551111650dc61/detection)

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
