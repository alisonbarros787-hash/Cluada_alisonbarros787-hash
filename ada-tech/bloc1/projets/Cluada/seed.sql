-- Active: 1785481177035@@127.0.0.1@3306
--  insère au moins 5 visiteur·se·s et 10 visites cohérentes (des employé·e·s qui existent ! des dates dans la période !).


INSERT INTO visiteurs (id, nom, prenom, societe_origine, recu_par,date_venue) VALUES
(1,'MJboss', 'Rémy', 'ESCAPE-GAME',15, '2020-10-19'),
(2,'KingCss', 'Julien','CSStobe' ,4, '2015-03-09'),
(3,'SQLtrap', 'Aurélie', 'HateSQLite',4, '2017-09-04'),
(4,'Gnome', 'Al', 'iloveCOFEE',22, '2019-01-14'),
(5,'Thehedgehog', 'Shadow', 'Vitess+',35, '2020-06-01'),
(6,'Comics', 'Sans', 'Ketchup',28, '2018-11-05');




INSERT INTO registre_recu (id , employe_id ,date_visite , motif) VALUES
(1, 15, '2020-10-19','reunion'),
(2, 4,'2017-09-04', 'entretien'),
(3, 22, '2019-01-14', 'livraison'),
(4, 31,'2020-05-01','reunion'),
(5, 28,'2018-11-05', 'livraison'),
(6, 4, '2015-03-09', 'entretien'),
(7, 11,'2019-01-14','autre'),
(8, 25,'2020-10-19','autre'),
(9, 35, '2020-06-01', 'entretien'),
(10, 9, '2017-01-04','reunion');
