DROP DATABASE IF EXISTS RDR2;
CREATE DATABASE RDR2;
USE RDR2;
CREATE TABLE `Nucleo` (
  `ID_Nucleo` integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `Cantidad` integer,
  `Vida` integer,
  `DeadEye` integer,
  `Energia` integer
);

CREATE TABLE `Atributo` (
  `ID_Atributo` integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `ID_Nucleo` integer,
  `Vida` integer,
  `DeadEye` integer,
  `Energia` integer,
  CONSTRAINT FK_ID_Nucleo FOREIGN KEY (ID_Nucleo) REFERENCES Nucleo(ID_Nucleo)
);

CREATE TABLE `Objeto` (
  `ID_Objeto` integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `Stock` integer,
  `Nombre_Objeto` varchar(40) NOT NULL,
  `ID_Atributo` integer,
  CONSTRAINT FK_ID_Atributo FOREIGN KEY (ID_Atributo) REFERENCES Atributo(ID_Atributo)
);

CREATE TABLE `Tienda` (
  `ID_Tienda` integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `Nombre_Tienda` varchar(20) NOT NULL,
  `ID_Objeto` integer,
  CONSTRAINT FK_ID_Objeto FOREIGN KEY (ID_Objeto) REFERENCES Objeto(ID_Objeto)
);

-- 1. Inserts --

INSERT INTO Nucleo (ID_Nucleo,Cantidad,Vida,Energia,DeadEye)
VALUES(1,100,90,80,50),
(2,100,90,80,60)
;

INSERT INTO Atributo (ID_Atributo,ID_Nucleo,Vida,DeadEye,Energia)
VALUES(1,1,100,100,100)
;

INSERT INTO Objeto (ID_Objeto,Stock,Nombre_Objeto)
VALUES(1,3,"Canned Apricots"),
(2,3,"Canned Corned Beef"),
(3,4,"Baked Beans"),
(4,5,"Canned Sweetcorn"),
(5,3,"Canned Kidney Beans"),
(6,2,"Canned Peas"),
(7,1,"Canned Peaches"),
(8,3,"Canned Pineapples"),
(9,1,"Canned Strawberry"),
(10,1,"Assorted Salted Offal"),
(11,6,"Canned Salmon"),
(12,20,"Apple"),
(13,15,"Corn"),
(14,10,"Carrot"),
(15,15,"Peach"),
(16,10,"Pear"),
(17,8,"Beetroot"),
(18,0,"Celery"),
(19,20,"Bay Bolete"),
(20,12,"Chanterelle"),
(21,5,"Parasol Mushroom"),
(22,5,"Almonds"),
(24,6,"Assorted Biscuits"),
(25,10,"Beets"),
(26,30,"Bread Chunk"),
(27,10,"Bread Roll"),
(28,15,"Candies"),
(29,10,"Classic Oatcakes"),
(30,5,"Crackers"),
(31,4,"Fine Brandy"),
(32,6,"Gin"),
(33,0,"Ground Coffee"),
(34,6,"Guarma Rum"),
(35,10,"Hay"),
(36,2,"Kentucky Bourbon"),
(37,4,"Stringy Meat, Plain"),
(38,5,"Herptile, Plain"),
(39,10,"Gritty Fish, Plain"),
(40,3,"Game Bird, Plain"),
(41,4,"Gristly Mutton, Plain"),
(42,5,"Tender Pork, Plain"),
(43,6,"Game Meat, Plain"),
(44,10,"Succulent Fish, Plain"),
(45,0,"Exotic Bird, Plain"),
(46,0,"Big Game Meat, Plain"),
(47,10,"Premium Cigarettes"),
(48,3,"Raspberry"),
(49,2,"Salted Beef"),
(50,2,"Sugar Cube")
;

INSERT INTO Tienda (ID_Tienda,Nombre_Tienda,ID_Objeto)
VALUES(1,'Valentine',1)
;
-- 2. Select --
SELECT Nombre_Objeto, Stock, Nombre_Tienda
FROM Objeto
JOIN Tienda ON Objeto.ID_Objeto = Tienda.ID_Objeto;

SELECT Atributo.ID_Nucleo
FROM Atributo
JOIN Nucleo ON Atributo.ID_Nucleo = Nucleo.ID_Nucleo;

SELECT Stock, COUNT(*) AS Cantidad_Objetos
FROM Objeto
GROUP BY Stock;

SELECT ID_Objeto, Nombre_Objeto, Stock
FROM Objeto
ORDER BY Stock ASC;

SELECT ID_Atributo, COUNT(*) AS Cantidad_Objetos
FROM Objeto
GROUP BY ID_Atributo;

-- 3. Update --
UPDATE Objeto
SET Stock = 4
WHERE ID_Objeto = 1
AND Nombre_Objeto = 'Canned Apricots'
AND Stock = 3;

UPDATE Objeto
SET Nombre_Objeto = "Shadow Elixir"
WHERE ID_Objeto = 2
AND Stock = 3;

-- DELETE --
DELETE FROM Objeto
WHERE ID_Objeto = 50
AND Nombre_Objeto = 'Sugar Cube';

DELETE FROM Objeto
WHERE ID_Objeto = 48
AND Stock = 3;
