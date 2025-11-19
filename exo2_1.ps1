# Etape 1 : créer un fichier indiquant nom du pc + date de démarrage
$infos = [PSCustomObject]@{
    Date= Get-Date 
    Pc = $env:COMPUTERNAME
    }

# Etape 2 : poser le fichier dans un dossier du serveur
$chemin = "\\E3S309Z\partage\$($env:COMPUTERNAME).csv"
$infos | Export-Csv -Path $chemin -NoTypeInformation -Append