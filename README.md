# Dive

![Chocolatey](https://img.shields.io/badge/Chocolatey-orange)
![Windows2016](https://img.shields.io/badge/Windows-2016-blue)
![Windows2019](https://img.shields.io/badge/Windows-2019-blue)
![Windows2022](https://img.shields.io/badge/Windows-2022-blue)
![Windows10](https://img.shields.io/badge/Windows-10-lightblue)
![Windows11](https://img.shields.io/badge/Windows-11-lightblue)

[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/marcinbojko)

Consider buying me a coffee if you like my work. All donations are appreciated. All donations will be used to pay for pipeline running costs

## Description

A tool for exploring a docker image, layer contents, and discovering ways to shrink your Docker image size - [https://github.com/wagoodman/dive](https://github.com/wagoodman/dive)

## Features

- Install and uninstall via Chocolatey
- Supports 64-bit version

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
