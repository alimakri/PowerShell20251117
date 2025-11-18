$CountryCode = "sa"
# Construire l'URL de l'API avec le code du pays
$apiUrl = "https://restcountries.com/v3.1/alpha/$CountryCode"

    # Appel de l'API
    $response = Invoke-RestMethod -Uri $apiUrl -Method Get

    # Vérifier si une capitale est présente
    if ($null -ne $response.capital) {
        Write-Output "Capitale(s) du pays $($response.name.common) : $($response.capital -join ', ')"
    }
    else {
        Write-Output "Aucune capitale trouvée pour le code $CountryCode."
    }
