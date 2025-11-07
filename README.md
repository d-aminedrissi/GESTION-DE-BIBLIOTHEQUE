# 🧾 Rapport de Projet : Application de Gestion d’une Bibliothèque

## 🔹 Introduction

Dans le cadre de notre projet de fin d’études, nous avons réalisé une application de gestion d’une bibliothèque utilisant **Java** pour la partie logique et **PL/SQL (Oracle)** pour la gestion des données.  
L’objectif de ce projet est d’automatiser les opérations de gestion des livres, des emprunts et des adhérents afin de faciliter le travail du bibliothécaire.

---

## 🔹 Objectifs du projet

L’application vise à :

- Gérer les livres (ajouter, modifier, supprimer, rechercher)
- Gérer les adhérents (inscription, modification, suppression)
- Gérer les emprunts et les retours de livres
- Assurer la sécurité et la cohérence des données via Oracle et PL/SQL
- Offrir une interface utilisateur conviviale grâce à **JavaFX**

---

## 🔹 Cahier des charges

### Fonctionnalités principales

#### 🔸 Authentification de l’administrateur

#### 🔸 Gestion des livres
- Ajouter un nouveau livre  
- Modifier ou supprimer un livre  
- Rechercher un livre par **titre**, **auteur** ou **catégorie**

#### 🔸 Gestion des adhérents
- Ajouter un nouvel adhérent  
- Modifier / Supprimer un adhérent  
- Lister tous les adhérents

#### 🔸 Gestion des emprunts
- Enregistrer un emprunt  
- Enregistrer un retour  
- Vérifier la disponibilité des livres

### Contraintes
- La base de données doit être hébergée sous **Oracle**
- L’application doit être développée avec **JavaFX**
- La communication entre Java et Oracle doit se faire via **JDBC**

---

## 🔹 Conception (UML)

### Diagramme de cas d’utilisation (principaux acteurs)

**Acteurs :**
- Administrateur  
- Adhérent (indirectement)

**Cas d’utilisation :**
- Gérer les livres  
- Gérer les adhérents  
- Gérer les emprunts / retours  
- Authentification  

---

### Diagramme de classes simplifié

| Classe | Attributs | Méthodes principales |
|--------|------------|----------------------|
| **Livre** | idLivre, titre, auteur, catégorie, disponible | ajouter(), modifier(), supprimer(), rechercher() |
| **Adherent** | idAdh, nom, prenom, adresse, téléphone | ajouter(), modifier(), supprimer() |
| **Emprunt** | idEmp, idLivre, idAdh, dateEmp, dateRetour | emprunter(), retourner() |
| **BibliothequeDAO** | connexion, requêtes SQL | insert(), update(), delete(), select() |

---

## 🔹 Base de données (Oracle)

### Table `LIVRE`

```sql
CREATE TABLE LIVRE (
  id_livre NUMBER PRIMARY KEY,
  titre VARCHAR2(100),
  auteur VARCHAR2(100),
  categorie VARCHAR2(50),
  disponible CHAR(1)
);
