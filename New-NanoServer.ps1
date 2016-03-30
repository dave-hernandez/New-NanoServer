$isopath = Read-Host "Enter the full path of your Windows Server 2016 Technical Preview ISO"
$srvname = Read-Host "Enter the desired hostname of the server"
$domname = Read-Host "Verify the domain name to join" 

$mntimag = Mount-DiskImage -ImagePath $isopath -PassThru
$isodriv = ($mntimag | Get-Volume).driveletter

Import-Module ("$isodriv" + ":\NanoServer\NanoServerImageGenerator.psm1") -Verbose

New-NanoServerImage -MediaPath ("$isodriv" + ":\") -BasePath .\Base -TargetPath (".\NanoServerVM\" + "$srvname" + "_C.vhdx") -ComputerName $srvname -DomainName $domname -GuestDrivers