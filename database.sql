CREATE TABLE statystyki
  (
     id                  INTEGER NOT NULL IDENTITY,
     ilosc_doswiadczenia INTEGER DEFAULT 0,
     poprawne_odp        INTEGER DEFAULT 0,
     bledne_odp          INTEGER DEFAULT 0,
     PRIMARY KEY(id)
  );

go

CREATE TABLE poziomtrudnosci
  (
     id    INTEGER NOT NULL IDENTITY,
     nazwa VARCHAR(30) NOT NULL UNIQUE,
     PRIMARY KEY(id)
  );

go

CREATE TABLE osiagniecia
  (
     id    INTEGER NOT NULL IDENTITY,
     nazwa VARCHAR(30) NOT NULL UNIQUE,
     opis  VARCHAR(200) NOT NULL UNIQUE,
     PRIMARY KEY(id)
  );

go

CREATE TABLE definicja
  (
     id          INTEGER NOT NULL IDENTITY,
     tlumaczenie VARCHAR(300) NOT NULL,
     PRIMARY KEY(id)
  );

go

CREATE TABLE kategoria
  (
     id    INTEGER NOT NULL IDENTITY,
     nazwa VARCHAR(30) NOT NULL UNIQUE,
     PRIMARY KEY(id)
  );

go

CREATE TABLE uzytkownik
  (
     id            INTEGER NOT NULL IDENTITY,
     statystyki_id INTEGER,
     nazwa         VARCHAR(30) NOT NULL UNIQUE,
     haslo         VARCHAR(30) NOT NULL,
     czy_admin     INTEGER NOT NULL,
     PRIMARY KEY(id),
     FOREIGN KEY(statystyki_id) REFERENCES statystyki(id)
  );

go

CREATE TABLE zgloszenienowe
  (
     id            INTEGER NOT NULL IDENTITY,
     uzytkownik_id INTEGER NOT NULL,
     nazwa         VARCHAR(30) NOT NULL,
     tlumaczenie   VARCHAR(30) NOT NULL,
     opis          VARCHAR(200) NOT NULL,
     PRIMARY KEY(id),
     FOREIGN KEY(uzytkownik_id) REFERENCES uzytkownik(id)
  );

go

CREATE TABLE quiz
  (
     id            INTEGER NOT NULL IDENTITY,
	 numer         INTEGER,
     uzytkownik_id INTEGER,
     data_quizu    DATETIME DEFAULT GETDATE(),
     wynik_koncowy INTEGER,
     PRIMARY KEY(id),
     FOREIGN KEY(uzytkownik_id) REFERENCES uzytkownik(id)
  );

go

CREATE TABLE osiagniecia_has_uzytkownik
  (
     osiagniecia_id INTEGER NOT NULL,
     uzytkownik_id  INTEGER NOT NULL,
     data_zdobycia  DATETIME NOT NULL,
     PRIMARY KEY(osiagniecia_id, uzytkownik_id),
     FOREIGN KEY(osiagniecia_id) REFERENCES osiagniecia(id),
     FOREIGN KEY(uzytkownik_id) REFERENCES uzytkownik(id)
  );

go

CREATE TABLE slowko
  (
     id                 INTEGER NOT NULL IDENTITY,
	 definicja_id       INTEGER NOT NULL,
     poziomtrudnosci_id INTEGER NOT NULL,
     kategoria_id       INTEGER NOT NULL,
     nazwa              VARCHAR(30) NOT NULL UNIQUE,
     PRIMARY KEY(id),
     FOREIGN KEY(kategoria_id) REFERENCES kategoria(id),
     FOREIGN KEY(definicja_id) REFERENCES definicja(id),
     FOREIGN KEY(poziomtrudnosci_id) REFERENCES poziomtrudnosci(id)
  );

go

CREATE TABLE zgloszenieblad
  (
     id            INTEGER NOT NULL IDENTITY,
     slowko_id     INTEGER NOT NULL,
     uzytkownik_id INTEGER NOT NULL,
     PRIMARY KEY(id),
     FOREIGN KEY(uzytkownik_id) REFERENCES uzytkownik(id),
     FOREIGN KEY(slowko_id) REFERENCES slowko(id)
  );

go

