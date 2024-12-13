- _Pour_ n'a pas de representation en organigramme
- **Syntaxe de _Pour_ avec un _Pas_ :
	
> 2024-12-12
- Pour comparer deux chaines / caractères on peut utiliser **> , < , <>**
```
Si (Noms[0] < Noms[1]) Alors
	Afficher("Dans l'ordre alphabétique, Noms[0] vient avant Noms[1]")
FinSi
```
##### Exemple d’algorithme de tri des noms dans un tableau de 50 noms 
```
POUR j de 1 a 49
	POUR k de j+1 a 50
		Si (Nom[k] > Nom[j]) Alors
			tmp := Nom[k]
			Nom[k] := Nom[j]
			Nom[j] := tmp
			
			// Pour trier des notes suivant le meme ordre que les noms
			Ntmp := Note[k]
			Note[k] := Note[j]
			Note[j] := Ntmp
		FinSi
	FinPour
FinPour
```

- **Matrix carrée** : Une matrix dont le nombre de lignes est égal au nombre de colonnes
	- **... d'ordre 4** : Qu'il y a 4 lignes et donc 4 colonnes