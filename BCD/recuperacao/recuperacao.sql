-- Active: 1794486225299@@127.0.0.1@3308@retrogame_recuperacao
CREATE DATABASE IF NOT EXISTS RETROGAME_RECUPERACAO;
USE RETROGAME_RECUPERACAO;
DROP DATABASE RETROGAME_RECUPERACAO;

-- FASE 1

CREATE TABLE IF NOT EXISTS PLATAFORMA (
    ID_PLATAFORMA INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(80) NOT NULL UNIQUE
);

----------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CATEGORIA (
    ID_CATEGORIA INT PRIMARY KEY AUTO_INCREMENT,
    DESCRICAO VARCHAR(80) NOT NULL UNIQUE
);

---------------------------------------------------------------------

CREATE TABLE CLIENTE (
    ID_CLIENTE INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(100) NOT NULL,
    EMAIL VARCHAR(120) NOT NULL UNIQUE,
    TELEFONE VARCHAR(20) NULL,
    ATIVO BOOLEAN DEFAULT TRUE
);

---------------------------------------------------------------------

CREATE TABLE JOGO (
    ID_JOGO INT PRIMARY KEY AUTO_INCREMENT,
    TITULO VARCHAR(150) NOT NULL,
    CODIGO VARCHAR(15) NOT NULL UNIQUE,
    ANO_LANCAMENTO INT NOT NULL,
    QUANTIDADE_DISPONIVEL INT DEFAULT 0
    CHECK (QUANTIDADE_DISPONIVEL >= 0),
    ID_PLATAFORMA INT NOT NULL,
    ID_CATEGORIA INT NOT NULL,
    CONSTRAINT FK_PLATAFORMA FOREIGN KEY (ID_PLATAFORMA) REFERENCES PLATAFORMA (ID_PLATAFORMA),
    CONSTRAINT FK_CATEGORIA FOREIGN KEY (ID_CATEGORIA) REFERENCES CATEGORIA (ID_CATEGORIA)
);

------------------------------------------------------------------------

CREATE TABLE LOCACAO (
    ID_LOCACAO INT PRIMARY KEY AUTO_INCREMENT,
    DATA_RETIRADA DATETIME DEFAULT CURRENT_TIMESTAMP,
    DATA_PREVISTA DATE NOT NULL,
    DATA_DEVOLUCAO DATE NULL,
    STATUS_LOCACAO VARCHAR(20) DEFAULT 'ABERTA' CHECK 
    (STATUS_LOCACAO IN ('ABERTA', 'DEVOLVIDO', 'ATRASADO')), 
    ID_CLIENTE INT NOT NULL,
    ID_JOGO INT NOT NULL,
    CONSTRAINT FK_CLIENTE FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE (ID_CLIENTE),
    CONSTRAINT FK_JOGO FOREIGN KEY (ID_JOGO) REFERENCES JOGO (ID_JOGO)
);

-------------------------------------------------------------------------

ALTER TABLE JOGO ADD DESENVOLVEDORA VARCHAR(100);

--------------------------------------------------------------------------

-- FASE 2

INSERT INTO CLIENTE (NOME, EMAIL, TELEFONE, ATIVO) VALUES 
('ANA', 'ANA@EMAIL.COM',  NULL, TRUE),
('LUCAS', 'LUCAS@EMAIL.COM', '199817382', TRUE),
('LUANA', 'LUANA@EMAIL.COM', '19189992737', TRUE),
('LAVINIA', 'LAVINIA@EMAIL.COM', '1983643739', TRUE);

--------------------------------------------------------------------------

INSERT INTO PLATAFORMA (NOME) VALUES
('GOOGLE PLAY GAMES'),
('EPIC GAMES STORE');

 --------------------------------------------------------------------------

INSERT INTO CATEGORIA (DESCRICAO) VALUES
('TERROR'),
('ESTRATEGIA');

--------------------------------------------------------------------------------

SELECT * FROM PLATAFORMA;
SELECT * FROM CATEGORIA;
 
----------------------------------------------------------------------------------

