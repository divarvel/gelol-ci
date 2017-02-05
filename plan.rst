================================================================================
Intégration continue
================================================================================

Objectifs du cours
********************************************************************************

Objectifs
================================================================================

Ce cours est avant tout une introduction à certains outils, à certaines
techniques parfois utilisées dans l'industrie afin de favoriser les
développements logiciels.

Il n'est pas question ici de vous faire devenir spécialiste des technologies
présentées.

Contrôle de version
********************************************************************************

Problématique
================================================================================

Assurer une bonne gestion des sources sachant qu’elles:

- peuvent être éditées par plusieurs personnes
- possèdent intrinsèquement une certaine complexité
- évoluent dans le temps en terme de fonctionnalités, d’architecture… mais aussi
  de bugs !

1 - Échanger les codes
================================================================================

Première approche :

- Envoi de fichiers sources par mail.
- Faire des copier/coller

Cela pose porblème en terme

- de compréhension
- de contrôle des modifications

1 : Utiliser des *diffs*
================================================================================

Dans un logiciel d’envergure, les fichiers évoluent petit à petit. Pour
comparer deux versions d'un même fichier, on peut utiliser un *diff*

Identification immédiate des évolutions. Le diff permet de voir rapidement
les lignes :

- modifiées
- ajoutées
- supprimées


1 : Utiliser des *diffs* - exemple
================================================================================

On compare deux fichiers :

::

  Hello
  world
  bonjour monde !

et

::

  Hello !
  bonjour monde !
  Au revoir !


1 : Utiliser des *diffs* - résultat
================================================================================

Un exemple de diff pour le fichier précédent.

::

  % diff -y fic fic2               
      Hello               | Hello !
      world               <
      bonjour monde !       bonjour monde !
                          > Au revoir !

On retrouve bien tous les types de modification dans le diff.


1 : Utiliser des *diffs* (1)
================================================================================

Le résultat d'un diff peut être utilisé sur l'ancienne version d'un fichier
pour produire la nouvelle version. On applique un *patch*. Un développeur peut
utiliser un diff pour mettre ses codes à jour.

Des limites persistent :

- Pas de concept de projet
- Pas de gestion des ajouts/suppression de fichiers
- Plusieurs types de diffs... On utilise généralement des "diffs unifiés" pour
  simplifier les échanges.
 

2 - Justifier les modifications
================================================================================

Une modification, donnée seule, peut être difficile à comprendre :

- Introduction de nouvelles fonctionnalités
- Diff de grande taille
- Modifications subtiles...

Solution → Joindre un message explicatif à chaque modification

2 - Une solution pas si désuète…
================================================================================

Dans certains gros projets collaboratifs, des diffs et justifications associées
sont envoyés par mail et servent de base de discussion, pour des évolutions
complexes.

3 - Maintenir un historique des modifications
================================================================================

Soit une équipe de développement en train de bosser sur une appli web avec
authentification...

Identification par mot de passe... encodés en base64.

3 - Maintenir un historique des modifications
================================================================================

.. image:: facepalm.gif


3 - Maintenir un historique des modifications
================================================================================

Qui a introduit ce code ?

Depuis quand est-il en place ?

3 - S : Mettre en place un système d'historique
================================================================================

À combiner avec un système d'authentification

- Analyse de l'évolution du code
- Association des modifications avec des développeurs
- Savoir exactement à partir de quand un bug a été introduit dans la base de
  code. Cela permet, par exemple, de savoir exactement quelles versions d'un
  logiciel sont affectées par une faille de sécurité.

3 - L'historique et les suppressions accidentelles
================================================================================

L'historique permet de se mettre à l'abri des suppressions accidentelles des
fichiers qu'il contient. En cas de suppression accidentelle, on peut :

- Retrouver la dernière version du fichier dans l'historique
- Rétablir le fichier supprimé à partir de cette version.

Les modifications non publiées sont perdues.

Cette fonctionnalité justifie, à elle seule, le versionnement.


4 - Permettre les divergences… 
===============================================================================

Dans un logiciel, on trouve parfois plusieurs briques. Plusieurs personnes
peuvent être amenées à modifier des aspects différents d’une même
fonctionnalité.

4 - … et convergences des codes
===============================================================================

Une fois les travaux prêts à être intégrés, il faut être capable de les
rappatrier dans la base de code commune

4 - S : Permettre divergences et convergences
================================================================================

Création de **branches** pour les travaux indépendants.

- Protection de la base de codes commune
- Suivi des modifications, qui peuvent devenir atomiques.

