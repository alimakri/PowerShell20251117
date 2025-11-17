Get-Service | Where-Object {$_.Status -eq "Running"} | Sort-Object -Property Name -Descending | Measure-Object
Get-Service | Where-Object {$_.Status -eq "Stopped"} | Sort-Object -Property Name -Descending | Measure-Object

Get-Service | Select-Object -Property Name, Status | gm 

Get-Service | Where-Object {$_.Status -eq "Running"} | Sort-Object -Property Name -Descending
# equivalent
$services = Get-Service
$serviceRunning = $services | Where-Object {$_.Status -eq "Running"} 
$serviceRunningTrie = $serviceRunning | Sort-Object -Property Name -Descending
$serviceStppped = $services | Where-Object {$_.Status -eq "Stopped"} 

# extraction de propriété
Get-Service | Select-Object -ExpandProperty Name | gm

# Intérêt du select
Get-Service | Where-Object {$_.Status -eq "Running"} | Select -Property Name, DisplayName `
            | Export-Csv -Path "D:\powershell_20251117"