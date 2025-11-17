# Définir l'interface en XAML
$XAML = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        Title="Ma première app WPF"
        Height="200" Width="350"
        WindowStartupLocation="CenterScreen">
    <StackPanel Margin="20">
        <Label Name="MonLabel" Foreground="Orange" FontSize="14" Content="Bienvenue dans mon app !" />
        <TextBox Name="MaZoneTexte" Width="200" Margin="0,10,0,10"/>
        <Button Name="MonBouton" Width="100" Height="30" Content="Valider"/>
    </StackPanel>
</Window>
"@

# Charger le XAML
$reader = New-Object System.Xml.XmlNodeReader ([xml]$XAML)
$form = [Windows.Markup.XamlReader]::Load($reader)

# Récupérer les contrôles
$label = $form.FindName("MonLabel")
$textBox = $form.FindName("MaZoneTexte")
$button = $form.FindName("MonBouton")

# Action du bouton
$button.Add_Click({
    $label.Content = "Vous avez saisi : " + $textBox.Text
})

# Afficher la fenêtre
$form.ShowDialog()
