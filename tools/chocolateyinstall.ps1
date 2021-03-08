$ErrorActionPreference = 'Stop';

$packageName        = 'dive'
<<<<<<< Updated upstream
$version            = '0.9.2'
$url64              = "https://github.com/wagoodman/dive/releases/download/v"+$version+"/dive_"+$version+"_windows_amd64.zip"
$checksum64         = "4e8e48263077f94fccfb1f1c385a95640ef3c7a48fd8ca41cc7e5889ba82da28"
=======
$version            = '0.10.0'
$url64              = "https://github.com/wagoodman/dive/releases/download/v"+$version+"/dive_"+$version+"_windows_amd64.zip"
$checksum64         = "e88cf463b48d9edc22f71b63d43f076826f32f6777ac9a8d288dd3dd8f0599e3"
>>>>>>> Stashed changes
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

