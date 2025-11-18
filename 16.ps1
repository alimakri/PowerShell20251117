# URL de l'API
$apiUrl = "https://jsonplaceholder.typicode.com/posts"

# Corps de la requête (objet PowerShell converti en JSON)
$body = @{
    title = "Mon premier post"
    body  = "Ceci est un exemple d'appel POST en PowerShell"
    userId = 123
} | ConvertTo-Json

# En-têtes HTTP
$headers = @{
    "Content-Type" = "application/json"
}

# Appel POST
$response = Invoke-RestMethod -Uri $apiUrl -Method Post -Headers $headers -Body $body

# Afficher la réponse
$response
