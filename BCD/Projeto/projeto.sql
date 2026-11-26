-- Active: 1794486225299@@127.0.0.1@3308@projeto_almoxarifado

USE PROJETO_ALMOXARIFADO;


-- =========================================
-- =========================================

INSERT INTO MATERIAIS
(DESCRICAO, NOME, VALOR_UNITARIO, UNIDADE_MEDIA, LOCALIZACAO)
SELECT 'Chapa de aço carbono', 'Chapa de Aço 1020', 85.50, 'unidade', 'Galpão A'
WHERE NOT EXISTS (
    SELECT 1 FROM MATERIAIS
    WHERE NOME = 'Chapa de Aço 1020'
);

INSERT INTO MATERIAIS
(DESCRICAO, NOME, VALOR_UNITARIO, UNIDADE_MEDIA, LOCALIZACAO)
SELECT 'Parafuso industrial', 'Parafuso M10', 2.50, 'unidade', 'Galpão A'
WHERE NOT EXISTS (
    SELECT 1 FROM MATERIAIS
    WHERE NOME = 'Parafuso M10'
);

INSERT INTO MATERIAIS
(DESCRICAO, NOME, VALOR_UNITARIO, UNIDADE_MEDIA, LOCALIZACAO)
SELECT 'Tinta industrial', 'Tinta Azul', 45.00, 'litro', 'Galpão B'
WHERE NOT EXISTS (
    SELECT 1 FROM MATERIAIS
    WHERE NOME = 'Tinta Azul'
);


-- =========================================
-- =========================================

INSERT INTO FORNECEDORES
(CNPJ, EMAIL, NOME, TELEFONE, CIDADE)
SELECT '12.345.678/0001-90', 'contato@aco.com',
'Aço Brasil', '1933332222', 'Campinas'
WHERE NOT EXISTS (
    SELECT 1 FROM FORNECEDORES
    WHERE CNPJ = '12.345.678/0001-90'
);

INSERT INTO FORNECEDORES
(CNPJ, EMAIL, NOME, TELEFONE, CIDADE)
SELECT '98.765.432/0001-10', 'contato@pecas.com',
'Peças Industrial', '1933334444', 'Sumaré'
WHERE NOT EXISTS (
    SELECT 1 FROM FORNECEDORES
    WHERE CNPJ = '98.765.432/0001-10'
);


-- =========================================
-- =========================================

INSERT INTO ESTOQUE
(ESTOQUE_ANUAL, QUANTIDADE_MINIMA, PRATELEIRA,
QUANTIDADE_MAXIMA, QUANTIDADE_ATUAL)
SELECT 2026, 30, 'A01', 200, 100
WHERE NOT EXISTS (
    SELECT 1 FROM ESTOQUE
    WHERE PRATELEIRA = 'A01'
);

INSERT INTO ESTOQUE
(ESTOQUE_ANUAL, QUANTIDADE_MINIMA, PRATELEIRA,
QUANTIDADE_MAXIMA, QUANTIDADE_ATUAL)
SELECT 2026, 20, 'A02', 150, 80
WHERE NOT EXISTS (
    SELECT 1 FROM ESTOQUE
    WHERE PRATELEIRA = 'A02'
);

INSERT INTO ESTOQUE
(ESTOQUE_ANUAL, QUANTIDADE_MINIMA, PRATELEIRA,
QUANTIDADE_MAXIMA, QUANTIDADE_ATUAL)
SELECT 2026, 10, 'B01', 100, 50
WHERE NOT EXISTS (
    SELECT 1 FROM ESTOQUE
    WHERE PRATELEIRA = 'B01'
);


-- =========================================
-- =========================================

INSERT INTO SETOR
(CODIGO, NOME, STATUS, LOCALIZACAO, RESPONSAVEL)
SELECT 'S01', 'Usinagem', 'disponivel', 'Galpão A', 'Carlos'
WHERE NOT EXISTS (
    SELECT 1 FROM SETOR
    WHERE CODIGO = 'S01'
);

