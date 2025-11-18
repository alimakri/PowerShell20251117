# Mode connecté
# -------------
# Créer la connexion
$connection = New-Object System.Data.SqlClient.SqlConnection
$connection.ConnectionString = "Server=.\SQLEXPRESS;Database=AdventureWorks2022;Integrated Security=True;"
$connection.Open()

# Exécuter la commande SQL
$command = New-Object System.Data.SqlClient.SqlCommand
$command.Connection = $connection
$command.CommandText = "select Top 10 BusinessEntityID, FirstName, LastName from Person.Person"

$reader = $command.ExecuteReader()  # Crée un object de type SqlDataReader

while($Reader.Read())
{
    $id = $reader["BusinessEntityId"]
    $prenom = $reader["FirstName"]
    $nom = $reader["LastName"]
    Write-Host "$id - $prenom - $nom"
}
$reader.Close()
