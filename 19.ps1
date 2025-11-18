function Get-Person 
{
    param (
        [Parameter(Mandatory=$true)]
        [string]$Initial1,

        [string]$Initial2
    )   
    # Créer la connexion
    $connection = New-Object System.Data.SqlClient.SqlConnection
    $connection.ConnectionString = "Server=.\SQLEXPRESS;Database=AdventureWorks2022;Integrated Security=True;"
    $connection.Open()

    # Préparer la commande SQL
    $command = New-Object System.Data.SqlClient.SqlCommand
    $command.Connection = $connection
    $command.CommandText = "select BusinessEntityID, FirstName, LastName from Person.Person where Lastname like '$initial1%' and FirstName like '$initial2%'"

    # Exécuter la commande SQL
    $dataAdapter= New-Object System.Data.SqlClient.SqlDataAdapter
    $dataAdapter.SelectCommand = $command
    $ds = New-Object System.Data.DataSet
    $dataAdapter.Fill($ds)

    # Affichage
    foreach($row in $ds.Tables[0].Rows)
    {
        $id = $row["BusinessEntityId"]
        $prenom = $row["FirstName"]
        $nom = $row["LastName"]
        Write-Host "$id - $prenom - $nom"
    }
}