INSERT INTO SETOR
(CODIGO, NOME, STATUS, LOCALIZACAO, RESPONSAVEL)
SELECT 'S02', 'Montagem', 'disponivel', 'Galpão B', 'João'
WHERE NOT EXISTS (
    SELECT 1 FROM SETOR
    WHERE CODIGO = 'S02'
);


-- =========================================
-- =========================================

SET @material1 = (
    SELECT ID_MATERIAIS FROM MATERIAIS
    WHERE NOME = 'Chapa de Aço 1020' LIMIT 1
);

SET @material2 = (
    SELECT ID_MATERIAIS FROM MATERIAIS
    WHERE NOME = 'Parafuso M10' LIMIT 1
);

SET @material3 = (
    SELECT ID_MATERIAIS FROM MATERIAIS
    WHERE NOME = 'Tinta Azul' LIMIT 1
);

SET @fornecedor1 = (
    SELECT ID_FORNECEDORES FROM FORNECEDORES
    WHERE CNPJ = '12.345.678/0001-90' LIMIT 1
);

SET @fornecedor2 = (
    SELECT ID_FORNECEDORES FROM FORNECEDORES
    WHERE CNPJ = '98.765.432/0001-10' LIMIT 1
);

SET @estoque1 = (
    SELECT ID_ESTOQUE FROM ESTOQUE
    WHERE PRATELEIRA = 'A01' LIMIT 1
);

SET @estoque2 = (
    SELECT ID_ESTOQUE FROM ESTOQUE
    WHERE PRATELEIRA = 'A02' LIMIT 1
);

SET @estoque3 = (
    SELECT ID_ESTOQUE FROM ESTOQUE
    WHERE PRATELEIRA = 'B01' LIMIT 1
);

SET @setor1 = (
    SELECT ID_SETOR FROM SETOR
    WHERE CODIGO = 'S01' LIMIT 1
);

SET @setor2 = (
    SELECT ID_SETOR FROM SETOR
    WHERE CODIGO = 'S02' LIMIT 1
);


-- =========================================
-- =========================================

INSERT INTO FORNECE
(ID_MATERIAIS, ID_FORNECEDORES)
SELECT @material1, @fornecedor1
WHERE NOT EXISTS (
    SELECT 1 FROM FORNECE
    WHERE ID_MATERIAIS = @material1
    AND ID_FORNECEDORES = @fornecedor1
);

INSERT INTO FORNECE
(ID_MATERIAIS, ID_FORNECEDORES)
SELECT @material2, @fornecedor2
WHERE NOT EXISTS (
    SELECT 1 FROM FORNECE
    WHERE ID_MATERIAIS = @material2
    AND ID_FORNECEDORES = @fornecedor2
);

INSERT INTO FORNECE
(ID_MATERIAIS, ID_FORNECEDORES)
SELECT @material3, @fornecedor1
WHERE NOT EXISTS (
    SELECT 1 FROM FORNECE
    WHERE ID_MATERIAIS = @material3
    AND ID_FORNECEDORES = @fornecedor1
);


-- =========================================
-- =========================================

INSERT INTO PRECISA
(ID_MATERIAIS, ID_ESTOQUE)
SELECT @material1, @estoque1
WHERE NOT EXISTS (
    SELECT 1 FROM PRECISA
    WHERE ID_MATERIAIS = @material1
    AND ID_ESTOQUE = @estoque1
);

INSERT INTO PRECISA
(ID_MATERIAIS, ID_ESTOQUE)
SELECT @material2, @estoque2
WHERE NOT EXISTS (
    SELECT 1 FROM PRECISA
    WHERE ID_MATERIAIS = @material2
    AND ID_ESTOQUE = @estoque2
);

INSERT INTO PRECISA
(ID_MATERIAIS, ID_ESTOQUE)
SELECT @material3, @estoque3
WHERE NOT EXISTS (
    SELECT 1 FROM PRECISA
    WHERE ID_MATERIAIS = @material3
    AND ID_ESTOQUE = @estoque3
);


