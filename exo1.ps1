# Fermer toutes les instances de Notepad
Get-Process -Name notepad -ErrorAction SilentlyContinue | ForEach-Object {
    $_.CloseMainWindow() | Out-Null
    Start-Sleep -Seconds 1
    if (!$_.HasExited) {
        $_.Kill()
    }
}
