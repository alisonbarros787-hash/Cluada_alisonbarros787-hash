-- Active: 1785481177035@@127.0.0.1@3306

CREATE TABLE visiteurs (
    id INTEGER PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    societe_origine VARCHAR(100) NOT NULL,
    recu_par INTEGER NOT NULL,
    date_venue DATE NOT NULL,
    FOREIGN KEY (recu_par) REFERENCES employe(id)
);

CREATE TABLE registre_recu (
    id INTEGER PRIMARY KEY,
    employe_id INTEGER NOT NULL,
    date_visite DATE NOT NULL,
    motif TEXT NOT NULL CHECK (motif IN (
        'reunion',
        'entretien',
        'livraison',
        'autre'
    )),
    FOREIGN KEY (employe_id) REFERENCES employe(id)
);