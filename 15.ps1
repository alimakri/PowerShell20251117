# URL de l'API pour récupérer tous les pays
$apiUrl = "https://restcountries.com/v3.1/all"

# Appel de l'API
$response = Invoke-RestMethod -Uri $apiUrl -Method Get

# Sélectionner uniquement le nom du pays et sa capitale
$response | Select-Object @{Name="Pays";Expression={$_.name.common}}, @{Name="Capitale";Expression={($_.capital -join ', ')}}
