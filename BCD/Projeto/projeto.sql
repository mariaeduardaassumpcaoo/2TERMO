-- Active: 1794486225299@@127.0.0.1@3308@projeto_almoxarifado

USE PROJETO_ALMOXARIFADO;


-- ==========================================
-- ==========================================

ALTER TABLE MOVIMENTACOES
ADD COLUMN id_fornecedores INT,
ADD COLUMN quantidade_movimentada INT DEFAULT 1;

ALTER TABLE MOVIMENTACOES
ADD FOREIGN KEY (id_fornecedores)
REFERENCES FORNECEDORES(id_fornecedores);


-- ==========================================
-- ==========================================

INSERT INTO MATERIAIS
(descricao, nome, valor_unitario, unidade_medida, localizacao)
VALUES
('Chapa de aço carbono', 'Chapa de Aço 1020', 85.50, 'unidade', 'Galpão A'),
('Parafuso industrial', 'Parafuso M10', 2.50, 'unidade', 'Galpão A'),
('Tinta industrial', 'Tinta Azul', 45.00, 'litro', 'Galpão B');

INSERT INTO FORNECEDORES
(cnpj, email, nome, telefone, cidade)
VALUES
('12.345.678/0001-90', 'contato@aco.com', 'Aço Brasil', '1933332222', 'Campinas'),
('98.765.432/0001-10', 'contato@pecas.com', 'Peças Industrial', '1933334444', 'Sumaré');

INSERT INTO ESTOQUE
(estoque_anual, quantidade_minima, prateleira, quantidade_maxima, quantidade_atual)
VALUES
(2026, 30, 'A01', 200, 100),
(2026, 20, 'A02', 150, 80),
(2026, 10, 'B01', 100, 50);

INSERT INTO SETOR
(codigo, nome, status, localizacao, responsavel)
VALUES
('S01', 'Usinagem', 'disponivel', 'Galpão A', 'Carlos'),
('S02', 'Montagem', 'disponivel', 'Galpão B', 'João');


-- ==========================================
-- ==========================================

SET @material1 = (SELECT id_materiais FROM MATERIAIS WHERE nome = 'Chapa de Aço 1020' LIMIT 1);
SET @material2 = (SELECT id_materiais FROM MATERIAIS WHERE nome = 'Parafuso M10' LIMIT 1);
SET @material3 = (SELECT id_materiais FROM MATERIAIS WHERE nome = 'Tinta Azul' LIMIT 1);

SET @fornecedor1 = (SELECT id_fornecedores FROM FORNECEDORES WHERE nome = 'Aço Brasil' LIMIT 1);
SET @fornecedor2 = (SELECT id_fornecedores FROM FORNECEDORES WHERE nome = 'Peças Industrial' LIMIT 1);

SET @estoque1 = (SELECT id_estoque FROM ESTOQUE WHERE prateleira = 'A01' LIMIT 1);
SET @estoque2 = (SELECT id_estoque FROM ESTOQUE WHERE prateleira = 'A02' LIMIT 1);
SET @estoque3 = (SELECT id_estoque FROM ESTOQUE WHERE prateleira = 'B01' LIMIT 1);

SET @setor1 = (SELECT id_setor FROM SETOR WHERE codigo = 'S01' LIMIT 1);
SET @setor2 = (SELECT id_setor FROM SETOR WHERE codigo = 'S02' LIMIT 1);

INSERT INTO FORNECE VALUES
(@material1, @fornecedor1),
(@material2, @fornecedor2),
(@material3, @fornecedor1);

INSERT INTO PRECISA VALUES
(@material1, @estoque1),
(@material2, @estoque2),
(@material3, @estoque3);


-- ==========================================
-- ==========================================

UPDATE MATERIAIS
SET valor_unitario = 90.00
WHERE id_materiais = @material1;


-- ==========================================
-- ==========================================

DELIMITER //

CREATE PROCEDURE sp_movimentar_estoque(
    IN p_material INT,
    IN p_fornecedor INT,
    IN p_setor INT,
    IN p_quantidade INT,
    IN p_tipo VARCHAR(10),
    IN p_observacao VARCHAR(255)
)
BEGIN
    DECLARE v_estoque INT;
    DECLARE v_saldo INT;

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
        SET MESSAGE_TEXT = 'Quantidade deve ser maior que zero';
    END IF;

    SELECT E.id_estoque, E.quantidade_atual
    INTO v_estoque, v_saldo
    FROM ESTOQUE E
    INNER JOIN PRECISA P
    ON E.id_estoque = P.id_estoque
    WHERE P.id_materiais = p_material
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

    IF p_tipo <> 'ENTRADA' AND p_tipo <> 'SAIDA' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Tipo invalido';
    END IF;

    INSERT INTO MOVIMENTACOES
    (ramal, data_movimentacao, observacao, tipo_movimentacao,
    movimentacoes_mensais, id_setor, id_fornecedores,
    quantidade_movimentada)
    VALUES
    (NULL, CURDATE(), p_observacao, p_tipo,
    NULL, p_setor, p_fornecedor, p_quantidade);

    SET @nova_movimentacao = LAST_INSERT_ID();

    INSERT INTO ENVOLVE
    (id_materiais, id_movimentacoes)
    VALUES
    (p_material, @nova_movimentacao);

    IF p_tipo = 'ENTRADA' THEN

        UPDATE ESTOQUE
        SET quantidade_atual = quantidade_atual + p_quantidade
        WHERE id_estoque = v_estoque;

    ELSE

        UPDATE ESTOQUE
        SET quantidade_atual = quantidade_atual - p_quantidade
        WHERE id_estoque = v_estoque;

    END IF;

    COMMIT;

