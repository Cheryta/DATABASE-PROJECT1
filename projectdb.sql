drop table if exists Achat;

drop table if exists Article;

drop table if exists Categorie;

drop table if exists Client;

drop table if exists Fournisseur;

drop table if exists Role;

drop table if exists Utilisateur;

drop table if exists Vente;

/*==============================================================*/
/* Table: Achat                                                 */
/*==============================================================*/
create table Achat
(
   codeAchat            int not null,
   codeFseur            int not null,
   codeArt              int not null,
   codeUser             int not null,
   dateAchat            datetime,
   quantiteAchat        int,
   prixUnitAchat        int,
   prixTotalAchat       int,
   primary key (codeAchat)
);

/*==============================================================*/
/* Table: Article                                               */
/*==============================================================*/
create table Article
(
   codeArt              int not null,
   codeCat              int not null,
   libelle              varchar(254),
   description          varchar(254),
   prixUnitaire         int,
   quantite             int,
   primary key (codeArt)
);

/*==============================================================*/
/* Table: Categorie                                             */
/*==============================================================*/
create table Categorie
(
   codeCat              int not null,
   nomCat               varchar(254),
   primary key (codeCat)
);

/*==============================================================*/
/* Table: Client                                                */
/*==============================================================*/
create table Client
(
   codeClient           int not null,
   nomClient            varchar(254),
   prenomClient         varchar(254),
   adresse              varchar(254),
   telephone            int,
   email                varchar(254),
   primary key (codeClient)
);

/*==============================================================*/
/* Table: Fournisseur                                           */
/*==============================================================*/
create table Fournisseur
(
   codeFseur            int not null,
   nomFseur             varchar(254),
   prenomFseur          varchar(254),
   adresseFseur         varchar(254),
   telFseur             int,
   emailFseur           varchar(254),
   primary key (codeFseur)
);

/*==============================================================*/
/* Table: Role                                                  */
/*==============================================================*/
create table Role
(
   codeRole             int not null,
   role                 varchar(254),
   primary key (codeRole)
);

/*==============================================================*/
/* Table: Utilisateur                                           */
/*==============================================================*/
create table Utilisateur
(
   codeUser             int not null,
   codeRole             int not null,
   nomUser              varchar(254),
   emailUser            varchar(254),
   passeword            varchar(254),
   primary key (codeUser)
);

/*==============================================================*/
/* Table: Vente                                                 */
/*==============================================================*/
create table Vente
(
   codeVte              int not null,
   codeArt              int not null,
   codeUser             int not null,
   codeClient           int not null,
   dateVte              datetime,
   quantiteVte          int,
   prixUnitVte          int,
   prixTotalVte         int,
   primary key (codeVte)
);

INSERT INTO Role (codeRole, role)
VALUES (10001, 'Administrateur'),
      (10002, 'Technicien'),
      (10003, 'Utilisateur');

INSERT INTO Categorie (codeCat, nomCat)
VALUES (001, 'Biens de premiere necessite'),
      (002, 'Matieres premieres'),
      (003, 'Equipements'),
      (004, 'Biens intermediaires et divers');

INSERT INTO Utilisateur (codeUser, codeRole, nomUser, emailUser, passeword)
VALUES (0101, 10001, 'Lionne Sauvage', 'lsauve@entreprise.com', 'LS01V'),
      (0102, 10001, 'Cheryta', 'chery@entreprise.com', 'Ch1001V'),
      (0103, 10002, 'Queen sugar', 'qsugar@entreprise.com', 'QS101m'),
      (0104, 10003, 'Queen sugar', 'qsugar@entreprise.com', 'QS101mB'),
      (0105, 10002, 'Fleur Sauvage', 'fleursge@entreprise.com', 'FLR101');

INSERT INTO Fournisseur (codeFseur, nomFseur, prenomFseur, adresseFseur, telFseur, emailFseur)
VALUES (0300, 'DEVO', 'Robinson', 'Gounghin', 63010102, 'devo@contact.com'),
      (0301, 'ISSA', 'Frank', 'Ouaga 2000', 77050701, 'frank@contact.com'),
      (0303, 'MBEMBE', 'Leon', 'Wemtenga', 58525321, 'mbeleon@contact.com'),
      (0304, 'BETHEL', 'Nicholas', 'Saaba', 66242523, 'bnich@contact.com'),
      (0305, 'SANGUITA', 'dieu beni', 'Tanguin', 55556623, 'sanbeni@contact.com');

