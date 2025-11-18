# Récupérer toutes les adresses IP via WMI
Get-WmiObject Win32_NetworkAdapterConfiguration | Where-Object { $_.IPEnabled -eq $true } | Select-Object Description, IPAddress


# Récupérer tous les ordinateurs de l'AD
$computers = Get-ADComputer -Filter * -Property Name | Select-Object -ExpandProperty Name
