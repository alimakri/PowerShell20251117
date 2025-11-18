$nombreADeviner = Get-Random -Minimum 1 -Maximum 100
# Write-Host $nombreADeviner -ForegroundColor Red
$proposition = 0
$maxCoup = 7
$nombreCoup = 0
$FinDePartie = $false
$resultat = -3

while(-not $FinDePartie)
{
    Write-Host "faites une proposition:"
    $nombreCoup++
    $propInt = 0
    $proposition = Read-Host 
    if (-not [int]::TryParse($proposition, [ref]$propInt))
    {
        $resultat = -3
    }

    elseif ($nombreCoup -ge $maxCoup)
    {
        $resultat = -2
    }
    elseif ($proposition -lt $nombreADeviner)
    {
        $resultat = -1
    }
    elseif ($proposition -gt $nombreADeviner)
    {
        $resultat = 1
    }
    else
    {
        $resultat = 0
    }


    # if ($resultat -eq -2)
    # {
    #    Write-Host "$nombreCoup. Perdu" 
    #    $FinDePartie = $true
    # }
    # elseif ($resultat -eq -1)
    # {
    #    Write-Host "$nombreCoup. Trop petit" 
    # }
    # elseif ($resultat -eq 1)
    # {
    #    Write-Host "$nombreCoup. Trop grand" 
    # }
    switch ($resultat) {
    -3 {
        Write-Host "Ce n'est pas un nombre"
        break
        }
    -2 {
        Write-Host "$nombreCoup. Perdu"
        $FinDePartie = $true
        break
    }
    -1 {
        Write-Host "$nombreCoup. Trop petit"
        break
    }
     1 {
        Write-Host "$nombreCoup. Trop grand"
        break
    }
}

}