#Atelier Sécurité des Endpoints et Supervision SIEM
Étude de cas multi-OS (Linux & Windows)

====================================================
## Présentation générale
====================================================

Ce projet a été réalisé dans le cadre du Projet Fin de Module « Virtualisation et Cloud Computing » à l’ENSET.
Il consiste à concevoir, déployer et exploiter une plateforme complète de supervision de la sécurité basée
sur Wazuh, combinant les approches SIEM (Security Information and Event Management) et EDR
(Endpoint Detection and Response).

Le laboratoire est déployé dans un environnement Cloud AWS et permet la supervision simultanée
de systèmes Linux et Windows, tout en simulant des scénarios d’attaque réalistes afin d’analyser
leur détection et leur corrélation au sein d’un SOC moderne.

====================================================
## Objectifs pédagogiques
====================================================

- Comprendre les concepts fondamentaux de SIEM et EDR
- Comprendre le rôle d’un Security Operations Center (SOC)
- Déployer une plateforme de supervision de sécurité complète
- Superviser des endpoints Linux et Windows
- Centraliser et corréler des logs multi-systèmes
- Générer et analyser des événements de sécurité réels
- Adopter une démarche proche de celle d’un analyste SOC

====================================================
## Architecture du laboratoire
====================================================

Le laboratoire repose sur une architecture Cloud simple, réaliste et proche des environnements
utilisés en entreprise.

Il comprend trois machines virtuelles déployées sur AWS EC2 :

- Serveur Wazuh All-in-One (Ubuntu 22.04)
  - Wazuh Manager
  - Wazuh Indexer
  - Wazuh Dashboard

- Client Linux (Ubuntu 22.04)
  - Wazuh Agent

- Client Windows (Windows Server 2025)
  - Wazuh Agent

Toutes les machines sont déployées dans le même VPC AWS afin d’assurer une communication
sécurisée et maîtrisée entre les composants.

====================================================
## Flux réseau et ports utilisés
====================================================

Les principaux flux réseau nécessaires au fonctionnement de la plateforme sont :

- Communication agents → serveur Wazuh : 1514/TCP
- Enrôlement automatique des agents : 1515/TCP
- Accès au dashboard Wazuh : 443/TCP
- Accès d’administration (SSH / RDP) : restreint à l’IP de l’administrateur

====================================================
## Mise en œuvre technique
====================================================

1) Installation du serveur Wazuh
- Installation via le script officiel All-in-One
- Déploiement automatique du manager, de l’indexer et du dashboard
- Vérification du bon fonctionnement des services

2) Enrôlement des agents
- Enrôlement de l’agent Linux via le dashboard Wazuh
- Enrôlement de l’agent Windows via le dashboard Wazuh
- Vérification de la communication agent ↔ serveur

3) Centralisation et visualisation
- Collecte des logs Linux et Windows
- Visualisation des événements dans le dashboard
- Corrélation automatique par règles Wazuh

====================================================
## Scénarios d’attaque simulés
====================================================

Afin d’illustrer le fonctionnement réel d’une plateforme SIEM/EDR, plusieurs scénarios
d’attaque ont été volontairement simulés.

----------------------------------------------------
Scénario 1 : Bruteforce SSH (Linux)
----------------------------------------------------

Description :
- Tentatives répétées de connexion SSH avec des identifiants invalides
- Simulation d’un accès initial automatisé

Détection :
- Analyse des logs /var/log/auth.log
- Détection des échecs répétés
- Corrélation automatique par Wazuh
- Alertes associées aux techniques MITRE ATT&CK (Credential Access)

----------------------------------------------------
Scénario 2 : Bruteforce RDP (Windows)
----------------------------------------------------

Description :
- Tentatives de connexion RDP échouées
- Génération d’événements Windows Event ID 4625

Détection :
- Collecte des événements de sécurité Windows
- Détection des tentatives répétées
- Génération d’alertes de type bruteforce RDP
- Mise en évidence d’un accès initial suspect

----------------------------------------------------
Scénario 3 : Création d’un utilisateur administrateur
----------------------------------------------------

Description :
- Création d’un utilisateur local
- Ajout au groupe Administrators
- Simulation d’une phase post-compromission

Objectif de l’attaquant :
- Élévation de privilèges
- Persistance sur le système
- Contrôle total de la machine

Détection :
- Surveillance des événements Windows 4720 (création utilisateur)
- Surveillance des événements 4732 (ajout à un groupe privilégié)
- Alerte critique indiquant une élévation de privilèges

====================================================
## Analyse SOC et résultats
====================================================

Les scénarios simulés couvrent plusieurs phases clés d’une attaque réelle :

- Accès initial
- Tentatives de compromission
- Élévation de privilèges et persistance

La plateforme Wazuh démontre sa capacité à :

- Centraliser les événements de sécurité multi-OS
- Corréler des alertes hétérogènes
- Fournir un contexte exploitable par un analyste SOC
- Faciliter la détection précoce d’incidents critiques

====================================================
## Contenu du dépôt
====================================================

- rapport.tex : rapport LaTeX complet
- README.md : documentation du projet
- *.png : schémas, captures d’écran et résultats Wazuh
- scripts éventuels utilisés pour les tests et démonstrations

====================================================
## Contexte académique
====================================================

- Établissement : ENSET
- Module : Virtualisation et Cloud Computing
- Encadrant : Prof. Azeddine KHIAT
- Année universitaire : 2025–2026
- Étudiant : Machnaoui Abdellatif

====================================================
## Conclusion
====================================================

Ce projet met en évidence l’importance des solutions SIEM et EDR dans la sécurisation
des environnements modernes. Il offre une vision pratique et opérationnelle du fonctionnement
d’un SOC, en s’appuyant sur une solution open-source robuste et largement utilisée
dans le monde professionnel.

Il constitue une base solide pour approfondir les concepts de supervision de la sécurité,
de détection des menaces et de réponse aux incidents dans des environnements Cloud hybrides.
