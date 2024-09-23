$ErrorActionPreference = 'Stop';

$packageName        = 'dive'
$url64              = "https://github.com/wagoodman/dive/releases/download/v0.12.0/dive_0.12.0_windows_amd64.zip"
$checksum64         = 'b60d750852543e5a4b38c42590e2036aa2a8026cdb14d835090399f5e1312192'
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
  }
}
Start-Sleep -s 3

Install-ChocolateyZipPackage @packageArgs