CREATE TABLE slowko_has_quiz
  (
     slowko_id    INTEGER NOT NULL,
     quiz_id      INTEGER NOT NULL,
     czy_poprawna INTEGER NOT NULL,
     PRIMARY KEY(slowko_id, quiz_id),
     FOREIGN KEY(slowko_id) REFERENCES slowko(id),
     FOREIGN KEY(quiz_id) REFERENCES quiz(id)
  );

go

CREATE TABLE zgloszenie
  (
     id              INTEGER NOT NULL IDENTITY,
     uzytkownik      VARCHAR(30) NOT NULL,
	 slowko          VARCHAR(30) NOT NULL,
	 data_zgloszenia DATETIME DEFAULT GETDATE(),
     PRIMARY KEY(id)
  );

go

INSERT INTO zgloszenie(uzytkownik, slowko) VALUES 
('user1', 'access'), ('user1', 'debuff'), ('user1', 'ball control'), ('user2', 'artificial turf');

go

INSERT INTO statystyki
            (ilosc_doswiadczenia,
             poprawne_odp,
             bledne_odp)
VALUES      (1000,
             5,
             5),
            (500,
             2,
             3),
            (1500,
             12,
             3),
            (2000,
             2,
             18);

go

INSERT INTO uzytkownik
            (statystyki_id,
             nazwa,
             haslo,
             czy_admin)
VALUES      (1,
             'user1',
             'user1',
             0),
            (2,
             'user2',
             'user2',
             0),
            (3,
             'user3',
             'user3',
             0),
            (4,
             'user4',
             'user4',
             0);

go

INSERT INTO uzytkownik
            (nazwa,
             haslo,
             czy_admin)
VALUES      ('admin1',
             'admin1',
             1),
            ('admin2',
             'admin2',
             1);

go

INSERT INTO kategoria(nazwa) VALUES
('Sport'), ('Muzyka'), ('Motoryzacja'), ('Internet');
GO

INSERT INTO poziomtrudnosci(nazwa) VALUES
('Łatwy'), ('Średni'), ('Trudny');
GO

INSERT INTO definicja(tlumaczenie) VALUES
('styl grzbietowy'), ('posiadanie piłki'), ('profesjonalny klub sportowy'), ('martwy ciąg'),
('znak akcentu w zapisie muzycznym'), ('kontrafagot'), ('różki angielskie'), ('śpiewacz ludowy'),
('dopalacz'), ('elementy budowy pojazdów'), ('wahacz'), ('olej chłodniczy'),
('dostęp'), ('osłabienie'), ('grywalizacja'), ('kliktywista'), ('aerobik'),('łucznictwo'),('sztuczna murawa'),('asysta'),('atletyka'),('badminton'),('piłka'),('koszykówka'),
('stać na bramce'), ('bilard'), ('zadyma'), ('boks'), ('skoki na elastycznej linie'), ('kajakarstwo'), ('liga mistrzów'), ('mistrzostwa'), ('rywalizacja'), ('gol honorowy'), 
('bieg'), ('kort'), ('krykiet'), ('dośrodkować'), ('kolarstwo'), ('gra w rzutki'), ('obrońca'), ('dyscyplina'), ('nurkowanie'), ('wykonać ćwiczenie'), ('gol wyrównujący'),
('dogrywka'), ('fechtunek'), ('piłka nożna'), ('boisko do piłki nożnej'), ('faul'), ('rzut wolny'), ('gra'), ('gol'), ('złota bramka'), ('golf'), ('sala gimnastyczna'), 
('gimnastyka'), ('pomocnik'), ('piłka ręczna'), ('lotniarstwo'), ('główka'), ('jazda konna'), ('hokej'), ('łyżwiarstwo'), ('bieganie'), ('sędzia'), ('rozpoczęcie meczu'), 
('puścić gola'), ('przegrać walkowerem'), ('spalony'), ('gol samobójczy'), ('spadochroniarstwo'), ('podawać piłkę'), ('pole karne'), ('rzut karny'), ('murawa'), 
('grać na remis'), ('sędzia piłkarski'), ('lodowisko'), ('wioślarstwo'), ('trybuna'), ('napastnik'), ('rezerwowy'), ('ławka rezerwowych'), ('rzut z autu'), ('tor'), ('walkower'), 
('wygrać walkowerem'), ('Gitara'), ('Bębenek'), ('Perkusja'), ('Instrument'), ('Skrzypce'), ('Dudy'), ('Flet'), ('Trąbka'), ('Akordeon'), ('Gitara basowa'), ('Wiolonczela'), 
('Fortepian'), ('Harmonijka ustna'), ('Tamburyn'), ('Harfa'), ('Waltornia'), ('Lutnia'), ('Mandolina'), ('Obój'), ('Flet prosty'), ('Puzon'), ('Bałałajka'), ('Bandżo'), 
('Fagot'), ('Kastaniety'), ('Cymbały'), ('Kołatka'), ('Klarnet'), ('Talerz perkusyjny'), ('Kontrabas'), ('Kotły'), ('Werbel'), ('Trójkąt'), ('Tuba'), ('Wibrafon'), ('Zespół'), 
('Nuty'), ('Klucz wiolinowy'), ('Smyczek'), ('Strojenie'), ('Głośnik'), ('karoseria'), ('wycieraczki'), ('antena'), ('szyberdach'), ('bagażnik'), ('zderzak'), ('koło'), 
('koło zapasowe'), ('opona'), ('kołpak'), ('rura wydechowa'), ('tablica rejestracyjna'), ('lusterko boczne'), ('hak holowniczy'), ('silnik'), ('chłodnica'), ('akumulator'), 
('skrzynia biegów'), ('pedał gazu'), ('sprzęgło'), ('klakson'), ('pasek rozrządu'), ('kierownica'), ('kierunkowskaz'), ('światła stopu'), ('światło cofania'), ('pasy'), 
('tempomat'), ('klimatyzacja'), ('kamera cofania'), ('przeglądarka'), ('strona internetowa'), ('system komputerowy'), ('baza danych'), ('nazwa domeny'), ('konto'), ('załącznik'), 
('bajt'), ('kliknąć'), ('polecenie'), ('konfiguracja'), ('połączenie'), ('ciasteczko'), ('kopiować'), ('awaria'), ('kursor'), ('dane'), ('pobierać'), ('emotikon'), ('znaleźć'), 
('forum'), ('darmowe oprogramowanie'), ('haker'), ('instalowac'), ('link'), ('skrzynka pocztowa'), ('niepołączony'), ('połączony'), ('hasło'), ('wirus'), ('serwer');
GO

