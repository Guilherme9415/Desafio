CREATE DATABASE Desafio​123;
​
USE Desafio​123;

CREATE TABLE Raca (
  Id INT PRIMARY KEY IDENTITY(1,1),  
  Nome VARCHAR(100) NOT NULL
);

CREATE TABLE Classe (
  Id INT PRIMARY KEY IDENTITY(1,1), 
  Descricao VARCHAR(600) NOT NULL
);

CREATE TABLE Personagem (
  Id INT PRIMARY KEY IDENTITY(1,1), 
  Raca_Id INT,
  Classe_Id INT,
  Nome VARCHAR(100),
  PoworLevel FLOAT,
  Id_Raca INT,
  Id_Classe INT,
  CONSTRAINT Rel_03 FOREIGN KEY(Raca_Id) REFERENCES Raca(Id),
  CONSTRAINT Rel_02 FOREIGN KEY(Classe_Id) REFERENCES Classe(Id)​
);

CREATE TABLE InfoRaca (
  Id INT PRIMARY KEY IDENTITY(1,1), 
  Raca_Id INT,
  Id_Raca INT,
  Descricao	Varchar(500),
  CONSTRAINT Rel_01 FOREIGN KEY(Raca_Id) REFERENCES Raca(Id)
);

INSERT INTO Raca(Nome)
VALUES ('Saiyajin'),
('Raça do Freeza'),
('Namekuseijin'),
('Tsufurujin'),
('Shin-jin'),
('Majin'),
('Androide'),
('demonio');

INSERT INTO Classe (Descricao)
VALUES ('Halfs Saya-Jin s'),
('Saya-Jin s Classe Baixa'),
('Saya-Jin s Classe Alta'),
('Príncipe Saya-Jins'),
('Rei Saya-Jins'),​
('Kaiohshins'),
('Kaiohs'),​
('Ciborgues'),
('Tipos de construção artificial total'),
('Bio-Androides'),
( 'Gueirreiro Z'),
('Freeza gold');
​
INSERT INTO Personagem(Raca_Id, Classe_Id, Nome, PoworLevel, Id_Raca, Id_Classe )
VALUES (2,12,'freeza',4900,2,12),
 (3,11,'piccolo',3200,3,11),
 (1,2,'Goku',101000,1,2),
 (5,6,'Kaiohshins',1300,5,6),
 (5,7,'Grande Kaioh ',1600,5,7),
 (5,7,'Kaioh-sama',3100,5,7),
 (5,7,'Minami no Kaiō',400,5,7),
 (7,8,'Androide 17',5000,7,8),
 (7,8,'Androide 18',3500,7,8),
 (7,8,'Androide 16',500,7,8),
 (1,4,'Vegeta',3500,1,4),
 (1,5,'Rei Vegeta',16000,1,5);

INSERT INTO InfoRaca( Raca_Id, Id_Raca, Descricao )
VALUES (1,1,'são uma raça guerreira que foi quase toda extinta por Freeza antes do começo da série Dragon Ball. '),
(2,2,' é um dos vilões mais significativos no mangá Dragon Ball e nos animes Dragon Ball Z e Dragon Ball Super.'),
(3,3,'Em Dragon Ball, os Namekuseijins na série eram conhecidos como Clã Demônio e pensava-se que eram terrestres.'),
(4,4,'oram uma raça altamente avançada em tecnologia nativos do Planeta Planta. Porém, o planeta foi dominado pelos Saiyajin, deixando os Tsufurujin extintos.'),
(5,5,'são uma raça de seres do Planeta Kaishin. Os Shinjins são a verdadeira raça da qual todos os Kaioh e Kaiohshin'),
(6,6,'é uma raça na franquia Dragon Ball. Eles estream com Majin Boo no capítulo 460 do manga Dragon Ball'),
(7,7,'são Terráqueos cyborgs/robóticos, a maioria criados pelo cientista Dr. Gero. É dito que maioria dos androides têm energia ilimitada e vida eterna. '),
(8,8,'são criaturas más que usam seu poder para tormentar, torturar e/ou matar aqueles mais fracos que si');

 SELECT* FROM Classe;
 SELECT* FROM InfoRaca;
 SELECT* FROM Personagem;
 SELECT* FROM Raca;
   
-- 01
    SELECT p."Id",
           p."Classe_Id",
	   p."Nome"
    FROM Personagem p
	  INNER JOIN Raca
	     ON p.Raca_Id = Raca.Id
    WHERE PoworLevel < 1000 AND  Raca.Nome = 'Shin-jin';


    SELECT p."Id",
           p."Classe_Id",
	   p."Nome"
    FROM Personagem p
	  INNER JOIN Raca
	    ON p.Raca_Id = Raca.Id
    WHERE PoworLevel < 1000 AND Raca.Nome LIKE '%Shin-jin%';
	

-- 02
  SELECT TOP 5 NOME, PoworLevel FROM (

    SELECT p."Nome",
	   p."PoworLevel"
    FROM Personagem p
	  INNER JOIN Raca 
	     ON p.Raca_Id = Raca.Id
   WHERE p.PoworLevel BETWEEN 3000 AND 5000 

)  AS tb_1 ORDER BY PoworLevel DESC;


-- 03
 SELECT
	  p.Nome AS Personagem, 
	  r.Nome AS Raca, 
	  ir.Descricao,
	(
		CASE
			WHEN p.PoworLevel > 8000 
				THEN 'Maior que 8.000'
			ELSE 'E 37 Caralho birrr'
        END
	) AS Mensagem, 
	p.PoworLevel 
 FROM Personagem p
	INNER JOIN Raca r 
	   ON r.Id = p.Raca_Id 
	INNER JOIN InfoRaca ir  
	   ON ir.Raca_Id = r.Id;


-- 04
  SELECT r."Id",
	 r."Nome",
	 p."Raca_Id"
  FROM Personagem p
   INNER JOIN Raca r
     ON p.Raca_Id = r.Id
  WHERE r.Nome = 'Androide';
