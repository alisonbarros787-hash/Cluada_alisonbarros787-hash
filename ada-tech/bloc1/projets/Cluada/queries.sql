-- Active: 1785418892315@@127.0.0.1@5432@adakor

1_
SELECT *
FROM employe
ORDER BY service_id ASC;
1-2_
SELECT *
FROM employe
ORDER BY nom ASC;

2_
SELECT COUNT(*) AS nb_employe
FROM employe;

3_
SELECT COUNT(prix_centimes / 100) AS total_euro
FROM transaction_cafe;

4_
SELECT boisson, COUNT(*) AS nb_boisson
FROM transaction_cafe
GROUP BY boisson
ORDER BY nb_boisson DESC;
espresso	431

5_
SELECT nom, prenom ,boisson, ROUND(SUM(prix_centimes)/100 ,2) AS prix_total
FROM transaction_cafe
JOIN employe ON employe_id = employe.id
GROUP BY nom
ORDER BY ROUND(SUM(prix_centimes)/100 ,2) DESC;
Petit	Marc	the	325

6_
SELECT
    e.nom,
    e.prenom,
    COUNT(DISTINCT DATE(b.horodatage)) AS nb_jours_presence,
    NULLIF(
        COUNT(tc.id) / NULLIF(COUNT(DISTINCT DATE(b.horodatage)), 0),
        0
    ) AS moyenne_cafes
FROM employe e
LEFT JOIN badgeage b
       ON b.employe_id = e.id
LEFT JOIN transaction_cafe tc
       ON tc.employe_id = e.id
GROUP BY e.id, e.nom, e.prenom
HAVING COUNT(DISTINCT DATE(b.horodatage)) > 4
ORDER BY moyenne_cafes DESC;
Je ne vois pas le souci ...

7_
Pas assez claire ; La qu°6 et 7 ne sont pas assez explicite et concrète 
l'enoncé n'est pas fait pour moi 

8_
SELECT id, employe_id, horodatage, sens, porte
FROM badgeage
WHERE TIME(horodatage) > '21:00:00'
ORDER BY horodatage;

9_
SELECT b.horodatage, b.sens, e.nom, e.prenom , b.porte
FROM badgeage b
JOIN employe e ON b.employe_id = e.id
WHERE TIME(b.horodatage) > '21:00:00' AND b.sens = "entree"
ORDER BY b.horodatage;
horodatage	sens	nom	prenom	porte
2026-06-16 21:47:05	entree	Benali	Nadia	arriere
2026-06-17 21:44:07	entree	Benali	Nadia	arriere
2026-06-18 21:49:21	entree	Benali	Nadia	arriere

10_
SELECT b.horodatage, c.date_debut , c.date_fin, b.sens, e.nom, e.prenom , b.porte , c.employe_id
FROM badgeage b
JOIN employe e ON b.employe_id = e.id
JOIN conge c ON b.employe_id = c.employe_id
WHERE TIME(b.horodatage) > '21:00:00' AND b.sens = "entree"
ORDER BY b.horodatage;
Non 

11_
SELECT b.horodatage, b.sens, e.nom, e.prenom , b.porte , c.boisson
FROM badgeage b
JOIN employe e ON b.employe_id = e.id
JOIN transaction_cafe c ON b.employe_id = c.employe_id
WHERE TIME(b.horodatage) > '21:00:00' AND b.sens = "entree"
ORDER BY b.horodatage;
oui 

12_
SELECT b.horodatage, e.nom, e.prenom , c.employe_id
FROM badgeage b
JOIN employe e ON b.employe_id = e.id
JOIN acces_parking c ON b.employe_id = c.employe_id
WHERE TIME(b.horodatage) > '21:00:00' 
ORDER BY b.horodatage;

13_
SELECT b.horodatage, b.porte, e.nom, e.prenom
FROM badgeage b
JOIN employe e ON b.employe_id = e.id
WHERE e.id = employe_id 
  AND DATE(b.horodatage) 
ORDER BY b.horodatage;




SELECT DISTINCT badgeage.horodatage as "parking", employe.nom
FROM acces_parking
JOIN employe ON employe.id = acces_parking.employe_id
JOIN badgeage ON badgeage.employe_id = employe.id
JOIN conge ON conge.employe_id = badgeage.employe_id
WHERE date_debut <= '2026-06-15' AND date_fin >= '2026-06-26'