INSERT INTO slowko(definicja_id, kategoria_id, poziomtrudnosci_id, nazwa) VALUES
(1, 1, 3, 'backstroke'), (2, 1, 2, 'ball control'), (3, 1, 1, 'club'), (4, 1, 2, 'dead lift'),
(5, 2, 2, 'accent mark'), (6, 2, 3, 'contrabassoon'), (7, 2, 3, 'cors anglais'), (8, 2, 1, 'folk singer'),
(9, 3, 1, 'afterburner'), (10, 3, 3, 'auto parts'), (11, 3, 2, 'control arm'), (12, 3, 1, 'cooling oil'),
(13, 4, 1, 'access'), (14, 4, 2, 'debuff'), (15, 4, 3, 'gamification'), (16, 4, 3, 'clicktivist'),

(17, 1, 1, 'aerobics'), (18,1,1,'archery'),(19,1,2,'artificial turf'),(20,1,1,'assist'),
(21,1,2,'athletics'), (22,1,2,'badminton'), (23,1,2,'ball'),(24,1,2,'basketball'),(25,1,2,'be in goal'), (26,1,2,'billiard'), (27,1,2,'bovver'), (28,1,2,'boxing'), 
(29,1,3,'bungee jumping'), (30,1,3,'canoeing'), (31,1,3,'champions league'), (32,1,3,'championship'), (33,1,3,'competition'), (34,1,3,'consolation goal'), (35,1,3,'course'), 
(36,1,1,'court'), (37,1,1,'cricket'), (38,1,1,'cross'), (39,1,1,'cycling'), (40,1,1,'darts'), (41,1,1,'defender'), (42,1,1,'discipline'), (43,1,1,'diving'), (44,1,1,'do an exercise'), 
(45,1,2,'equalizer'), (46,1,2,'extra time'), (47,1,2,'fencing'), (48,1,2,'football'), (49,1,2,'football pitch'), (50,1,2,'foul'), (51,1,2,'free kick'), (52,1,2,'game'), 
(53,1,3,'goal'), (54,1,3,'golden goal'), (55,1,3,'golf'), (56,1,3,'gym'), (57,1,3,'gymnastics'), (58,1,3,'halfback'), (59,1,3,'handball'), (60,1,3,'hang-gliding'), (61,1,3,'header'), 
(62,1,1,'horse riding'), (63,1,1,'ice-hockey'), (64,1,1,'ice-skating'), (65,1,1,'jogging'), (66,1,1,'judge'), (67,1,1,'kick-off'), (68,1,1,'let in a goal'), (69,1,1,'lose by default'), 
(70,1,2,'offside'), (71,1,2,'own goal'), (72,1,2,'parachuting'), (73,1,2,'pass a ball'), (74,1,2,'penalty area'), (75,1,2,'penalty kick'), (76,1,2,'pitch'), (77,1,2,'play to a draw'),
(78,1,3,'referee'), (79,1,3,'rink'), (80,1,3,'rowing'), (81,1,3,'stand'), (82,1,3,'striker'), (83,1,3,'substitute player'), (84,1,3,'substitutes bench'), (85,1,3,'throw-in'), 
(86,1,2,'track'), (87,1,2,'walkover'), (88,1,2,'win by default'), 