-- =========================================
-- =========================================

UPDATE MATERIAIS
SET VALOR_UNITARIO = 90.00
WHERE ID_MATERIAIS = @material1;


-- =========================================
-- =========================================

DROP PROCEDURE IF EXISTS sp_movimentar_estoque;

DELIMITER $$

CREATE PROCEDURE sp_movimentar_estoque(
    IN p_material INT,
    IN p_setor INT,
    IN p_quantidade INT,
    IN p_tipo VARCHAR(10),
    IN p_observacao VARCHAR(255)
)

BEGIN

    DECLARE v_estoque INT DEFAULT NULL;
    DECLARE v_saldo INT DEFAULT NULL;
    DECLARE v_movimentacao INT;

    DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET v_estoque = NULL;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    IF p_quantidade <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Quantidade invalida';
    END IF;

    IF p_tipo NOT IN ('ENTRADA', 'SAIDA') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Tipo invalido';
    END IF;

    SELECT E.ID_ESTOQUE, E.QUANTIDADE_ATUAL
    INTO v_estoque, v_saldo
    FROM ESTOQUE E
    INNER JOIN PRECISA P
    ON E.ID_ESTOQUE = P.ID_ESTOQUE
    WHERE P.ID_MATERIAIS = p_material
    LIMIT 1
    FOR UPDATE;

    IF v_estoque IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Estoque nao encontrado';
    END IF;

    IF p_tipo = 'SAIDA' AND v_saldo < p_quantidade THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Estoque insuficiente';
    END IF;

    INSERT INTO MOVIMENTACOES
    (
        RAMAL,
        DATA_MOVIMENTACAO,
        OBSERVACAO,
        TIPO_MOVIMENTACAO,
        MOVIMENTACOES_MENSAIS,
        ID_SETOR,
        quantidade_movimentada
    )
    VALUES
    (
        '101',
        NOW(),
        p_observacao,
        p_tipo,
        1,
        p_setor,
        p_quantidade
    );

    SET v_movimentacao = LAST_INSERT_ID();

    INSERT INTO ENVOLVE
    (ID_MATERIAIS, ID_MOVIMENTACOES)
    VALUES
    (p_material, v_movimentacao);

    IF p_tipo = 'ENTRADA' THEN

        UPDATE ESTOQUE
        SET QUANTIDADE_ATUAL = QUANTIDADE_ATUAL + p_quantidade
        WHERE ID_ESTOQUE = v_estoque;

    ELSE

        UPDATE ESTOQUE
        SET QUANTIDADE_ATUAL = QUANTIDADE_ATUAL - p_quantidade
        WHERE ID_ESTOQUE = v_estoque;

    END IF;

    COMMIT;

END $$

DELIMITER ;


-- =========================================
-- =========================================

CALL sp_movimentar_estoque(
    @material1,
    @setor1,
    20,
    'SAIDA',
    'Saida de material para usinagem'
);


-- =========================================
-- =========================================


SELECT
    MO.ID_MOVIMENTACOES,
    MA.NOME AS MATERIAL,
    FO.NOME AS FORNECEDOR,
    SE.NOME AS SETOR,
    MO.TIPO_MOVIMENTACAO,
    MO.DATA_MOVIMENTACAO,
    MO.quantidade_movimentada,
    MO.OBSERVACAO

FROM MOVIMENTACOES MO

INNER JOIN ENVOLVE EV
ON MO.ID_MOVIMENTACOES = EV.ID_MOVIMENTACOES

INNER JOIN MATERIAIS MA
ON EV.ID_MATERIAIS = MA.ID_MATERIAIS

LEFT JOIN FORNECE F
ON MA.ID_MATERIAIS = F.ID_MATERIAIS

LEFT JOIN FORNECEDORES FO
ON F.ID_FORNECEDORES = FO.ID_FORNECEDORES

