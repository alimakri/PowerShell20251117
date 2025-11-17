$i=12
$j=$i


# Création d'un objet personnalisé avec des propriétés
$objetVide = @{}

$personne1 = @{
    Nom    = "Dupont"
    Prenom = "Jean"
}
$personne2 = @{
    Nom    = "Durand"
    Prenom = "Isabelle"
}


# Affichage de l'objet
$p3 = $personne1


$p3.Prenom = "Nathalie"

$personne1