🧾 Rapport de Projet : Application de Gestion d’une Bibliothèque
🔹 Introduction

Dans le cadre de notre projet de fin d’études, nous avons réalisé une application de gestion d’une bibliothèque utilisant le langage Java pour la partie logique et PL/SQL (Oracle) pour la gestion des données.
L’objectif de ce projet est d’automatiser les opérations de gestion des livres, des emprunts et des adhérents afin de faciliter le travail du bibliothécaire.

🔹 Objectifs du projet

L’application vise à :

Gérer les livres (ajouter, modifier, supprimer, rechercher).

Gérer les adhérents (inscription, modification, suppression).

Gérer les emprunts et les retours de livres.

Assurer la sécurité et la cohérence des données via une base Oracle et des procédures PL/SQL.

Offrir une interface utilisateur conviviale grâce à JavaFX.

🔹 Cahier des charges
Fonctionnalités principales :

Authentification de l’administrateur.

Gestion des livres :

Ajouter un nouveau livre

Modifier ou supprimer un livre

Rechercher un livre par titre, auteur ou catégorie

Gestion des adhérents :

Ajouter un nouvel adhérent

Modifier / Supprimer un adhérent

Lister tous les adhérents

Gestion des emprunts :

Enregistrer un emprunt

Enregistrer un retour

Vérifier la disponibilité des livres

Contraintes :

La base de données doit être hébergée sous Oracle.

L’application doit être développée avec JavaFX (interface graphique).

La communication entre Java et Oracle doit se faire via JDBC.

🔹 Conception (UML)
Diagramme de cas d’utilisation (principaux acteurs)

Acteurs :

Administrateur

Adhérent (indirectement)

Cas d’utilisation :

Gérer les livres

Gérer les adhérents

Gérer les emprunts/retours

Authentification

Diagramme de classes simplifié :
Classe	Attributs	Méthodes principales
Livre	idLivre, titre, auteur, catégorie, disponible	ajouter(), modifier(), supprimer(), rechercher()
Adherent	idAdh, nom, prenom, adresse, téléphone	ajouter(), modifier(), supprimer()
Emprunt	idEmp, idLivre, idAdh, dateEmp, dateRetour	emprunter(), retourner()
BibliothequeDAO	connexion, requêtes SQL	insert(), update(), delete(), select()
🔹 Base de données (Oracle)
Tables principales :

Table LIVRE

CREATE TABLE LIVRE (
  id_livre NUMBER PRIMARY KEY,
  titre VARCHAR2(100),
  auteur VARCHAR2(100),
  categorie VARCHAR2(50),
  disponible CHAR(1)
);


Table ADHERENT

CREATE TABLE ADHERENT (
  id_adh NUMBER PRIMARY KEY,
  nom VARCHAR2(50),
  prenom VARCHAR2(50),
  telephone VARCHAR2(20)
);


Table EMPRUNT

CREATE TABLE EMPRUNT (
  id_emp NUMBER PRIMARY KEY,
  id_livre NUMBER REFERENCES LIVRE(id_livre),
  id_adh NUMBER REFERENCES ADHERENT(id_adh),
  date_emp DATE,
  date_retour DATE
);

🔹 Partie Java (Backend)
Connexion à la base Oracle (JDBC)
Connection con = DriverManager.getConnection(
  "jdbc:oracle:thin:@localhost:1521:XE", "user", "password");

Exemple : Ajouter un livre
public void ajouterLivre(Livre livre) throws SQLException {
    String sql = "INSERT INTO LIVRE VALUES (?, ?, ?, ?, ?)";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, livre.getId());
    ps.setString(2, livre.getTitre());
    ps.setString(3, livre.getAuteur());
    ps.setString(4, livre.getCategorie());
    ps.setString(5, livre.isDisponible() ? "O" : "N");
    ps.executeUpdate();
}

🔹 Interface graphique (JavaFX)

L’interface est composée de plusieurs fenêtres :

Fenêtre d’accueil / Login

Fenêtre de gestion des livres

Fenêtre de gestion des adhérents

Fenêtre des emprunts

Chaque fenêtre est conçue avec Scene Builder, puis reliée à un Controller JavaFX pour gérer les actions des boutons.

🔹 Avantages du système

Interface simple et moderne.

Rapidité d’accès aux informations.

Sécurité et intégrité des données assurées par Oracle.

Réduction des erreurs humaines et automatisation du travail.

🔹 Difficultés rencontrées

Connexion entre JavaFX et Oracle via JDBC (configuration du driver).

Gestion des dates d’emprunt et de retour.

Validation des champs dans les formulaires JavaFX.

🔹 Conclusion

Ce projet nous a permis de mettre en pratique les connaissances acquises en programmation Java, bases de données Oracle et développement d’interfaces graphiques avec JavaFX.
Il constitue une base solide pour le développement futur d’un système complet de gestion de bibliothèque en ligne.

🔹 Équipe du projet
Nom	Rôle
Amine Drissi	Chef de projet / Développeur Java
Collaborateur 1	Responsable base de données
Collaborateur 2	Designer interface JavaFX

📘 Fin du rapport.
