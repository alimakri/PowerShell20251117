Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Variables globales
$global:PointsM = 0
$global:PointsJ = 0

function f1 {
    param([int]$joueur)

    $machine = Get-Random -Minimum 1 -Maximum 4

    if ($joueur -eq $machine) {
        # Égalité : rien ne change
    }
    elseif (($joueur -eq 1 -and $machine -eq 3) -or 
            ($joueur -eq 2 -and $machine -eq 1) -or 
            ($joueur -eq 3 -and $machine -eq 2)) {
        $global:PointsJ++
    }
    else {
        $global:PointsM++
    }

    $LblPointsM.Text = $global:PointsM
    $LblPointsJ.Text = $global:PointsJ
    $LblChoixM.Text  = switch ($machine) {
        1 {"Pierre"}
        2 {"Feuille"}
        3 {"Ciseau"}
    }
}

# Créer la fenêtre
$form = New-Object System.Windows.Forms.Form
$form.Text = "Chifoumi"
$form.Size = New-Object System.Drawing.Size(600,400)
$form.StartPosition = "CenterScreen"

# Titre
$titre = New-Object System.Windows.Forms.Label
$titre.Text = "Que le meilleur gagne !"
$titre.AutoSize = $true
$titre.Location = New-Object System.Drawing.Point(120,30)
$titre.ForeColor = [System.Drawing.Color]::Blue
$form.Controls.Add($titre)

# Boutons
$btnPierre = New-Object System.Windows.Forms.Button
$btnPierre.Text = "Pierre"
$btnPierre.Size = New-Object System.Drawing.Size(100,40)
$btnPierre.Location = New-Object System.Drawing.Point(100,100)
$btnPierre.Add_Click({ f1 1 })
$form.Controls.Add($btnPierre)

$btnFeuille = New-Object System.Windows.Forms.Button
$btnFeuille.Text = "Feuille"
$btnFeuille.Size = New-Object System.Drawing.Size(100,40)
$btnFeuille.Location = New-Object System.Drawing.Point(100,150)
$btnFeuille.Add_Click({ f1 2 })
$form.Controls.Add($btnFeuille)

$btnCiseau = New-Object System.Windows.Forms.Button
$btnCiseau.Text = "Ciseau"
$btnCiseau.Size = New-Object System.Drawing.Size(100,40)
$btnCiseau.Location = New-Object System.Drawing.Point(100,200)
$btnCiseau.Add_Click({ f1 3 })
$form.Controls.Add($btnCiseau)

# Labels
$LblPointsJ = New-Object System.Windows.Forms.Label
$LblPointsJ.Text = "0"
$LblPointsJ.AutoSize = $true
$LblPointsJ.Location = New-Object System.Drawing.Point(250,200)
$LblPointsJ.ForeColor = [System.Drawing.Color]::Blue
$form.Controls.Add($LblPointsJ)

$LblPointsM = New-Object System.Windows.Forms.Label
$LblPointsM.Text = "0"
$LblPointsM.AutoSize = $true
$LblPointsM.Location = New-Object System.Drawing.Point(300,200)
$LblPointsM.ForeColor = [System.Drawing.Color]::Blue
$form.Controls.Add($LblPointsM)

$LblChoixM = New-Object System.Windows.Forms.Label
$LblChoixM.Text = "Choix machine"
$LblChoixM.AutoSize = $true
$LblChoixM.Location = New-Object System.Drawing.Point(400,200)
$LblChoixM.ForeColor = [System.Drawing.Color]::Blue
$form.Controls.Add($LblChoixM)

# Afficher la fenêtre
$form.ShowDialog()
