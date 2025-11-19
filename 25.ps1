# Création d'un objet PSCredential avec un SecureString
$username = "MonUtilisateur"
$password = Read-Host "Entrez votre mot de passe" -AsSecureString

$cred = New-Object System.Management.Automation.PSCredential($username, $password)

# Exemple d'utilisation : connexion à un service
Invoke-Command -ComputerName "Serveur01" -Credential $cred -ScriptBlock { Get-Process }
