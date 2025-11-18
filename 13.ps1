# URL de l'API pour un pays spécifique
$apiUrl = "https://restcountries.com/v3.1/name/france"

# Appel de l'API avec Invoke-RestMethod
$response = Invoke-RestMethod -Uri $apiUrl -Method Get

# Afficher le résultat brut
$response

# Exemple : afficher le nom officiel et la capitale
$response[0].name.official
$response[0].capital
