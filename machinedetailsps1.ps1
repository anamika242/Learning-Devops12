$path= "C:\temp\ServerDetails.txt"
$output= "Details of the machine name, domain, total physical memory"
Add-Content -path $path -Value $output 
[string]$detail= Get-WmiObject -Class Win32_ComputerSystem | Select-Object Name, Domain, TotalPhysicalMemory 
Add-Content $path $detail
$output= "CPU details: "
Add-Content $path $output
[string]$detail= Get-WmiObject -Class Win32_Processor | Select-Object Name, NumberOfLogicalProcessors
Add-Content $path $detail

$output= "Disk space details: "
Add-Content $path $output
[string]$detail= Get-WmiObject -Class Win32_LogicalDisk | Where-Object { $_.DriveType -eq 3 } | Select-Object DeviceID, VolumeName, Size
Add-Content $path $detail