(89,2,1,'Guitar'), (90,2,1,'Drum'), (91,2,1,'Drums'), (92,2,1,'Instrument'), (93,2,1,'Violin'), (94,2,1,'Bagpipes'), (95,2,1,'Flute'), (96,2,1,'Trumpet'), (97,2,1,'Accordion'), 
(98,2,2,'Bass guitar'), (99,2,2,'Cello'), (100,2,2,'Grand Piano'), (101,2,2,'Harmonica'), (102,2,2,'Tambourine'), (103,2,2,'Harp'), (104,2,2,'Horn'), (105,2,2,'lute'), (106,2,2,'Mandolin'), 
(107,2,3,'Oboe'), (108,2,3,'Recorder'), (109,2,3,'Trombone'), (110,2,3,'Balalaika'), (111,2,3,'Banjo'),	(112,2,3,'Bassoon'), (113,2,3,'Castanets'), (114,2,3,'Cimbalom'), (115,2,3,'Clapper'),
(116,2,1,'Clarinet'), (117,2,1,'Cymbal'), (118,2,1,'Double Bass'), (119,2,1,'Kettledrums'), (120,2,1,'Snare drum'), (121,2,1,'Triangle'), (122,2,1,'Tuba'), (123,2,1,'Viabraphone'), 
(124,2,1,'Band'), (125,2,1,'Notes'), (126,2,2,'Treble clef'), (127,2,1,'Bow'), (128,2,1,'Tuning'),(129,2,1,'Speaker'),

(130,3,1,'car body'), (131,3,1,'wipers'), (132,3,1,'aerial'), (133,3,1,'sunroof'), (134,3,1,'boot'), (135,3,1,'bumper'), (136,3,1,'wheel'), (137,3,1,'spare wheel'), (138,3,1,'tyre'),
(139,3,2,'hubcap'), (140,3,2,'exhaust pipe'), (141,3,2,'number plate'), (142,3,2,'wing mirror'), (143,3,2,'tow hook'), (144,3,2,'engine'), (145,3,2,'radiator'), (146,3,2,'battery'),
(147,3,3,'gear box'), (148,3,3,'accelerator'), (149,3,3,'clutch'), (151,3,3,'timing belt'), (152,3,3,'steering wheel'), (153,3,2,'indicator'),  (154,3,3,'brake lights'), 
(155,3,1,'reversing light'), (156,3,1,'seat belt'),  (157,3,2,'cruise control'),  (158,3,3,'air conditioning'),  (159,3,3,'backup camera'), 

(160,4,1,'web browser'), (161,4,1,'website'), (162,4,1,'computer system'), (163,4,1,'database'), (164,4,1,'domain name'), (165,4,1,'account'), (166,4,1,'attachment'), (167,4,1,'byte'), 
(168,4,2,'click'), (169,4,2,'command'), (170,4,2,'configuration'), (171,4,2,'connection'), (172,4,2,'cookie'), (173,4,2,'copy'), (174,4,2,'crash'), (175,4,2,'cursor'), (176,4,2,'data'), 
(177,4,3,'download'), (178,4,3,'emoticon'), (179,4,3,'find'), (180,4,3,'forum'), (181,4,3,'freeware'), (182,4,3,'hacker'), (183,4,3,'install'), (184,4,3,'link'), (185,4,3,'mailbox'), 
(186,4,1,'offline'), (187,4,1,'online'), (188,4,2,'password'), (189,4,3,'virus'), (190,4,3,'server');
GO