INSERT INTO Article (codeArt, codeCat, libelle, description, prixUnitaire, quantite)
VALUES (01, 001, 'Boissons', 'Alimentation generale', 500, 240),
      (02, 002, 'Legumes', 'Matieres premieres', 250, 150),
      (03, 001, 'Produits laitiers', 'Alimentation generale', 1500, 55),
      (04, 001, 'Produits de toilette', 'Alimentation generale', 2500, 110),
      (05, 002, 'Riz', 'Matieres premieres', 10000, 25),
      (06, 004, 'Papiers', 'Biens intermediaires', 1000, 200),
      (07, 004, 'Ampoules', 'Biens intermediaires', 500, 16),
      (08, 003, 'Peintures', 'Equipements', 12500, 10),
      (09, 003, 'Echelles', 'Equipements', 5000, 5),
      (10, 003, 'Cles', 'Equipements', 2500, 25);

INSERT INTO Client (codeClient, nomClient, prenomClient, adresse, telephone, email)
VALUES (0201, 'AMINA', 'Edwige', 'Paspanga', 57570000, 'amined@contact.com'),
      (0202, 'BISSA', 'Malika', 'Niger', 77050701, 'bissam@contact.com'),
      (0203, 'MARVEL', 'Jules', 'USA', +11125321, 'Julemar@contact.com'),
      (0204, 'AMI', 'Rage', 'Inde', +566242523, 'ragi@contact.com'),
      (0205, 'BELLA', 'Vida ', 'Bresil', +33156623, 'sanbeni@contact.com');

INSERT INTO Achat (codeAchat, codeFseur, codeArt, codeUser, dateAchat, quantiteAchat, prixUnitAchat, prixTotalAchat)
VALUES (1101, 0300, 01, 0101, '2022-01-05', 100, 400, 40000),
      (1102, 0303, 03, 0102, '2022-01-20', 100, 1250, 125000),
      (1103, 0301, 03, 0101, '2022-01-30', 50, 1000, 50000),
      (1104, 0302, 05, 0105, '2022-02-10', 12, 10000, 12000),
      (1105, 0304, 04, 0103, '2022-02-20', 50, 2200, 110000),
      (1106, 0302, 07, 0102, '2022-03-03', 100, 500, 50000),
      (1107, 0305, 02, 0104, '2022-03-12', 50, 350, 17500);

INSERT INTO Vente (codeVte, codeArt, codeUser, codeClient, dateVte, quantiteVte, prixUnitVte, prixTotalVte)
VALUES (2210, 01, 0101, 0201, '2022-01-01', 10, 500, 2500),
      (2212, 03, 0102, 0202, '2022-01-01', 3, 1500, 4500),
      (2213, 03, 0101, 0203, '2022-01-02', 6, 1500, 9000),
      (2214, 05, 0105, 0204, '2022-01-02', 1, 12500, 12500),
      (2215, 04, 0103, 0205, '2022-01-03', 2, 2500, 5000),
      (2216, 07, 0102, 0201, '2022-01-03', 2, 500, 1000),
      (2217, 02, 0104, 0203, '2022-01-03', 5, 500, 2500);

alter table Achat add constraint FK_association2 foreign key (codeFseur)
      references Fournisseur (codeFseur) on delete restrict on update restrict;

alter table Achat add constraint FK_association4 foreign key (codeUser)
      references Utilisateur (codeUser) on delete restrict on update restrict;

alter table Achat add constraint FK_association7 foreign key (codeArt)
      references Article (codeArt) on delete restrict on update restrict;

alter table Article add constraint FK_association1 foreign key (codeCat)
      references Categorie (codeCat) on delete restrict on update restrict;

alter table Utilisateur add constraint FK_association3 foreign key (codeRole)
      references Role (codeRole) on delete restrict on update restrict;

alter table Vente add constraint FK_association5 foreign key (codeClient)
      references Client (codeClient) on delete restrict on update restrict;

alter table Vente add constraint FK_association6 foreign key (codeArt)
      references Article (codeArt) on delete restrict on update restrict;

alter table Vente add constraint FK_association8 foreign key (codeUser)
      references Utilisateur (codeUser) on delete restrict on update restrict;
