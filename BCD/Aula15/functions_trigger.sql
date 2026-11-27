-- Active: 1794486225299@@127.0.0.1@3308@smartcoffee_procedures_duda

-- Function: Armzena uma rotina criada dentro do MYSQL que recebe parâmetros, executa uma lógica e devolve um valor com RETURN.

-- Exemplos de utilização
-- Calculo de frete (valor do frete)
-- Escola (classificar médias com aprovado e reprovado)
-- Financeiro (calcular juros - valor corrigido)
-- Estoque (situação estoque - opções de checagem)

--EX 0: Estrutura básica
CREATE FUNCTION NOME_FUNCAO(PARAMETRO TIPO)
RETURNS TIPO_DE_RETORNO
DETERMINISTIC
BEGIN
    -- PROCESSAMENTO
    RETURN VALOR;
END $$
DELIMITER;
-- obs: RETURNS: INFORMA QUAL TIPO SERÁ DEVOLVIDO. RETURN INFORMA O RESULTADO DEVOLVIDO.

-- EX 1: TOTAL DE ITEM
DELIMITER $$
CREATE FUNCTION CALCULAR_TOTAL_ITEM
(P_PRECO DECIMAL(10,2), P_QUANTIDADE INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN P_PRECO * P_QUANTIDADE;
END $$
DEMILITER;

-- OBS: AGORA A FUNÇÃO PODE SER USADA COMO SE FOSSE UMA FUNÇÃO NATIVA.
-- APRESENTAR O RESULTADO DA FUNCTION.
SELECT NOME, PRECO, CALCULAR_TOTAL_ITEM(PRECO, 3) AS TOTAL_3_UNIDADES
FROM PRODUTO;