besoin là aussi d'outils de convergence

.. image:: smith-agent.gif

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

Les systèmes centralisés - quelques opérations communes
================================================================================

- commit
- update
- merge

Les systèmes centralisés - limites
================================================================================

- Rigidité

  - Impossible de commiter "dans son coin"
  - Impossible de créer des branches rapidement
  - Nécessité d'être connecté
  - Conventions architecturales très lourdes

Les systèmes centralisés - limites
================================================================================

- Lenteur - latence réseau
- Fusion des branches difficile
- *Politique*

Les systèmes décentralisés
================================================================================

Git, Mercurial, Bazaar, Darcs

Pas forcément de dépôt central.

Un dépôt par développeur.

Grande liberté dans le fonctionnement (on peut même faire du centralisé).

.. image:: workflow-blessed-repo.png

Les systèmes décentralisés - Ajouts (1)
================================================================================

Une étape supplémentaire : le push. Le commit (ainsi que quasiment tout le
reste) est désormais local.

Les systèmes décentralisés - Ajouts (1)
================================================================================

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

- staging area
- bisect
- rebase
- cherry-picking
- stash
- …

Malgré tout, quelques avantages des systèmes centralisés
================================================================================

Malgré leurs fonctionnalités souvent plus limités, les systèmes de versionnement
centralisés présentent quelques avantages :

- La centralisation rassure les (vieux) managers
- La mise en commun est directe - il n'y a qu'un seul point d'entrée.
- Beaucoup de solutions reposent nativement sur les
  systèmes centralisés ou permetetnt de les utiliser
- Souvent besoin de plus d'étapes pour faire la même chose.
- Tous les projets sont au même endroit. Avec leurs branches, leurs tags...
  Tout...

Malgré tout, quelques avantages des systèmes centralisés (2)
================================================================================

- Moins de concepts à apprendre. Il faut savoir commiter, mettre le dépôt local
  à jour, éventuellement savoir déplacer des dossiers, et c'est à peu près tout.
- Plus de liberté dans les systèmes décentralisés → plus de risques. Il est
  plus compliqué de tricher sur l'historique dans Subversion que dans Git. A
  contrario, il est aussi presque impossible de corriger une erreur dans
  l'historique de SVN. Attention aux "mensonges" dans l'historique

Dans tous les cas, il vaut mieux un système de versionnement que pas de
versionnement du tout.

Quelques bonnes pratiques de versionnement
================================================================================

Les fichiers à ne **jamais** commiter/pusher : 

