
-- Exo 1
-- Afficher toutes les informations concernant les employés
SELECT * FROM employe;

-- Exo 2
-- Afficher toutes les informations concernant les départements.
SELECT nodept, nom, noregion FROM dept;

-- Exo 3
-- Afficher le nom, la date d'embauche, le numéro du supérieur, le numéro de département et le salaire de tous les employés.
SELECT nom, dateemb, nosup, nodep, salaire FROM employe;

-- Exo 4
-- Afficher le titre de tous les employés.
SELECT nom, titre FROM employe;

-- Exo 5
-- Afficher les différentes valeurs des titres des employés
SELECT DISTINCT titre FROM employe;

-- Exo 6
-- Afficher le nom, le numéro d'employé et le numéro du département des employés dont le titre est « Secrétaire »
SELECT nom, noemp, nodep FROM employe WHERE titre="Secrétaire";

-- Exo 7
-- Afficher le nom et le numéro de département dont le numéro de département est supérieur à 40
SELECT nom, nodep FROM employe WHERE nodep > 40;

-- Exo 8 
-- Afficher le nom et le prénom des employés dont le nom est alphabétiquement antérieur au prénom
SELECT nom, prenom FROM employe WHERE nom < prenom;

-- Exo 9
-- Afficher le nom, le salaire et le numéro du département des employés dont le titre est « Représentant », le numéro de département est 35 et le salaire est supérieur à 20000
SELECT nom, salaire, nodep FROM employe WHERE titre="Représentant" AND nodep = 35 AND salaire > 20000;

-- Exo 10
-- Afficher le nom, le titre et le salaire des employés dont le titre est « Représentant » ou dont le titre est « Président »
SELECT nom, titre, salaire FROM employe WHERE titre="Représentant" OR titre="Président";

-- Exo 11
-- Afficher le nom, le titre, le numéro de département, le salaire des employés du département 34, dont le titre est « Représentant » ou « Secrétaire »
SELECT nom, titre, nodep, salaire FROM employe WHERE nodep=34 AND (titre="Représentant" OR titre="Secrétaire");

-- Exo 12
-- Afficher le nom, le titre, le numéro de département, le salaire des employés dont le titre est Représentant, ou dont le titre est Secrétaire dans le département numéro 34
SELECT nom, titre, nodep, salaire FROM employe WHERE nodep=34 AND (titre="Représentant" OR titre="Secrétaire");

-- Exo 13
-- Afficher le nom, et le salaire des employés dont le salaire est compris entre 20000 et 30000
SELECT  nom, salaire FROM employe WHERE salaire BETWEEN 20000 AND 30000;

-- Exo 15
-- Afficher le nom des employés commençant par la lettre « H »
SELECT nom FROM employe WHERE nom LIKE 'H%';

-- Exo 16
-- Afficher le nom des employés se terminant par la lettre « n »
SELECT nom FROM employe WHERE nom LIKE '%n';

-- Exo 17
-- Afficher le nom des employés contenant la lettre « u » en 3ème position
SELECT nom FROM employe WHERE nom LIKE '__u%';

-- Exo 18
-- Afficher le salaire et le nom des employés du service 41 classés par salaire croissant
SELECT salaire, nom FROM employe WHERE nodep = 41 ORDER BY salaire;

-- Exo 19
-- Afficher le salaire et le nom des employés du service 41 classés par salaire croissant
SELECT salaire, nom FROM employe WHERE nodep = 41 ORDER BY salaire DESC;

-- Exo 20
-- Afficher le titre, le salaire et le nom des employés classés par titre croissant et par salaire décroissant
SELECT titre, salaire, nom FROM employe ORDER BY titre ASC, salaire DESC;

-- Exo 21
-- Afficher le taux de commission, le salaire et le nom des employés classés par taux de commission croissante
SELECT tauxcom, salaire, nom FROM employe ORDER BY tauxcom;

-- EXO 22
-- Afficher le nom, le salaire, le taux de commission et le titre des employés dont le taux de commission n'est pas renseigné
SELECT nom, salaire, tauxcom FROM employe WHERE tauxcom IS NULL;

