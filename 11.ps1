# Créer la connexion
$connection = New-Object System.Data.SqlClient.SqlConnection
$connection.ConnectionString = "Server=.\SQLEXPRESS;Database=AdventureWorks2022;Integrated Security=True;"
$connection.Open()

# Exécuter la commande SQL
$command = New-Object System.Data.SqlClient.SqlCommand
$command.Connection = $connection
$command.CommandText = "SELECT ProductID, Name, ProductNumber, ListPrice FROM Production.Product where Name like 'C%'"

# Lire les résultats
$reader = $command.ExecuteReader()
$table = New-Object System.Data.DataTable
$table.Load($reader)

# Afficher les résultats
$table | Format-Table -AutoSize