- Les fichiers compilés (Les *.class* en Java, les *.o* en C...)
- Les fichiers de configuration inutiles pour le projet (Au hasard les fichiers
  de configuration d'Eclipse, Netbeans ou autre...)

-> Utilisez les marqueurs à disposition (svn:ignore, .gitignore...) pour éviter
de commiter n'importe quoi.
-> Vérifiez ce que vous vous apprêtez à commiter

Quelques bonnes pratiques de versionnement
================================================================================

- Ne *jamais* commiter en aveugle
- Commiter souvent pour rendre les commits aussi lisibles que possibles.
- Ne pas oublier que certains outils doivent être utilisés avec parcimonie (git
  rebase, par exemple)
- …

Quelques bonnes pratiques de versionnement
================================================================================

Il peut être utile de standardiser les messages de commits :

- Séparer le sujet du corps avec une ligne vide
- Limiter la longueur du titre à 50 caractères
- Commencer le titre par une majuscule, ne pas mettre de point à la fin
- Utiliser un titre "directif"
- Limiter la longueur des lignes à 72 caractères
- Privilégier l’explication du quoi et du pourquoi par opposition au comment

Réf : http://chris.beams.io/posts/git-commit/


Quelques bonnes pratiques de versionnement - git
================================================================================

- Utiliser la *staging area*
- ``git add --patch`` pour choisir les modifications à commiter
- ``git commit --verbose`` ou ``git diff --cached`` pour voir ce que l'on
  s'apprête à commiter
- …

Systèmes décentralisés et gouvernance de projets libres
================================================================================

Parmi les limites des systèmes centralisés, une en particulier pose un
problème majeur pour les logiciels open-source : tout le monde n'a pas
le droit de commiter dans le système de versionnement.

Cette limite disparaît dans les systèmes décentralisés :

- Fork dans un dépôt local
- Modifications, commits
- "Pull request"

On peut également la faire disparaître à l'aide de liens entre un système
centralisé et un système décentralisé (git-svn, hgsubversion...), mais ça
provoque d'autres problèmes...

Le principe des pull requests
================================================================================

Chaque développeur dispose de son espace de travail. Il peut modifier les codes
indépendamment du reste de l'équipe. Quand les développements sont prêts :

- Demande d'intégration des modifications dans la base de codes. C'est la
  *pull request*
- Validation (ou non) par l'équipe de développement
- En cas de validation : intégration des codes dans la base de codes.

Et si ma pull request est refusée par le projet ?
================================================================================

Dans le cas de projets libres, plusieurs solutions :

- Intégrations de modifications demandées par l'équipe de développement, puis
  nouvelle pull request
- Maintenance d'un fork en parallèle du projet original.

Dans le cas de systèmes centralisés, on reste bloqué à la communication de
patches...

Les pull requests au coeur des systèmes de versionnement centralisés
================================================================================

.. image:: git-workflow.png
   :width: 50%

Quid d'une transition centralisé -> décentralisé ?
================================================================================

Les architectures existantes sont souvent un frein à l'adoption des systèmes
décentralisés.

*Je vois bien l'intérêt de Git, mais nous utilisons Subversion, c'est trop
compliqué de migrer...*

Des outils existent qui permettent de faire la migration. Cela permet même
de corriger des accidents qui ont pu survenir dans l'historique... Attention,
la transition est parfois douloureuse pour une partie de l'équipe, au début...

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

Quelques ressources
================================================================================

Pour Darcs :

http://en.wikibooks.org/wiki/Understanding_Darcs

"10 things I hate about Git"

https://steveko.wordpress.com/2012/02/24/10-things-i-hate-about-git/

Un peu d'ironie :

http://blog.cedarsoft.com/2010/01/top-10-why-subversion-is-better-than-git/

Ce document est versionné sous git :

*git clone https://github.com/divarvel/gelol-ci.git*

Revue de code
********************************************************************************

Problématique
================================================================================

Détecter les erreurs au plus tôt dans le cycle de développement.

Autant que faire se peut… avant la mise en production.

Solution
================================================================================

Pratiquer la *revue de code*

- Relecture (systématique ou non) avant intégration du code
- Améliore la qualité du code
- Très bon mécanisme de formation

La revue de code
================================================================================

On peut procéder de plusieurs façons :

- Commit par commit
- Avant intégration du code (branches)
- En direct (pair programming)

Commit par commit
================================================================================

Surveiller les commits qui passent et les relire un par un.

Demander des modifications après coup.

Adapté si on utilise un système de versionnement centralisé, sans branches

Fastidieux

Avant intégration du code
================================================================================

Si chaque développement a sa branche, on peut relire le code avant la fusion
de la branche.

Marche aussi si chaque développeur a son dépôt.

Facilité dans github grâce aux *pull requests*

En direct - Pair programming
================================================================================

Un poste de travail pour deux. Un développeur code, l'autre commente / guide /
pointe les erreurs.

- Gain de productivité appréciable (idéalement supérieur à un facteur 2).
- Permet de faire prendre en main concrètement une technologie
- Au coeur de l'extreme programming (XP)


Builds rationnalisés
********************************************************************************

Problématique
================================================================================

- Logiciels complexes
- Gestion des dépendances
- Phase de compilation / assemblage pas toujours évidente (dépendances, …)
- Opérations **très** répétitives et chronophages si elles sont faites à la main.

Besoins
================================================================================

Le système de gestion de versions

- Rendre les opérations reproductibles
- Automatiser les taches
- (éventuellement) brancher des traitements additionnels
- Modulariser les traitements
- Intégrer rapidement de développeurs à une équipe

Make
================================================================================

Framework d'écriture de scripts

Fonctionne sur le principe de **cibles**.

- actions associées à chaque cible
- dépendances entre cibles

Make
================================================================================

Mais

- pas de gestion des dépendances
- beaucoup de code à écrire
- dépend du système

Dans les faits :

- Makefile généré automatiquement
- dépendances gérées par le système d'exploitation
- dépendances vérifiées durant la phase de configuration

::

  ./configure
  make
  make install

Ant
================================================================================

Très répandu dans le monde Java.
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

Très répandu dans le monde Java.

SBT
================================================================================

**Simple Build Tool**

- Utilisé sur la JVM
- Pas si simple dans les faits, mais très puissants.
- Build décrit en Scala
- Compatible avec Maven


SBT et Maven - les dépendances
================================================================================

Maven est capable de gérer les dépendances d'une bibliothèques.

- Gestion des dépendances directes
- Gestion des dépendances indirectes (dépendances de dépendances)
- Gestion des dépendances par phase de construction

SBT et Maven - Repositories
================================================================================

Bibilothèques rangées dans différents dépôts.

- Dépôt Central
- ``repo2.maven.org``

Dépôts tiers

- Dépôt scala-tools
- Dépôts "maison"
- Dépôts "cache" pour soulager la bande passante

Un cycle de vie complet
================================================================================

Différentes phases au sein du cycle de vie d'un projet. Par exemple :

- compilation
- tests
- empaquetage
- installation
- déploiement
- nettoyage

Ces phases peuvent dépendre les unes des autres : on peut arrêter une
construction si les tests sont en échec

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


Toujours plus de fonctionnalités
================================================================================

Les fonctionnalités de ces outils de build  peuvent être étendues par le biais
de plugins.

Toute tâche sur le code qui est automatisable peut être réalisée par le biais
d'un plugin :

- Génération d'exécutables multi-plateformes
- Génération d'un zip contenant les sources
- Génération de la documentation développeur
- Déploiement de fichiers sur une machine distante

Et encore d'autres outils de builds...
================================================================================

D'autres outils de build existent, ne serait-ce que dans le monde de la JVM.

Gradle : 

- Grande souplesse dans la gestion des processus de build.
- Utilisation de Groovy pour décrire les phases de build.
- Compatible Maven.

Des équivalents sur les autres plateformes
================================================================================

Pour Node.js

- Grunt
- Gulp
- Webpack

Pour Ruby : Rails

…

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

Les logiciels sont écrits pour répondre à des problèmes précis

- Des spécifications décrivent un comportement attendu
- Les algorithmes sont pensés avant d'être couchés sur le papier

→ On peut décrire très souvent les entrées d'un traitement, et les résultats 
qu'il doit fournir en utilisant ces entrées

Deux mondes s'opposent
================================================================================

Dans un monde parfait : les développeurs sont beaux, ils codent sans introduire
de bugs dans les logiciels.

Dans le monde réel : les développeurs sont beaux, mais leurs codes ne marchent
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


Écrire les spécifications en premier
================================================================================

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

Quelques bonnes pratiques
================================================================================

- Écrire des tests courts
- Écrire des tests clairs
- Documenter les tests

Écrire du code testable - Références
================================================================================

Quelques frameworks d'écriture de tests unitaires :

- Java : JUnit
- PHP : PhpUnit, Atoum (BDD)
- Ruby : Test::Unit (Unitaire) / Rspecs (BDD)
- Python : PyUnit
- Javascript : Jasmine
- Haskell : Quickcheck
- …

Deux liens utiles :

- Google Testing Blog : http://googletesting.blogspot.com/
- Relation Testable / Bien conçu : http://vimeo.com/15007792

D’autres façons d’approcher l’écriture du code
================================================================================

DDD : Domain Driven Development - Se servir de la description formelle du code
et de ses types pour dériver des informations fiables des fonctions écrites.

D’autres stratégies pour tester le code
================================================================================

Les tests unitaires ne peuvent tout démontrer… Que faire pour :

- Les interactions avec les systèmes externes ?
- Les comportements non-procéduraux, e.g. les CSS ?
- Tests sur des builds très complexes ?

D’autres stratégies pour tester le code (2)
================================================================================

- Tests d’intégration
- Tests de cohérence visuelle (e.g. Zeno Pixel)
- OpenQA

Métriques
********************************************************************************

Objectifs
================================================================================

- Discuter les mesures de la qualité du code
- Découvrir comment évaluer les codes automatiquement

Problématique
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

- Style de code
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
- Limites : L'implémentation de certains algorithmes nécessite d'écrire des 
  méthodes très longues, et qui sont "atomiques"...
- Exemple : Algorithme d'intersection robuste en 2 dimensions.

4 - Complexité des codes - La cohérence entre classes et méthodes
================================================================================

Principe : Repérer les méthodes orphelines, les groupes de méthodes 
indépendants, au sein d'une même classe.

Objectif :  Assurer le principe du devoir unique (*Single Responibility* 
*Principle*) : Une classe assure une fonction définie et unique.

Comment : En profitant du paradigme objet, en assurant une conception efficace.

Détection des mauvaises pratiques (1)
================================================================================

Dans certains langages, certaines façons de coder sont considérées comme des 
mauvaises pratiques. Par exemple, en Java :

- Ne pas s'assurer que les flux d'entrée/sortie ont bien été fermés
- Ne pas mettre d'accolades autour du bloc d'instructions d'un if s'il ne comporte
  qu'une seule ligne.
- Ne pas déclarer les "constantes" **final**
- …

Détection des mauvaises pratiques (2)
================================================================================

Ces configurations peuvent être détectées, avec quelques nuances :

- On peut trouver des faux positifs.
- Toutes les violations n'ont pas la même gravité.
- De tels concepts ne peuvent être appliqués que sur des langages très 
  éprouvés. Ils sont longs à mettre en place, et représentent le fruit d'années
  d'expérience.

Les métriques et la dette technique
================================================================================

Comment expliquer simplement les problèmes mis en lumière par ces métriques ?

→ En parlant de **dette technique**

**La dette technique représente des parties de code non utilisées ou dans 
lesquelles il est difficile d'effectuer des modifications et évolutions.**

En **chiffrant** les problèmes recensés :

- Pour chaque problème et violation, chiffrer le temps moyen nécessaire à une
  correction, pour un développeur.
- Remplacer par le coût d'un développeur

La somme obtenue correspond à l'argent nécessaire en théorie pour résorber 
l'intégralité de la dette technique.

Quelques ressources...
================================================================================

Plein d'infos sur les métriques sur :

http://docs.codehaus.org/display/SONAR/Documentation

C'est la documentation de 

http://www.sonarsource.org

Pour la dette technique :

http://blog.xebia.fr/2011/09/30/livre-blanc-maitrisez-votre-dette-technique/

Intégration continue
********************************************************************************

Objectifs
================================================================================

- Faire fonctionner ensemble les outils abordés
- Aller au bout de l'automatisation


Problématique
================================================================================

Nous avons un ensemble d'outils sous la main (versionnement, outil de 
construction, tests unitaires, qualité de code...).

