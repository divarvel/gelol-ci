================================================================================
Intégration continue
================================================================================

Contrôle de version
================================================================================

Problématique
-----------------------

Les codes sont :

  - Écrits en équipe

    -> Échanges des codes
    -> Justification des modifications.

  - Pensés de façon modulaire (on espère)

    -> Interventions indépendantes sur les codes.    
    -> Divergence des bases de codes

Plusieurs problèmes peuvent être dégagés.

1 - Échanger les codes
-------------------------

Première approche : 

  - Envoi de fichiers sources par mail.
  - Faire un mv / un copier coller.

Compréhension difficile de l'évolution des codes.

1 - S : Utiliser des *diffs*
-----------------------------

Identification immédiate des évolutions.

Application du patch représentant la modification

Des limites persistent :

  - Pas de concept de projet
  - Pas de gestion des ajouts/suppression de fichiers

2 - Justifier les modifications
------------------------------------

Une modification, donnée seule, peut être difficile à comprendre :

  - Introduction de nouvelles fonctionnalités
  - Diff de grande taille
  - Modifications subtiles...

Solution -> Joindre un mesage explicatif à chaque modification

3 - Maintenir un historique des modifications
------------------------------------------------

Soit une équipe de développement en train de bosser sur une appli web avec authentification...

Identification par mot de passe... "encodés" en base64.

3 - 
------------------------------

Qui a introduit ce code ?

Depuis quand est-il en place ?

3 - S : Mettre en place un système d'historique
----------------------------------------------------

À combiner avec un système d'authentification

  - Analyse de l'évolution du code
  - Association des modifications avec des développeurs

4 - Permettre les divergences et convergences des codes
-----------------------------------------------------------

Soit une équipe, travaillant sur une bibliothèque dont un algorithme *pourrait* être bloquant...

Travail long et fastidieux.

Travail sur la base de codes commune -> Blocage pour tout l'équipe (il va y avoir de la casse temporaire)

Travail dans son coin, modification en une seule fois dans la base de codes -> Modification incompréhensible...

4 - S : Permettre le suivi des codes qui divergent, simplifier les convergences
----------------------------------------------------------------------------------

Création de **branches** pour les travaux indépendants.

  - Protection de la base de codes commune
  - Suivi des modifications, qui peuvent devenir atomiques.

besoin d'outils de convergence : Problème commun à l'application de patches.

En résumé...
---------------------

On a besoin de systèmes capables de...

  - Gérer les modifications dans les codes de façon différentielle.
  - Permettre aux développeurs de justifier leurs modifications
  - Fusionner les codes.
  - Maintenir une historique de l'évolution des codes.
  - Créer et fusionner des branches.

Les outils de gestion de version
------------------------------------

CVS, SVN, Mercurial, Git, Bazaar...

Deux grandes "familles" :

  - Les systèmes centralisés
  - Les sysètmes décentralisés

Les systèmes centralisés
----------------------------

SVN, CVS...

Un serveur commun à tous les développeurs.

gestion du versoinnement sur le serveur.


Builds automatisés
================================================================================

Tests automatisés
================================================================================

Métriques
================================================================================

Continuous delivery / deployment
================================================================================

