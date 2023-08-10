$ErrorActionPreference = 'Stop';

$packageName        = 'dive'
$version            = '0.11.0'
$url64              = "https://github.com/wagoodman/dive/releases/download/v"+$version+"/dive_"+$version+"_windows_amd64.zip"
$checksum64         = '6f8680c8d906cbd7ef4df3ec7cea90eece95bec45083b8ba6ea1d8a50d645667'
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

