On définit une fonction `reverse` qui inverse une liste.

Deux propriétés que l'on peut vouloir tester :

1 - Inverser une liste ne modifie pas sa longueur

> prop1 :: [a] -> Bool
> prop1 list = length (reverse list) == length list

2 - Inverser deux fois une liste redonne la liste initiale

> prop2 :: [a] -> Bool
> prop2 list = reverse (reverse list) == list

Munis de nos propriétés, on demande au framework de tests de les vérifier

> quickcheck prop1
`OK, passed 100 tests.`
> quickcheck prop2
`OK, passed 100 tests.`