INSERT INTO JOGO (TITULO, CODIGO, ANO_LANCAMENTO, QUANTIDADE_DISPONIVEL, ID_PLATAFORMA, ID_CATEGORIA) VALUES
('GENSHIN IMPACT', '111', 1980, 30, 1, 2),
('ROBLOX', '222', 2000, 40, 1, 2),
('AMONG US', '333', 2020, 60, 1, 2),
('TEAMFIGHT TACTICS', '444', 1992, 12, 1, 2),
('BRAWL STARS', '555', 2010, 22, 1, 2),
('STARDEW VALLEY', '666', 1999, 10, 1 ,2);

-----------------------------------------------------------------------------------

SELECT * FROM CLIENTE;
SELECT * FROM JOGO;

----------------------------------------------------------------------------------

INSERT INTO locacao (DATA_RETIRADA, DATA_PREVISTA, DATA_DEVOLUCAO, STATUS_LOCACAO, ID_CLIENTE, ID_JOGO) VALUES 
('2026-10-11', '2026-10-20', '2026-10-25', 'ABERTA', 1, 7),
('2026-11-10', '2026-11-20', '2026-11-25', 'ABERTA', 2, 8),
('2026-05-11', '2026-05-20', '2026-05-25', 'ABERTA', 3, 9),
('2026-01-11', '2026-01-20', '2026-01-25', 'DEVOLVIDO', 4, 10);

-----------------------------------------------------------------------------------

UPDATE cliente
SET TELEFONE = '128273289'
WHERE ID_CLIENTE = 1;

----------------------------------------------------------------------------------
UPDATE jogo
SET QUANTIDADE_DISPONIVEL = QUANTIDADE_DISPONIVEL + 2
WHERE ANO_LANCAMENTO = 2000

---------------------------------------------------------------------------------

-- FASE 3

SELECT * FROM JOGO;

----------------------------------------------------------------------------------

SELECT * FROM JOGO
WHERE QUANTIDADE_DISPONIVEL > 2
ORDER BY QUANTIDADE_DISPONIVEL DESC;

-----------------------------------------------------------------------------------

SELECT TITULO FROM jogo
WHERE TITULO LIKE '%US%';

------------------------------------------------------------------------------------

SELECT TITULO, ANO_LANCAMENTO FROM JOGO 
WHERE ANO_LANCAMENTO BETWEEN 1990 AND 2005;

-------------------------------------------------------------------------------------

SELECT COUNT(*) AS TOTAL_JOGOS FROM JOGO;
SELECT SUM(QUANTIDADE_DISPONIVEL) AS TOTAL_DISPONIVEL FROM JOGO;
SELECT MIN(QUANTIDADE_DISPONIVEL) AS QUANTIDADE_MINIMA FROM JOGO;
SELECT MAX(QUANTIDADE_DISPONIVEL) AS QUANTIDADE_MAXIMA FROM JOGO;
SELECT AVG(QUANTIDADE_DISPONIVEL) AS MEDIA_DISPONIVEL FROM JOGO;

------------------------------------------------------------------------------------
-- INNER JOIN








--------------------------------------------------------------------------------------
SELECT L.STATUS_LOCACAO
FROM locacao AS L
INNER JOIN CLIENTE AS C
ON C.ID_CLIENTE = C.ID_CLIENTE
WHERE L.STATUS_LOCACAO = 'ABERTA';

---------------------------------------------------------------------------------------
SELECT ID_CLIENTE, COUNT(*) AS STATUS_LOCACAO
FROM LOCACAO 
GROUP BY ID_CLIENTE
ORDER BY STATUS_LOCACAO DESC;

---------------------------------------------------------------------------------------
SELECT C.NOME, C.ID_CLIENTE, L.ID_LOCACAO
FROM CLIENTE AS C
LEFT JOIN LOCACAO AS L
ON L.ID_LOCACAO = C.ID_CLIENTE  
ORDER BY C.NOME;

---------------------------------------------------------------------------------------

-- FASE 4

INSERT INTO locacao (DATA_RETIRADA, DATA_PREVISTA, DATA_DEVOLUCAO, STATUS_LOCACAO, ID_CLIENTE, ID_JOGO) VALUES 
('2026-12-11', '2026-12-20', '2026-12-25', 'ABERTA', 1, 12),

START TRANSACTION;
UPDATE JOGO
SET QUANTIDADE_DISPONIVEL = < 1
WHERE