Des problèmes subsistent :

- Certaines tâches sont très lourdes (calcul des métriques)
- Nous ne sommes pas à l'abri d'un oubli - Même avec de bons outils, les
  développeurs font des erreurs ;-)

On met tout ensemble
================================================================================

- Système de versionnement
- Outil de construction
- Tests unitaires
- Calcul des métriques

Le système de versionnement...
================================================================================

Le serveur d'intégration dispose d'un accès aux codes (copie/dépôt local). Il
peut :

- Se connecter à la base de code
- Scruter les modifications
- Rapatrier la dernière version des codes.

L'outil de construction...
================================================================================

Lorsqu'une modification est rapatriée :

- Compilation des codes
- Exécution des tests 

On peut se servir des dépendances transitives et des projets riches :

- Construction des projets multi-modules
- Construction d'un projet après modification dans une dépendance (pour 
  vérifier qu'une modification extérieure n'a pas modifié le projet).

Les tests unitaires
================================================================================

Des tendances peuvent être dégagées de l'exécution des tests :

- Des tests ont été cassés ?
- Des tests ont été corrigés ?
- Dans quel sens la qualité logicielle évolue-t-elle ?

En cas de problèmes...
================================================================================

Des alertes peuvent être levées :

- Dans l'interface du serveur.
- Par mail.
- Par SMS (!).