END //

DELIMITER ;


-- ==========================================
-- ==========================================

CALL sp_movimentar_estoque(
    @material1,
    NULL,
    @setor1,
    20,
    'SAIDA',
    'Saida de material para usinagem'
);


-- ==========================================
-- ==========================================

CREATE OR REPLACE VIEW vw_relatorio_movimentacoes AS
SELECT
    MO.id_movimentacoes,
    MA.nome AS material,
    FO.nome AS fornecedor,
    SE.nome AS setor,
    MO.tipo_movimentacao,
    MO.data_movimentacao,
    MO.quantidade_movimentada,
    MO.observacao
FROM MOVIMENTACOES MO
INNER JOIN ENVOLVE EV
ON MO.id_movimentacoes = EV.id_movimentacoes
INNER JOIN MATERIAIS MA
ON EV.id_materiais = MA.id_materiais
LEFT JOIN FORNECEDORES FO
ON MO.id_fornecedores = FO.id_fornecedores
LEFT JOIN SETOR SE
ON MO.id_setor = SE.id_setor;


-- ==========================================
-- ==========================================

CREATE OR REPLACE VIEW vw_saldo_materiais AS
SELECT
    MA.id_materiais,
    MA.nome AS material,
    MA.valor_unitario,
    ES.quantidade_atual,
    ES.quantidade_minima,
    ES.prateleira,
    (MA.valor_unitario * ES.quantidade_atual) AS valor_total
FROM MATERIAIS MA
INNER JOIN PRECISA PR
ON MA.id_materiais = PR.id_materiais
INNER JOIN ESTOQUE ES
ON PR.id_estoque = ES.id_estoque;


-- ==========================================
-- ==========================================


SELECT *
FROM vw_relatorio_movimentacoes
ORDER BY data_movimentacao DESC;



SELECT *
FROM vw_saldo_materiais
ORDER BY material;



SELECT
    tipo_movimentacao,
    COUNT(*) AS total_movimentacoes,
    SUM(quantidade_movimentada) AS quantidade_total
FROM MOVIMENTACOES
GROUP BY tipo_movimentacao;




SELECT
    MA.nome AS material,
    ES.quantidade_atual,
    ES.quantidade_minima,
    ES.prateleira
FROM MATERIAIS MA
INNER JOIN PRECISA PR
ON MA.id_materiais = PR.id_materiais
INNER JOIN ESTOQUE ES
ON PR.id_estoque = ES.id_estoque
WHERE ES.quantidade_atual <= ES.quantidade_minima;




SELECT
    MA.nome AS material,
    FO.nome AS fornecedor,
    FO.cidade
FROM MATERIAIS MA
INNER JOIN FORNECE F
ON MA.id_materiais = F.id_materiais
INNER JOIN FORNECEDORES FO
ON F.id_fornecedores = FO.id_fornecedores;


-- ==========================================
-- ==========================================

START TRANSACTION;

UPDATE ESTOQUE
SET quantidade_atual = quantidade_atual + 5
WHERE id_estoque = @estoque1;

SELECT *
FROM ESTOQUE
WHERE id_estoque = @estoque1;

COMMIT;


-- ==========================================

-- ==========================================

-- Exemplo de exclusão de fornecedor sem movimentações:

-- DELETE FROM FORNECEDORES
-- WHERE id_fornecedores = @fornecedor2
-- AND NOT EXISTS (
--     SELECT 1
--     FROM MOVIMENTACOES
--     WHERE id_fornecedores = @fornecedor2
-- );


-- ==========================================
-- ==========================================

CREATE INDEX idx_mov_data
ON MOVIMENTACOES(data_movimentacao);

EXPLAIN
SELECT *
FROM MOVIMENTACOES
WHERE data_movimentacao >= '2026-11-01';


-- ==========================================
-- ==========================================

SELECT * FROM MATERIAIS;
SELECT * FROM FORNECEDORES;
SELECT * FROM ESTOQUE;
SELECT * FROM SETOR;
SELECT * FROM MOVIMENTACOES;

SELECT * FROM vw_relatorio_movimentacoes;
SELECT * FROM vw_saldo_materiais;