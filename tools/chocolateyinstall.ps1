$ErrorActionPreference = 'Stop';

$packageName        = 'dive'
$version            = '0.9.0'
$url64              = "https://github.com/wagoodman/dive/releases/download/v"+$version+"/dive_"+$version+"_windows_amd64.zip"
$checksum64         = "3f4ffa3d4ca32bcea0e3aaa568bf1c6aef119672902f9e8b3984d7eb07085d64"
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
    Write-Output "Killing all instances of: "$killexecprocess -nonewline
    Stop-Process -processname $killexecprocess -force }
  catch {}
}
Start-Sleep -s 3

Install-ChocolateyZipPackage @packageArgs
