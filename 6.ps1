Get-Service | Select -Property Name, DisplayName | Export-Csv -Path "C:\Ali\services.csv" -Delimiter ";"

$services = Import-csv -Path "C:\Ali\services.csv" -Delimiter ";"
