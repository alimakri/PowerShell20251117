# Génère un document HTML coloré des services Windows
$services = Get-Service

# Construit les lignes HTML avec une classe selon l'état
$rows = $services | ForEach-Object {
    $class = if ($_.Status -eq "Running") { "running" }
             elseif ($_.Status -eq "Stopped") { "stopped" }
             else { "other" }

    "<tr class=""$class"">
        <td>$($_.Name)</td>
        <td>$($_.DisplayName)</td>
        <td>$($_.Status)</td>
    </tr>"
}

# Modèle HTML avec styles
$html = @"
<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="utf-8">
<title>Services Windows</title>
<style>
    body { font-family: Segoe UI, Arial, sans-serif; margin: 24px; background: #fafafa; color: #222; }
    h1 { font-size: 20px; margin-bottom: 12px; }
    table { border-collapse: collapse; width: 100%; background: white; }
    th, td { padding: 8px 10px; border-bottom: 1px solid #e5e5e5; text-align: left; }
    th { background: #f0f3f7; font-weight: 600; }
    tr.running  { background: #eaffea; color: #1a7f1a; }   /* vert doux */
    tr.stopped  { background: #ffecec; color: #a30000; }   /* rouge doux */
    tr.other    { background: #fff9e6; color: #8a6d00; }   /* jaune doux */
    .legend { margin: 12px 0 20px; font-size: 13px; }
    .badge { display: inline-block; padding: 3px 8px; border-radius: 10px; margin-right: 8px; }
    .badge.running { background: #eaffea; color: #1a7f1a; border: 1px solid #cdeccd; }
    .badge.stopped { background: #ffecec; color: #a30000; border: 1px solid #f5c2c2; }
    .badge.other   { background: #fff9e6; color: #8a6d00; border: 1px solid #f3e1a6; }
</style>
</head>
<body>
<h1>Services Windows</h1>
<div class="legend">
    <span class="badge running">Running</span>
    <span class="badge stopped">Stopped</span>
    <span class="badge other">Autres états</span>
</div>
<table>
    <thead>
        <tr>
            <th>Nom</th>
            <th>DisplayName</th>
            <th>Status</th>
        </tr>
    </thead>
    <tbody>
        <!--ROWS-->
    </tbody>
</table>
</body>
</html>
"@

# Insère les lignes dans le HTML
$html = $html.Replace("<!--ROWS-->", ($rows -join "`n"))

# Écrit le fichier
$html | Set-Content -Path "D:\powershell_20251117\services.html" -Encoding UTF8

Write-Host "Document généré : $path" -ForegroundColor Green
