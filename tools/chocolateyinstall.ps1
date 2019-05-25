$ErrorActionPreference = 'Stop';

$packageName        = 'dive'
$version            = '0.7.2'
$url64              = "https://github.com/wagoodman/dive/releases/download/v"+$version+"/dive_"+$version+"_windows_amd64.zip"
$checksum64         = "16388360124bdbd55d67cf8fe129b93aa2ae7d220c9fd986cb5c655cb42d3dc6"

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'msi'
  url64bit      = $url64
  UnzipLocation = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksumType64= 'sha256'
  checksum64    = $checksum64
}

Install-ChocolateyZipPackage @packageArgs
