$global:PointsM = 0
$global:PointsJ = 0

function f1
{
    param([int]$joueur)

    $machine = Get-Random -Minimum 1 -Maximum 4
    if($joueur -eq $machine)
    {
        $global:PointsM = 0
        $global:PointsJ = 0
    }
    elseif (($joueur -eq 1 -and $machine -eq 3) -or ($joueur -eq 2 -and $machine -eq 1) -or ($joueur -eq 3 -and $machine -eq 2))
    {
        $global:PointsJ++
    }
    else
    {
        $global:PointsM++
    }
    $LblPointsM.Text= $global:PointsM
    $LblPointsJ.Text= $global:PointsJ
    $LblChoixM.Text = $machine

}


# Créer la fenêtre
$form = New-Object System.Windows.Forms.Form
$form.Text = "Chifoumi"
$form.Size = New-Object System.Drawing.Size(600,400)
$form.StartPosition = "CenterScreen"

# Créer un label titre
$titre = New-Object System.Windows.Forms.Label
$titre.Text = "Que le meilleur gagne !"
$titre.AutoSize = $true
$titre.Location = New-Object System.Drawing.Point(120,30)
$titre.ForeColor = [System.Drawing.Color]::Blue
$form.Controls.Add($titre)

# Créer bouton Pierre
$btnPierre = New-Object System.Windows.Forms.Button
$btnPierre.Text = "Pierre"
$btnPierre.Size = New-Object System.Drawing.Size(100,40)
$btnPierre.Location = New-Object System.Drawing.Point(100,100)
$form.Controls.Add($btnPierre)

# Créer bouton feuille
$btnFeuille = New-Object System.Windows.Forms.Button
$btnFeuille.Text = "Feuille"
$btnFeuille.Size = New-Object System.Drawing.Size(100,40)
$btnFeuille.Location = New-Object System.Drawing.Point(100,150)
$form.Controls.Add($btnFeuille)

# Créer bouton feuille
$btnCiseau = New-Object System.Windows.Forms.Button
$btnCiseau.Text = "Ciseau"
$btnCiseau.Size = New-Object System.Drawing.Size(100,40)
$btnCiseau.Location = New-Object System.Drawing.Point(100,200)
$form.Controls.Add($btnCiseau)

# Créer un label PointsJ
$LblPointsJ = New-Object System.Windows.Forms.Label
$LblPointsJ.Text = "0"
$LblPointsJ.AutoSize = $true
$LblPointsJ.Location = New-Object System.Drawing.Point(250,200)
$LblPointsJ.ForeColor = [System.Drawing.Color]::Blue
$form.Controls.Add($LblPointsJ)

# Créer un label PointsM
$LblPointsM = New-Object System.Windows.Forms.Label
$LblPointsM.Text = "0"
$LblPointsM.AutoSize = $true
$LblPointsM.Location = New-Object System.Drawing.Point(300,200)
$LblPointsM.ForeColor = [System.Drawing.Color]::Blue
$form.Controls.Add($LblPointsM)

# Créer un label choix Machine
$LblChoixM = New-Object System.Windows.Forms.Label
$LblChoixM.Text = "Choix machine"
$LblChoixM.AutoSize = $true
$LblChoixM.Location = New-Object System.Drawing.Point(400,200)
$LblChoixM.ForeColor = [System.Drawing.Color]::Blue
$form.Controls.Add($LblChoixM)

# Action quand on clique sur le bouton
$btnPierre.Add_Click({ f1 1 })
$btnFeuille.Add_Click({ f1 2 })
$btnCiseau.Add_Click({ f1 3 })


# Afficher la fenêtre
$form.ShowDialog()
