# CHIFOUMI
$Pierre = 1
$Feuille = 2
$Ciseau = 3
$PointsM = 0
$PointsJ = 0

while($PointsJ -lt 3 -and $PointsM -lt 3)
{
    Write-Host "Choisissez : `n1. Pierre `n2. Feuille `n3. Ciseau" -ForegroundColor Cyan

    $joueur = Read-Host
    if ($joueur -eq "1" -or $joueur -eq "2" -or $joueur -eq "3")
    {
        $machine = Get-Random -Minimum 1 -Maximum 4
        if($joueur -eq $machine)
        {
            $PointsM = 0
            $PointsJ = 0
        }
        elseif (($joueur -eq 1 -and $machine -eq 3) -or ($joueur -eq 2 -and $machine -eq 1) -or ($joueur -eq 3 -and $machine -eq 2))
        {
            $PointsJ++
        }
        else
        {
            $PointsM++
        }
        Write-Host " Joueur:$joueur - Machine:$machine ($PointsJ / $PointsM)" -ForegroundColor Yellow
    }
    else
    {
        Write-Host "Proposition incorrecte !" -ForegroundColor red
    } 
}
if ($PointsJ -eq 3)
{
    Write-Host "Vous gagnez !" -ForegroundColor Yellow
}
else
{
    Write-Host "Je gagne !" -ForegroundColor Yellow
}