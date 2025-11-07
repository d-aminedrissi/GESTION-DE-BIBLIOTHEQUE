

--TABLES
CREATE TABLE LIVRE (
  id_livre NUMBER PRIMARY KEY,
  titre VARCHAR2(100),
  auteur VARCHAR2(100),
  categorie VARCHAR2(50),
  disponible CHAR(1)
);

CREATE TABLE ADHERENT (
  id_adh NUMBER PRIMARY KEY,
  nom VARCHAR2(50),
  prenom VARCHAR2(50),
  telephone VARCHAR2(20)
);

CREATE TABLE EMPRUNT (
  id_emp NUMBER PRIMARY KEY,
  id_livre NUMBER REFERENCES LIVRE(id_livre),
  id_adh NUMBER REFERENCES ADHERENT(id_adh),
  date_emp DATE,
  date_retour DATE
);
=====================
--LES INFO LI F TABLES
INSERT INTO LIVRE VALUES (1, 'Le Petit Prince', 'Antoine de Saint-Exupéry', 'Roman', 'O');
INSERT INTO LIVRE VALUES (2, '1984', 'George Orwell', 'Roman', 'O');
INSERT INTO LIVRE VALUES (3, 'Les Misérables', 'Victor Hugo', 'Roman classique', 'O');
INSERT INTO LIVRE VALUES (4, 'Harry Potter', 'JK Rowling', 'Fantasy', 'O');
INSERT INTO LIVRE VALUES (5, 'Crime et Châtiment', 'Fiodor Dostoïevski', 'Roman psychologique', 'O');
INSERT INTO LIVRE VALUES (6, 'Orgueil et Préjugés', 'Jane Austen', 'Romance classique', 'O');
INSERT INTO LIVRE VALUES (7, ' Dix Petits Nègres
', 'Agatha Christie', 'Roman policier', 'O');


INSERT INTO ADHERENT VALUES (1, 'Yahya', 'Faraj', '0601020304');
INSERT INTO ADHERENT VALUES (2, 'Amine', 'Drissi', '0705060708');
INSERT INTO ADHERENT VALUES (3, 'Elmehdi', 'Benkassou', '0705060708');
INSERT INTO ADHERENT VALUES (4, 'Anouar', 'Elferraa', '0705060708');
=========
SELECT * FROM LIVRE;
SELECT * FROM ADHERENT;
=========
--SEQUENCE
CREATE SEQUENCE seq_emp
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;
=========
--HNA L EMPRUNTER ILA JA L'ADHERENT BGHA LKTAB ILA LKTAB KAYN AYGOLIH O Z3MA OUI KAYN O ILA GALIH N Z3MA NON Y3NI LKTAB MKAYNCH

CREATE OR REPLACE PROCEDURE emprunter_livre(
  p_id_livre IN NUMBER,
  p_id_adh IN NUMBER
) AS
  v_dispo CHAR(1);
BEGIN
  SELECT disponible INTO v_dispo FROM LIVRE WHERE id_livre = p_id_livre;
  IF v_dispo = 'O' THEN
    INSERT INTO EMPRUNT VALUES (seq_emp.NEXTVAL, p_id_livre, p_id_adh, SYSDATE, NULL);
    UPDATE LIVRE SET disponible = 'N' WHERE id_livre = p_id_livre;
  ELSE
    RAISE_APPLICATION_ERROR(-20001, 'Livre non disponible');
  END IF;
END;

===========
--BACH KI9DR L'ADHERENT IHEZ LKTAB RA9M LOWL HOWA ID DYAL LKTAB O RA9M TANI HOEA ID DYAL ADHERENT
EXEC emprunter_livre(3,3);
--HADI BACH YRAJA3 LKTAB
EXEC retourner_livre(1);
--ILA KAN LKTAB MSLF DEJA KITL3 LIK ERROR BLI LKTAB NON DISPO
EXEC emprunter_livre(3,3); --HNA 3AWDT TSLFT NFS LKTAB BACH NJRB WACH AYTL3 L ERROR
=============