Et aussi...
================================================================================

D'autres actions peuvent être déclenchées régulièrement, indépendamment de la
scrutation

Exemple : Calcul des métriques

Intérêt
================================================================================

- Vision claire de l'état du projet
- Assurance qualité en continu
- Tâches potentiellement lourdes déportées sur un serveur distant

Intérêt
================================================================================

- Fun (http://www.flickr.com/photos/unavoidablegrain/4622043091/sizes/z/in/photostream/)

.. image:: resources/feu.jpg

Un exemple de serveur d'intégration
================================================================================

http://jenkins-ci.org/

Pour des infos sur le logiciel :

**Jenkins, the definitive guide**

Continuous delivery / deployment
********************************************************************************

Continuous delivery
================================================================================

- Après chaque build réussi, mettre à dispostion un livrable
- Nécessite de maîtriser le processus de déploiement en plus du processus de
  build


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

Des contraintes indirectes
================================================================================

- Savoir livrer vite
- Savoir revenir vite à une version précédente du code
- Maîtriser précisément le comportement de son architecture

…pour des avantages indirects
================================================================================

- Impose une grande rigueur vis à vis de la qualité du code
- Assurance d’une qualité continue du code
- Très grande réactivité aux bugs et aux demandes utilisateurs

Des services existent : Clever Cloud, Heroku, Google Cloud…
