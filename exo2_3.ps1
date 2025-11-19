Clear-Host

# Etape 1 : récupérer la liste des fichiers dans le dossier partage
$liste = @()
Get-ChildItem -Path "\\E3S309Z\partage" -File | Select-Object -ExpandProperty Name | ForEach-Object {$liste += Import-Csv -path "\\E3S309Z\partage\$_"}

$listeAlert = $liste | Where-Object {[datetime]$_.Date -lt (Get-Date).Date}

$listeAlert