-- EXO 23
-- Afficher le nom, le salaire, le taux de commission et le titre des employés dont le taux de commission est renseigné
SELECT nom, salaire, tauxcom FROM employe WHERE tauxcom IS NOT NULL;

-- Exo 24
-- Afficher le nom, le salaire, le taux de commission, le titre des employés dont le taux de commission est inférieur à 15
SELECT nom, salaire, tauxcom FROM employe WHERE tauxcom IS NOT NULL AND tauxcom < 15;

-- Exo 25
-- Afficher le nom, le salaire, le taux de commission, le titre des employés dont le taux de commission est supérieur à 15
SELECT nom, salaire, tauxcom FROM employe WHERE tauxcom IS NOT NULL AND tauxcom > 15;

-- Exo 26
-- Afficher le nom, le salaire, le taux de commission et la commission des
-- employés dont le taux de commission n'est pas nul. (la commission
-- est calculée en multipliant le salaire par le taux de commission)
SELECT nom, salaire, tauxcom, salaire * tauxcom AS commission FROM employe WHERE tauxcom IS NOT NULL;

-- Exo 27
-- Afficher le nom, le salaire, le taux de commission, la commission des
-- employés dont le taux de commission n'est pas nul, classé par taux de
-- commission croissant
SELECT nom, salaire, tauxcom, salaire * tauxcom AS commission FROM employe WHERE tauxcom IS NOT NULL ORDER BY tauxcom;

-- Exo 28
-- Afficher le nom et le prénom (concaténés) des employés. Renommer les colonnes
SELECT CONCAT(nom, " ", prenom) AS `nom et prenom` FROM employe;

-- Exo 29
-- Afficher les 5 premières lettres du nom des employés
SELECT SUBSTR(nom, 1, 5) FROM employe;

-- Exo 30
--  Afficher le nom et le rang de la lettre « r » dans le nom des employés.
SELECT nom, LOCATE("r", nom) FROM employe;

-- Exo 31
-- Afficher le nom, le nom en majuscule et le nom en minuscule de l'employé dont le nom est Vrante.
SELECT nom, UPPER(nom), LOWER(nom) FROM employe WHERE nom="Vrante";

-- Exo 32
-- Afficher le nom et le nombre de caractères du nom des employés.
SELECT nom, LENGTH(nom) FROM employe;


--         Jointures

-- Rechercher le prénom des employés et le numéro de la région de leur département.
SELECT prenom, noregion 
FROM employe
JOIN dept ON nodep = nodept;


-- Rechercher le numéro du département, le nom du département, le
-- nom des employés classés par numéro de département (renommer les
--tables utilisées).

SELECT nodept, d.nom, e.nom 
FROM dept as d
JOIN employe as e ON nodept = nodep 
ORDER BY nodept;

-- Rechercher le nom des employés du département Distribution

SELECT DISTINCT e.nom 
FROM dept AS d
JOIN employe AS e ON nodept = nodep
WHERE d.nom="Distribution";


-- Rechercher le nom et le salaire des employés qui gagnent plus que
-- leur patron, et le nom et le salaire de leur patron

-- A revoir
SELECT e.nom, e.salaire, p.nom, p.salaire
FROM employe AS e
JOIN employe AS p ON e.nosup = p.noemp
WHERE e.salaire > p.salaire;


-- Rechercher le nom et le titre des employés qui ont le même titre que Amartakaldire.

SELECT nom, titre
FROM employe 
WHERE titre IN
    (SELECT titre FROM employe WHERE nom = "Amartakaldire");

/* Rechercher le nom, le salaire et le numéro de département des
employés qui gagnent plus qu'un seul employé du département 31,
classés par numéro de département et salaire */

SELECT nom, salaire, nodep 
FROM employe
WHERE salaire > ANY
(SELECT salaire FROM employe 
JOIN dept ON nodept = nodep
WHERE nodept = 31)
ORDER BY nodep, salaire;



/* Rechercher le nom, le salaire et le numéro de département des
employés qui gagnent plus que tous les employés du département 31,
classés par numéro de département et salaire */

