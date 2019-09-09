
$UserQuery = (Get-WmiObject -Class Win32_Process -Filter 'Name="explorer.exe"').GetOwner().User
$Computer = Get-WMIObject -Class win32_computersystem | Select-Object -Property *
$OS = Get-WMIObject -Class win32_operatingsystem | Select-Object -Property *
$BIOS = Get-WMIObject -Class win32_bios | Select-Object -Property *

echo "`$UserQuery: "$UserQuery`n
echo "`$Computer: " $Computer.Name,$Computer.Manufacturer,$Computer.Model,$BIOS.SerialNumber`n
echo "`$OS: "       $OS.Caption,$OS.Version`n
echo "`$BIOS: "     $BIOS.Name,$BIOS.SMBIOSBIOSVersion

$WMIOutput = [PSCustomObject]@{
    LoggedOnUser    = $UserQuery
    ComputerName    = $Computer.Name;
    Manufacturer    = $Computer.Manufacturer;
    Model           = $Computer.Model;
    SerialNumber    = $BIOS.SerialNumber;
    OSName          = $OS.Caption;
    OSVersion       = $OS.Version;
    InstallDate     = $OS.InstallDate;
    BIOSName        = $BIOS.Name;
    SMBIOSVersion   = $BIOS.SMBIOSBIOSVersion;
    ReleaseDate     = $BIOS.ReleaseDate;
    }

Export-Csv -InputObject $WMIOutput -Path "$PSScriptRoot\WMIPCInfo.csv" -Append -NoTypeInformation