LEFT JOIN SETOR SE
ON MO.ID_SETOR = SE.ID_SETOR;


-- =========================================
-- =========================================

SELECT
    MA.ID_MATERIAIS,
    MA.NOME AS MATERIAL,
    MA.VALOR_UNITARIO,
    ES.QUANTIDADE_ATUAL,
    ES.QUANTIDADE_MINIMA,
    ES.PRATELEIRA,
    MA.VALOR_UNITARIO * ES.QUANTIDADE_ATUAL AS VALOR_TOTAL

FROM MATERIAIS MA

INNER JOIN PRECISA PR
ON MA.ID_MATERIAIS = PR.ID_MATERIAIS

INNER JOIN ESTOQUE ES
ON PR.ID_ESTOQUE = ES.ID_ESTOQUE;


-- =========================================
-- =========================================


SELECT *
FROM vw_relatorio_movimentacoes
ORDER BY DATA_MOVIMENTACAO DESC;



SELECT *
FROM vw_saldo_materiais
ORDER BY MATERIAL;



SELECT
    TIPO_MOVIMENTACAO,
    COUNT(*) AS TOTAL_MOVIMENTACOES,
    SUM(quantidade_movimentada) AS QUANTIDADE_TOTAL
FROM MOVIMENTACOES
GROUP BY TIPO_MOVIMENTACAO;



SELECT
    MA.NOME AS MATERIAL,
    ES.QUANTIDADE_ATUAL,
    ES.QUANTIDADE_MINIMA,
    ES.PRATELEIRA

FROM MATERIAIS MA

INNER JOIN PRECISA PR
ON MA.ID_MATERIAIS = PR.ID_MATERIAIS

INNER JOIN ESTOQUE ES
ON PR.ID_ESTOQUE = ES.ID_ESTOQUE

WHERE ES.QUANTIDADE_ATUAL <= ES.QUANTIDADE_MINIMA;



SELECT
    MA.NOME AS MATERIAL,
    FO.NOME AS FORNECEDOR,
    FO.CIDADE

FROM MATERIAIS MA

INNER JOIN FORNECE F
ON MA.ID_MATERIAIS = F.ID_MATERIAIS

INNER JOIN FORNECEDORES FO
ON F.ID_FORNECEDORES = FO.ID_FORNECEDORES;


-- =========================================
-- =========================================

START TRANSACTION;

UPDATE ESTOQUE
SET QUANTIDADE_ATUAL = QUANTIDADE_ATUAL + 5
WHERE ID_ESTOQUE = @estoque1;

SELECT *
FROM ESTOQUE
WHERE ID_ESTOQUE = @estoque1;

COMMIT;


-- =========================================
-- =========================================

-- Exemplo de exclusao de fornecedor sem movimentacoes:

-- DELETE FROM FORNECEDORES
-- WHERE ID_FORNECEDORES = @fornecedor2
-- AND NOT EXISTS (
--     SELECT 1
--     FROM MOVIMENTACOES
--     WHERE id_fornecedores = @fornecedor2
-- );


-- =========================================
-- =========================================

DROP INDEX idx_mov_data ON MOVIMENTACOES;

CREATE INDEX idx_mov_data
ON MOVIMENTACOES(DATA_MOVIMENTACAO);

EXPLAIN
SELECT *
FROM MOVIMENTACOES
WHERE DATA_MOVIMENTACAO >= '2026-11-01';


-- =========================================
-- =========================================

SELECT * FROM MATERIAIS;
SELECT * FROM FORNECEDORES;
SELECT * FROM ESTOQUE;
SELECT * FROM SETOR;
SELECT * FROM MOVIMENTACOES;

SELECT * FROM PRECISA;
SELECT * FROM FORNECE;
SELECT * FROM ENVOLVE;

SELECT * FROM vw_relatorio_movimentacoes;
SELECT * FROM vw_saldo_materiais;