$ErrorActionPreference = 'Stop';

$packageName        = 'dive'
$version            = '0.9.1'
$url64              = "https://github.com/wagoodman/dive/releases/download/v"+$version+"/dive_"+$version+"_windows_amd64.zip"
$checksum64         = "33554caf4418b69b22366db4d8214b6c4be3d8944121e9839a0bc5190980c920"
$killexec           = 1
$killexecprocess    = "dive*"

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'msi'
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
  catch {}
}
Start-Sleep -s 3

Install-ChocolateyZipPackage @packageArgs
