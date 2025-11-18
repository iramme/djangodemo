from django.db import models



class Student(models.Model): #Déclare une classe Student qui hérite de models.Model, ce qui la relie à la base de données.
    name = models.CharField(max_length=100)#Crée une colonne name de type VARCHAR(100).
    address = models.CharField(max_length=200) #Crée une colonne address de type VARCHAR(200).
    moyenne = models.FloatField(default=0.0)

    def __str__(self):
        return self.name #Méthode spéciale pour afficher le nom d’un étudiant dans l’interface admin ou dans la console.
