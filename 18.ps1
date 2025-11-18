# URL de l'API Binance pour le prix du BTC en USDT
$apiUrl = "https://api.binance.com/api/v3/ticker/price?symbol=BTCUSDT"

try {
    # Appel de l'API
    $response = Invoke-RestMethod -Uri $apiUrl -Method Get

    # Afficher le prix
    Write-Output "Prix actuel du Bitcoin (BTC/USDT) : $($response.price) USD"
}
catch {
    Write-Output "Erreur lors de l'appel à l'API Binance : $_"
}
