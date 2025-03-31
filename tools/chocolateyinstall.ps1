$ErrorActionPreference = 'Stop';

$packageName        = 'dive'
$version            = '0.13.1'
$url64              = "https://github.com/wagoodman/dive/releases/download/v${version}/dive_${version}_windows_amd64.zip"
$checksum64         = '3e764ff28c7b89f4da679deac80483249fbbae3a1d512c103d54609eec09086a'
$killexec           = 1
$killexecprocess    = "dive*"

$packageArgs = @{
  packageName   = $packageName
  url64bit      = $url64
  UnzipLocation = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksumType64= 'sha256'
  checksum64    = $checksum64
}

# Should we kill some exec ? If package is open we cannot update
if ($killexec) {
  try {
    Write-Output "Killing all instances of: "$killexecprocess
    Stop-Process -processname $killexecprocess -force }
  catch {
    Write-Error "Failed to kill process: "$killexecprocess
  }
}
Start-Sleep -s 3

Install-ChocolateyZipPackage @packageArgs