SELECT e.nom, salaire, nodep 
FROM employe AS e
JOIN dept AS d ON nodept = nodep
WHERE salaire > 
(SELECT SUM(salaire) FROM employe 
JOIN dept ON nodept = nodep
WHERE nodept = 31)
ORDER BY nodep, salaire;


/* Rechercher le nom et le titre des employés du service 31 qui ont un
titre que l'on trouve dans le département 32. */

SELECT nom, titre
FROM employe
WHERE titre IN
(SELECT titre 
FROM employe AS e
JOIN dept AS d ON d.nodept = e.nodep
WHERE d.nodept = 32);

/* Rechercher le nom et le titre des employés du service 31 qui ont un
titre l'on ne trouve pas dans le département 32. */

SELECT nom, titre
FROM employe
WHERE titre NOT IN
(SELECT titre 
FROM employe AS e
JOIN dept AS d ON d.nodept = e.nodep
WHERE d.nodept = 32);


/* Rechercher le nom, le titre et le salaire des employés qui ont le même
titre et le même salaire que Fairant. */


SELECT nom, titre
FROM employe
WHERE titre IN
(SELECT titre 
FROM employe AS e
JOIN dept AS d ON d.nodept = e.nodep
)
AND salaire IN
(SELECT salaire
FROM employe AS e
WHERE e.nom = "Fairent"
);



--              LEFT     RIGHT



/* Rechercher le numéro de département, le nom du département, le
nom des employés, en affichant aussi les départements dans lesquels
il n'y a personne, classés par numéro de département. */

SELECT d.nodept, d.nom, e.nom
FROM dept as d
LEFT JOIN employe AS e ON d.nodept = e.nodep
ORDER BY d.nodept;

--            GROUP BY

-- 1. Calculer le nombre d'employés de chaque titre.

SELECT titre, COUNT(noemp)
FROM employe
GROUP BY titre;

-- 2. Calculer la moyenne des salaires et leur somme, par région.
SELECT AVG(e.salaire) AS `Salaire moyen`, SUM(e.salaire) AS `Salaire total`, d.nom
FROM employe AS e
JOIN dept AS d ON e.nodep = d.nodept
GROUP BY d.nom;

-- 3. Afficher les numéros des départements ayant au moins 3 employés.
SELECT d.nodept AS `N°Dept`, COUNT(*)
FROM employe AS e
JOIN dept AS d ON e.nodep = d.nodept
GROUP BY d.nodept
HAVING COUNT(*) > 2;


-- 4. Afficher les lettres qui sont l'initiale d'au moins trois employés
SELECT LEFT(nom, 1), COUNT(*)
FROM employe
GROUP BY LEFT(nom, 1)
HAVING COUNT(*) >= 3;

-- 5. Rechercher le salaire maximum et le salaire minimum parmi tous les salariés et l'écart entre les deux.
SELECT MAX(salaire) AS `Salaire Max`, MIN(salaire) AS `Salaire Min`, MAX(salaire) - MIN(salaire) AS `Ecart Salaire`
FROM employe;

-- 6. Rechercher le nombre de titres différents.
SELECT COUNT(DISTINCT titre)
FROM employe;

-- 7. Pour chaque titre, compter le nombre d'employés possédant ce titre.
SELECT DISTINCT titre, COUNT(noemp)
FROM employe
GROUP BY titre;

-- 8. Pour chaque nom de département, afficher le nom du département et le nombre d'employés.
SELECT DISTINCT d.nom, COUNT(e.noemp)
FROM dept AS d 
JOIN employe AS e ON d.nodept = e.nodep
GROUP BY d.nom;



-- 9. Rechercher les titres et la moyenne des salaires par titre dont la moyenne est supérieure à la moyenne des salaires des Représentants.
SELECT titre, AVG(salaire)
FROM employe
GROUP BY titre
HAVING AVG(salaire) < ANY (SELECT AVG(salaire) FROM employe WHERE titre = 'représentant');



-- 10.Rechercher le nombre de salaires renseignés et le nombre de taux de commission renseignés.

SELECT COUNT(*)
FROM employe
WHERE salaire IS NOT NULL AND tauxcom IS NOT NULL;