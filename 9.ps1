# Créer la fenêtre
$form = New-Object System.Windows.Forms.Form
$form.Text = "Ma première app PowerShell"
$form.Size = New-Object System.Drawing.Size(300,200)
$form.StartPosition = "CenterScreen"

# Créer un bouton
$button = New-Object System.Windows.Forms.Button
$button.Text = "Cliquez-moi"
$button.Size = New-Object System.Drawing.Size(100,40)
$button.Location = New-Object System.Drawing.Point(100,100)

# Créer un label
$label = New-Object System.Windows.Forms.Label
$label.Text = "Bienvenue dans mon app !"
$label.AutoSize = $true
$label.Location = New-Object System.Drawing.Point(80,30)
$label.ForeColor = [System.Drawing.Color]::Orange

# Créer une zone de saisie (TextBox)
$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Size = New-Object System.Drawing.Size(150,20)
$textBox.Location = New-Object System.Drawing.Point(100,60)

# Action quand on clique sur le bouton
$button.Add_Click({
    $label.Text = "Trop petit"
})

# Ajouter le bouton à la fenêtre
$form.Controls.Add($button)
$form.Controls.Add($label)
$form.Controls.Add($textBox)




# Afficher la fenêtre
$form.ShowDialog()
