# Projet Devoir1 - Déploiement d'Infrastructure sur Azure

Ce projet consiste à créer et déployer une infrastructure sur Azure, comprenant un Load Balancer, deux machines virtuelles (VM) avec un site web, un Key Vault pour la gestion des secrets, et des configurations pour l'auto-scaling en fonction de la charge CPU.

## Table des matières

- [À propos du projet](#à-propos-du-projet)
- [Technologies utilisées](#technologies-utilisées)
- [Configuration de l'infrastructure](#configuration-de-linfrastructure)
- [Prérequis](#prérequis)
- [Installation et configuration](#installation-et-configuration)
- [Auteur](#auteur)

---

## À propos du projet

Le projet est développé dans le cadre d'un devoir. Il vise à :
1. Créer un **Load Balancer** pour distribuer la charge entre deux VM.
2. Déployer deux **machines virtuelles** affichant un site web.
3. **Stocker les secrets** dans un Azure Key Vault sécurisé.
4. **Configurer l'auto-scaling** des VM si la charge CPU dépasse 50 % pendant 5 minutes.
5. **Distribuer les VM entre plusieurs zones** pour améliorer la résilience.

## Technologies utilisées

- **Azure DevOps** : pour les pipelines CI/CD et la gestion des tâches.
- **Azure** : pour le déploiement de l'infrastructure cloud (VM, Load Balancer, Key Vault).
- **GitHub** : pour le contrôle de version et la collaboration en équipe.
- **PowerShell** : pour l'automatisation des configurations.
- **JSON** : pour les modèles ARM utilisés dans la configuration Azure.

## Configuration de l'infrastructure

- **Key Vault** : Stocke les secrets nécessaires au projet.
- **Load Balancer** : Répartit le trafic entre les deux VM.
- **Virtual Machines** : Exécutent un site web et sont configurées pour être scalable.
- **Auto-scaling** : Se déclenche si le CPU des VM dépasse 50 % pendant 5 minutes.
- **Zones de déploiement** : Assurent la répartition des VM sur plusieurs zones Azure.

## Prérequis

- **Compte Azure** avec les permissions nécessaires.
- **Compte GitHub** pour le contrôle de version.
- **Compte Azure DevOps** pour gérer les pipelines CI/CD.
- **Git** installé pour cloner le dépôt et gérer les versions.

## Installation et configuration

1. **Clonez le dépôt** GitHub sur votre machine locale :
   ```bash
   git clone https://github.com/ThomasT2000/Devoir1.git

2. **Configurez Azure DevOps :
    Créez un projet Azure DevOps.
    Ajoutez les membres de votre équipe et grouthi@uqac.ca.
    Créez un pipeline CI pour valider et compiler le code.
    Créez un pipeline CD pour déployer l'infrastructure sur Azure.

3. **Déployez l'infrastructure :

    Exécutez le pipeline CD dans Azure DevOps pour déployer le Load Balancer, les VM, et le Key Vault sur Azure.

## Auteur

Projet réalisé par l’équipe de ThomasT2000 dans le cadre d’un devoir pour l'Université du Québec à Chicoutimi (UQAC).
