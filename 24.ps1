# Demande un mot de passe à l'utilisateur sans l'afficher en clair
$securePwd = Read-Host "Entrez votre mot de passe" -AsSecureString

# Vérification du type
$securePwd.GetType().FullName
