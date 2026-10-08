CREATE TABLE utilisateur (
    id_utilisateur SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL, 
    prenom VARCHAR(100) NOT NULL, 
    email VARCHAR(255) UNIQUE NOT NULL, 
    mot_de_passe_hash VARCHAR(255) NOT NULL,
    telephone VARCHAR(20), 
    role VARCHAR(10) CHECK (role IN ('USER', 'ADMIN')) NOT NULL,
    date_inscription DATE NOT NULL 
);

CREATE TABLE creneau (
    id_creneau SERIAL PRIMARY KEY,
    date_heure_debut TIMESTAMP NOT NULL,
    date_heure_fin TIMESTAMP NOT NULL, 
    capacite_max INT, 
    statut VARCHAR(10) CHECK (statut IN ('OUVERT', 'FERME')) NOT NULL 
);



CREATE TABLE reservation (
    id_reservation SERIAL PRIMARY KEY,
    date_creation TIMESTAMP NOT NULL, 
    nb_personnes INT DEFAULT 1 NOT NULL,
    statut VARCHAR(20) CHECK (statut IN ('CONFIRME', 'ANNULE', 'EN_ATTENTE')) NOT NULL, 
    commentaire TEXT, 
    id_utilisateur INT NOT NULL,
    id_creneau INT NOT NULL,
    CONSTRAINT fk_reservation_utilisateur FOREIGN KEY (id_utilisateur) REFERENCES utilisateur(id_utilisateur),
    CONSTRAINT fk_reservation_creneau FOREIGN KEY (id_creneau) REFERENCES creneau(id_creneau)
);

CREATE TABLE parametre (
    id_parametre SERIAL PRIMARY KEY,
    cle VARCHAR(100) UNIQUE NOT NULL,
    valeur VARCHAR(255) NOT NULL,
    type_valeur VARCHAR(10) CHECK (type_valeur IN ('INT','STRING','TIME','BOOLEAN')) NOT NULL,
    description TEXT
);

INSERT INTO utilisateur (nom, prenom, email, mot_de_passe_hash, telephone, role, date_inscription) VALUES
('Dupont', 'Jean', 'jean.dupont@email.com', 'hash_mdp_123', '0601020304', 'USER', '2023-10-01'),
('Martin', 'Sophie', 'sophie.martin@email.com', 'hash_mdp_456', NULL, 'ADMIN', '2023-10-02'),
('Bernard', 'Luc', 'luc.bernard@email.com', 'hash_mdp_789', '0708091011', 'USER', '2023-10-03');

INSERT INTO creneau (date_heure_debut, date_heure_fin, capacite_max, statut) VALUES
(CURRENT_DATE + TIME '10:00', CURRENT_DATE + TIME '12:00', 20, 'OUVERT'),
(CURRENT_DATE + TIME '14:00', CURRENT_DATE + TIME '16:00', 15, 'OUVERT'),
(CURRENT_DATE + INTERVAL '1 day' + TIME '09:00', CURRENT_DATE + INTERVAL '1 day' + TIME '11:00', NULL, 'FERME'),
(CURRENT_DATE + INTERVAL '2 days' + TIME '10:00', CURRENT_DATE + INTERVAL '2 days' + TIME '12:00', 20, 'OUVERT');

INSERT INTO reservation (date_creation, nb_personnes, statut, commentaire, id_utilisateur, id_creneau) VALUES
('2026-10-10 09:30:00', 2, 'CONFIRME', 'Besoin d''un accès PMR', 1, 1),
('2026-10-11 14:15:00', 1, 'EN_ATTENTE', NULL, 2, 2),
('2026-10-12 10:00:00', 4, 'ANNULE', 'Annulation de dernière minute', 3, 1);

INSERT INTO parametre (cle, valeur, type_valeur, description) VALUES
('capacite_max_par_creneau', '20', 'INT', 'Capacité par défaut d''un créneau'),
('duree_creneau_minutes', '120', 'INT', 'Durée standard d''un créneau'),
('heure_ouverture', '09:00', 'TIME', 'Heure d''ouverture'),
('heure_fermeture', '18:00', 'TIME', 'Heure de fermeture'),
('delai_annulation_heures', '24', 'INT', 'Délai minimum pour annuler');

