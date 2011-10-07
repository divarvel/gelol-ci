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

.. image:: workflow-centralized.png

Les systèmes centralisés - limites
================================================================================

- Rigidité

  - Impossible de commiter "dans son coin"
  - Impossible de créer des branches rapidement
  - Nécessité d'être connecté
  - Conventions architecturales

Les systèmes centralisés - limites
================================================================================

- Lenteur - latence réseau
- Fusion des branches difficile
- *Politique*

Les systèmes décentralisés
================================================================================

Git, Mercurial, Bazaar, Darcs (<3)

Pas forcément de dépôt central.

Un dépôt par développeur.

Grande liberté dans le fonctionnement (on peut même faire du centralisé).

.. image:: workflow-blessed-repo.png

Les systèmes décentralisés - Ajouts (1)
================================================================================

Une étape supplémentaire : le push. Le commit (ainsi que quasiment tout le
reste) est désormais local.

.. image:: git-workflow.png
   :width: 50%

Les systèmes décentralisés - Ajouts (2)
================================================================================

Plus de latence réseau sur :

- le commit
- consultation des logs
- manipulation des branches
- …

Les systèmes décentralisés - Ajouts (3)
================================================================================

Moins de contraintes sur les commits (un commit peut représenter un état
intermédiaire)

- Commits atomiques
- Expérimentations

Les systèmes décentralisés - Ajouts (4)
================================================================================

Séparation claire des projets - un dépôt par projet

Branches locales

- liberté sur la création des branches
- l'opération est plus simple

Les systèmes décentralisés - Ajouts (5)
================================================================================

Plus de contraintes sur l'état de la branche de travail

- Pas possible de faire un "push" si la branche de travail courante n'est pas 
  propre
- Obligation de présenter un état cohérent aux autres développeurs

Et aussi dans git...- Ajouts supplémentaires
================================================================================

- bisect
- rebase
- cherry-picking
- stash  
- …

Quelques bonnes pratiques de versionnement
================================================================================

Les fichiers à ne **jamais** commiter/pusher : 

- Les fichiers compilés (Les *.class* en Java, les *.o* en C... les *.tex* et 
  le fichier généré par dot pour ce document...)
