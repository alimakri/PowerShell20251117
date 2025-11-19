# Variables
$scriptPath = "C:\Ali\exo2_1.ps1"   # chemin complet vers ton script
$taskName   = "MonScriptAuDemarrage"

# Créer une action qui lance PowerShell avec ton script
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-NoProfile -ExecutionPolicy Bypass -File `"$scriptPath`""

# Déclencheur : au démarrage du PC
$trigger = New-ScheduledTaskTrigger -AtStartup

# Définir l’utilisateur qui exécute la tâche (ici SYSTEM)
$principal = New-ScheduledTaskPrincipal -UserId "SYSTEM" -RunLevel Highest

# Créer la tâche
Register-ScheduledTask -Action $action -Trigger $trigger -Principal $principal -TaskName $taskName -Description "Exécute mon script PowerShell au démarrage"
