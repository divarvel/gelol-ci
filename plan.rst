================================================================================
Intégration continue
================================================================================

Contrôle de version
********************************************************************************

Problématique
================================================================================

Les codes sont :

- Écrits en équipe

  - Échanges des codes
  - Justification des modifications.

- Pensés de façon modulaire (on espère)

  - Interventions indépendantes sur les codes.    
  - Divergence des bases de codes

Plusieurs problèmes peuvent être dégagés.

1 - Échanger les codes
================================================================================

Première approche : 

- Envoi de fichiers sources par mail.
- Faire un mv / un copier coller.

Compréhension difficile de l'évolution des codes.

1 - S : Utiliser des *diffs*
================================================================================

Identification immédiate des évolutions.

Application du patch représentant la modification

Des limites persistent :

- Pas de concept de projet
- Pas de gestion des ajouts/suppression de fichiers

2 - Justifier les modifications
================================================================================

Une modification, donnée seule, peut être difficile à comprendre :

- Introduction de nouvelles fonctionnalités
- Diff de grande taille
- Modifications subtiles...

Solution -> Joindre un message explicatif à chaque modification

3 - Maintenir un historique des modifications
================================================================================

Soit une équipe de développement en train de bosser sur une appli web avec
authentification...

Identification par mot de passe... "encodés" en base64.

3 - Maintenir un historique des modifications
================================================================================

Qui a introduit ce code ?

Depuis quand est-il en place ?

3 - S : Mettre en place un système d'historique
================================================================================

À combiner avec un système d'authentification

- Analyse de l'évolution du code
- Association des modifications avec des développeurs

4 - Permettre les divergences et convergences des codes
================================================================================

Soit une équipe, travaillant sur une bibliothèque dont un algorithme
*pourrait* être bloquant...

Travail long et fastidieux.

Travail sur la base de codes commune -> Blocage pour tout l'équipe (il va y
avoir de la casse temporaire)

Travail dans son coin, modification en une seule fois dans la base de codes ->
Modification incompréhensible...

4 - S : Permettre le suivi des codes qui divergent, simplifier les convergences
================================================================================

Création de **branches** pour les travaux indépendants.

- Protection de la base de codes commune
- Suivi des modifications, qui peuvent devenir atomiques.

besoin d'outils de convergence : Problème commun à l'application de patches.

En résumé...
================================================================================

On a besoin de systèmes capables de...

- Gérer les modifications dans les codes de façon différentielle.
- Permettre aux développeurs de justifier leurs modifications
- Fusionner les codes.
- Maintenir une historique de l'évolution des codes.
- Créer et fusionner des branches.

Les outils de gestion de version
================================================================================

CVS, SVN, Mercurial, Git, Bazaar...

Deux grandes "familles" :

- Les systèmes centralisés
- Les systèmes décentralisés

Les systèmes centralisés
================================================================================

SVN, CVS...

Un serveur commun à tous les développeurs.

Gestion du versionnement sur le serveur.

Les systèmes centralisés - limites
================================================================================

 - Rigidité
   
   - Impossible de commiter "dans son coin"
   - Impossible de créer des branches rapidement
   - Nécessité d'être connecté
   - Conventions architecturales

Les systèmes centralisés - limites
================================================================================

 - Lenteur
   
   - Latence réseau

 - Fusion des branches difficile

 - *Politique*

Les systèmes décentralisés
================================================================================

Git, Mercurial, Bazaar, Darcs (<3)

Pas forcément de dépôt central.

Un dépôt par développeur.

Grande liberté dans le fonctionnement (on peut même faire du centralisé).


Les systèmes décentralisés - Ajouts
================================================================================

Une étape supplémentaire : le push. Le commit (ainsi que quasiment tout le
reste) est désormais local. 

Plus de latence réseau sur :

 - le commit
 - consultation des logs
 - manipulation des branches
 - …

=> moins de contraintes sur les commits (un commit peut représenter un état
intermédiaire)

 - Commits atomiques
 - Expérimentations

Les systèmes décentralisés - Ajouts
================================================================================

Séparation claire des projets - un dépôt par projet

Branches locales

 - liberté sur la création des branches
 - l'opération est plus simple

Les systèmes décentralisés - Ajouts supplémentaires
================================================================================

 - bisect
 - rebase
 - cherry-picking

Builds automatisés
================================================================================

Tests automatisés
================================================================================

Métriques
================================================================================

Continuous delivery / deployment
================================================================================