- Les fichiers de configuration inutiles pour le projet (Au hasard les fichiers
  de configuration d'Eclipse)

-> Utilisez les marqueurs à disposition (svn:ignore, .gitignore...) pour éviter
de commiter n'importe quoi.

Quelques bonnes pratiques de versionnement
================================================================================

- Commiter souvent pour rendre les commits aussi lisibles que possibles.
- Ne pas oublier que certains outils doivent être utilisés avec parcimonie (git
  rebase, par exemple)
- …

Quelques ressources
================================================================================

Pour SVN :

http://svnbook.red-bean.com/
http://stackoverflow.com/questions/871/why-is-git-better-than-subversion

Pour git :

http://whygitisbetterthanx.com/
http://book.git-scm.com/

Pour Mercurial :

http://hgbook.red-bean.com/

Ce document est versionné sous git :

*git clone https://github.com/divarvel/gelol-ci.git*

Builds automatisés
********************************************************************************

Problématique
================================================================================

Logiciels écrits en équipe.

Phase de compilation / assemblage pas toujours évidente (dépendances, …)

Opérations **très** répétitives.

Besoins
================================================================================

- Rendre les opérations reproductibles
- Automatiser les taches
- (éventuellement) brancher des traitements additionnels
- Modulariser les traitements
- Ajout rapide de développeurs à une équipe

Make
================================================================================

Framework d'écriture de scripts

Fonctionne sur le principe de **cibles**.

- actions associées à chaque cible
- dépendances entre cibles

Mais

- pas de gestion des dépendances
- beaucoup de code à écrire
- dépend du système

Dans les faits :

- make généré automatiquement
- dépendances gérées par le système d'exploitation

::

  ./configure
  make
  make install

Ant
================================================================================

Très répandu dans le monde java.
Scripts écrits sous forme de XML

Mais

- Pas de gestion des dépendances
- Beaucoup de code à écrire

Dans les faits :

- Une fois que le script Ant fonctionne, on n'y touche plus.
- Associé à Ivy pour gérer les dépendances

Maven
================================================================================

Projet décrit dans un **POM** (Project Object Module)

Sert (entre autres) à *télécharger l'Internet*

Convention over Configuration :

- *sensible defaults* : dans la plupart des cas, les valeurs par défaut sont
  les bonnes - Moins de choses à expliciter
- mais possibilité de sortir des clous

Très répandu dans le monde java.

Maven
================================================================================

Contenu du POM :

- dépendances
- relations de parenté entre modules
- configuration des modules maven

  - Version de Java utilisée pour la compilation (Java 1.6 si possible)
  - Module de création d'exécutables (jar)
  - Génération de documentation


Maven - les dépendances transitives
================================================================================


.. image:: heritage.png
        :width: 100%

Maven - Dépendances
================================================================================

::

    <dependency>
        <groupId>junit</groupId>
        <artifactId>junit</artifactId>
        <version>3.8.1</version>
        <scope>test</scope>
    </dependency>

- Dépendance à junit
- junit.junit - version 3.8.1
- nécessaire seulement pendant la phase de test


Maven - Repositories
================================================================================

Bibilothèques rangées dans différents dépôts.

- Dépôt Central
- ``repo2.maven.org``

Dépôts tiers

- Dépôt scala-tools
- Dépôts "maison"
- Dépôts "cache" pour soulager la bande passante

Maven - Goals
================================================================================

Différentes phases au sein du cycle de vie d'un projet. Par exemple :

- compilation
- tests
- empaquetage
- installation
- déploiement
- nettoyage

Dépendances entre les différents *goals*. Intérêt : on ne peut pas faire un
déploiement innocent d'une bibliothèque dont des tests sont cassés...

Maven - Archetypes
================================================================================

Les conventions ont un rôle très fort -> on construit toujours les mêmes 
projets

- Génération à partir de squelettes
- Utilisation des "archetypes".

::

  mvn archetype:generate

donne une liste d'archetypes disponibles par défaut.

Maven - Projets modulaires
================================================================================

Un projet est rarement monolithique. Il est en général composé de différentes
parties peu couplées, mais interdépendantes.

Par exemple, pour un navigateur web :

- Moteur de rendu HTML
- Moteur Javascript
- Interface graphique

Il est alors judicieux de séparer ce projet en modules distincts

Maven - Quelques cas d'utilisation... (1)
================================================================================

::

  mvn compile

Cette commande lance la phase de **compilation** : toutes les sources sont compilées,
après résolution des dépendances.

Concrètement, que se passe-t-il ?

Les dépendances sont résolues.

- Maven vérifie que toutes les dépendances (utilisées...) sont présentes localement.
- Si certaines sont manquantes -> Tentative de rappatriement depuis un des dépôts déclarés.
- En cas d'échec -> erreur de compilation... ;-)

Le *classpath* du compilateur Java est alimenté comme il se doit.

Les fichiers **.class** sont générés.

Maven - Quelques cas d'utilisation... (2)
================================================================================

::

  mvn test

Cette commande exécute les tests déclarés dans le projet.

Concrètement, que se passe-t-il ?

La phase ``mvn compile`` est lancée (dépendance préalable à l'exécution des tests.
On ne pourrait pas tester des codes qui ne compilent pas...)

Les dépendances sur les tests sont résolues

Les tests sont compilés.

Les tests sont exécutés sur les codes.

**On a réalisé, en une seule commande, quatre opérations non atomiques !**


Maven - Quelques cas d'utilisation... (3)
================================================================================

::

  mvn clean install

**Attention !** On a cette fois deux *goals* à exécuter !

D'abord le goal **clean** : tous les fichiers générés qui ne sont pas des sources sont
supprimés. Ici, le paradigme *Convention over Configuration* est essentiel !

Puis le goal **install** :

Le goal **compile** est exécuté.

Le goal **test** est exécuté.

Le goal **package** est exécuté -> création d'un jar.

Le goal **install** est exécuté -> installation de l'archive dans un dépôt local. La bibliothèque
ainsi produite devient utilisable localement par tous les autres projet Maven !

Et encore d'autres...
================================================================================

D'autres outils de build existent, ne serait-ce que dans le monde de la JVM.

Gradle : 

- Grande souplesse dans la gestion des processus de build.
- Utilisation de Groovy pour décrire les phases de build.
- Compatible Maven.

SBT :

- Grande souplesse dans la gestion des dépendances
- Écrit en scala
- Fichiers de configuration très concis
- Compatible Maven.

Quelques ressources (1)
================================================================================

Pour make :

- http://www.gnu.org/software/make/

Pour Ant :

- http://ant.apache.org/

Pour Maven :

- Maven, the definitive guide, https://github.com/sonatype/maven-guide-en
- http://maven.apache.org/


Quelques ressources (1)
================================================================================

Pour Gradle :

- http://www.gradle.org/
- G. Mazelier, *"Build automatisé : à la découverte de Gradle"*, **GNU/Linux 
  Magazine France n°141**, pp 22-34

Pour SBT :

- https://github.com/harrah/xsbt/wiki

Tests automatisés
********************************************************************************

Objectif
================================================================================

- Définir ce qu'est un test unitaire
- Décrire les apports des tests unitaires
- Expliquer dans quels cas ils peuvent être écrits


Problématique
================================================================================

L'informatique est une disicipline déterministe.

Les logiciels sont rarement écrits en aveugle :

- Des spécifications décrivent un comportement attendu
- Les algorithmes sont pensés avant d'être couchés sur le papier

-> On peut décrire très souvent les entrées d'un traitement, et les résultats 
qu'il doit fournir en utilisant ces entrées

Deux mondes s'opposent
================================================================================

Dans un monde parfait : les développeurs sont beaux, ils codent sans introduire
de bugs dans les logiciels.

Dans le monde réel : les développeurs sont beaux, mais leurs codent ne marchent
pas toujours…

Deux mondes s'opposent - bis
================================================================================

1. Pour corriger les codes, on travaille en aval, et on fait uniquement du 
   debugging.

2. Pour détecter les erreurs dans le code le plus tôt possible, on travaille en
   amont, par exemple en écrivant des **tests unitaires**.

Les tests unitaires - définition
================================================================================

"En programmation informatique, le test unitaire est un procédé permettant de
s'assurer du fonctionnement correct d'une partie déterminée d'un logiciel ou
d'une portion d'un programme (appelée « unité » ou « module »)."

Merci *wikipedia* : .. http://fr.wikipedia.org/wiki/Test_unitaire

Dans les faits, qui est l'unité ?
================================================================================

Toute méthode / fonction dont les entrées et sorties attendues peuvent être 
décrites précisément.

Objectif : Tester les codes aussi largement que possible, dans leurs 
fonctionnements atomiques

Que teste-t-on ?
================================================================================

Les comportements attendus, décrits par les spécifications, par la doc...

- Les sorties attendues
- Les erreurs attendues.

Ce que les tests apportent
================================================================================

- Vérification de la validité du contrat passé entre les codes et leur 
  description
- Protection contre l'introduction des régressions dans le code

Ce n'est pas tout…

- Écrire des tests lors du développement d'une API force à la prendre en main
- Lire les tests associés à un code permet parfois de mieux comprendre leur
  fonctionnement.
- Utilisation avancée de l'API pendant le développement - La bibliothèque est-
  elle utilisable ?

Ce que les tests n'apportent pas, et n'apporteront jamais
================================================================================

Une couverture exhaustive de toutes les états qui peuvent être rencontrés dans
un logiciel.

- Trop grande complexité
- Comportements parfois inattendus. Certains bugs ne sont révélés que dans des
  configurations surprenantes... et peuvent être le fruit de l'interaction entre
  plusieurs briques logicielles pourtant indépendantes en apparence.

Ce que les tests n'apportent pas, et n'apporteront jamais
================================================================================

Mais surtout... **La présence de tests unitaires ne peut garantir l'absence
de bugs dans un logiciel**, et ce quelle que soit la couverture.

- Testing shows the presence, not the absence of bugs 
- Edsger Djikstra

Quid de la présence d'un bug dans les tests ?

Écrire les tests en premier
================================================================================

TDD - Test Driven Development : écrire les tests avant le code.

- Formalisation des spécifications
- Assurance de la couverture du code 

BDD - Behaviour Driven Development : écrire les spécifications sous forme de
tests.

Les tests :

- sont écrits de manière intelligible
- décrivent simplement le comportement de chaque élément

- voir specs.scala

Écrire du code testable
================================================================================

- "J'aimerais bien faire des tests, mais mon code ne s'y prête pas"
- Difficile de tester du code en isolation
- Comment tester une interface graphique ?

Écrire du code testable - des solutions
================================================================================

- Minimiser le **couplage** entre éléments
  
  - Éviter les méthodes statiques
  - Éviter les ``new`` (mais comment ?)
  - Inversion de contrôle / Injection de dépendances
  - Loi de Demeter

- Minimiser les états cachés
- Transparence référentielle

Écrire du code testable - Minimiser le couplage
================================================================================

- Permet de tester les éléments **en isolation**
- Utilisation de *bouchons* ou *mocks*

  - Implémentent les mêmes interfaces
  - Comportement simplifié

Objectif : Garder à l'esprit qu'on ne veut tester qu'une **unité**. Si on peut,
on doit éviter d'être dépendant de briques éloignés de la méthode/fonction que 
l'on teste.

Inversion de contrôle - IoC
================================================================================

- Spécifier les dépendances lors de l'**appel** du constructeur et non lors de
  sa définition.
- Permet d'utiliser des bouchons lors des tests
- Nécessite un peu plus de travail à l'instanciation

- Voir ioc.java

Injection de dépendances - DI
================================================================================

- Généralisation du concept d'Inversion de Contrôle
- Injection des dépendances lors de l'instanciation des objets
- Configuration des dépendances

- Voir di.java

Loi de Demeter / Principe de connaissance minimale
================================================================================

- Ne parlez qu'à vos amis immédiats
- => Diminution du couplage entre composants
- http://en.wikipedia.org/wiki/Law_of_Demeter

En conclusion, quelques bonnes pratiques
================================================================================

- Écrire des tests courts
- Écrire des tests clairs
- Documenter les tests

Écrire du code testable - Références
================================================================================

- Google Testing Blog : http://googletesting.blogspot.com/
- Relation Testable / Bien conçu : http://vimeo.com/15007792

Métriques
********************************************************************************

Objectifs
================================================================================

- Discuter les mesures de la qualité du code
- Découvrir comment évaluer les codes automatiquement

S'assurer de la qualité du code
================================================================================

- Le code est sans *bugs*, certes.

  - Mais est-il maintenable ?
  - Est-il évolutif ?
  - Fait-il saigner les yeux ?

- Nécessité de mesures plus fines que « Ça marche / Ça marche pas »

Une définition stricte de la qualité des codes ?
================================================================================

- Impossible : trop de paramètres à prendre en compte. On ne peut pas sortir une 
  "formule magique".
- Besoin de mettre en place des mesures dédiées.


Quelques métriques
================================================================================

- Style de codage
- Détection de copier / coller
- Complexité du code (complexité cyclomatique)
- Cohérence des méthodes et des classes
- Couplage entre les composants
- Abstraction / Viscosité
- …

1 - Le style de codage
================================================================================

Besoin de garder les codes lisibles :

- Indentation
- Espacement
- Longueur des lignes

2 - Détection de copier / coller
================================================================================

Repérage des lignes exactement similaires dans les codes

Objectifs :

- Simplifier la maintenance des applications
- Encourager la **factorisation** des codes
- Diminuer la quantité de codes à maintenir

3 - Complexité des codes - La complexité cyclomatique
================================================================================

Selon Wikipédia : "Cette mesure comptabilise le nombre de « chemins » au travers 
d'un programme représenté sous la forme d'un graphe"

Concrétement : on compte les appels à **if**, **else if**, **case**, **for**,
**while**, **&&**, **||**...

- Objectif : Garder les codes simples.
- Comment ? 
  - Méthodes courtes.
  - Méthodes atomiques

3 - Complexité des codes - La complexité cyclomatique
================================================================================

- Effet de bord : les codes deviennent plus faciles à tester.
- Limites : L'implémentation de certains algorithmes nécessitent d'écrire des 
  méthodes très longues, et qui sont "atomiques"...
- Exemple : Algorithme d'intersection robuste en 2 dimensions.

4 - Complexité des codes - La cohérence entre classes et méthodes
================================================================================

Principe :
- repérer les méthodes orphelines, les groupes de méthodes 
indépendants, au sein d'une même classe.

Objectif : 
- Assurer le principe du devoir unique (*Single Responibility 
Principle*) : Une classe assure une fonction définie et unique.

Comment ?

- En profitant du paradigme objet, en assurant une conception efficace.

Continuous integration
********************************************************************************

On met tout ensemble
================================================================================

- Intégration au système de versionnement
- Compilation du projet
- Exécution des tests
- Calcul des Métriques

Intérêt
================================================================================

- Vision claire de l'état du projet
- Assurance qualité en continu
- Taches potentiellement lourdes déportées sur un serveur distant

Intérêt
================================================================================

- Fun (http://www.flickr.com/photos/unavoidablegrain/4622043091/sizes/z/in/photostream/)

.. image:: resources/feu.jpg

Dans les faits
================================================================================

- Le serveur d'intégration "surveille" le dépôt
- À chaque modification, le serveur d'Intégration
  
  - recompile
  - exécute les tests
  - calcule les métriques
  - Prévient qui de droit en cas de problème


Continuous delivery / deployment
********************************************************************************

Continuous delivery
================================================================================

- Après chaque build réussi, mettre à dispostion un livrable


Continuous Deployment
================================================================================

- Après chaque build réussi, mise en production immédiate

Les bénéfices sont multiples :

- *Faster TTM: time to market*
- *Feedback* utilisateur quasi immédiat
- Pas de gel de la base de code
- Logiciel continuellement utilisable
- Ajouts de code plus petits

  - Plus facile à *débug*

Cadres propices
================================================================================

SaaS - Software as a Service

- Environnement d'exécution contrôlé
- Changement accepté par les utilisateurs
