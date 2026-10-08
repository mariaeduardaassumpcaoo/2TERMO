-- ============================================================
-- AULA 09 - ATIVIDADE PRÁTICA DE DQL
-- Nome: MARIA EDUARDA SAMPAIO ASSMPÇÃO.
-- Turma: 2DEVIS Data: 08-10-2026
-- Base: smartcoffee_dql
-- ============================================================
USE smartcoffee_dml_duda;

-- PARTE A - AQUECIMENTO

-- 1. Liste todos os clientes cadastrados.
SELECT *
FROM CLIENTES;

-- 2. Exiba apenas nome, cidade e e-mail dos clientes.
SELECT NOME, CIDADE, EMAIL
FROM CLIENTES;

-- 3. Liste os nomes das cidades sem repetir valores.
SELECT DISTINCT CIDADE
FROM CLIENTES;

-- 4. Liste todos os produtos em ordem crescente de preço.
SELECT NOME, PRECO   
FROM produto
ORDER BY PRECO ASC;

-- 5. Mostre apenas os 5 produtos mais caros.
SELECT PRECO  
FROM produto
ORDER BY PRECO DESC
LIMIT 5;

-- PARTE B - FILTROS

-- 6. Liste os produtos com preço entre R$ 8,00 e R$ 15,00.
SELECT NOME, PRECO 
FROM produto
WHERE PRECO BETWEEN 8.00 AND 15.00;

-- 7. Liste os clientes das cidades Limeira ou Americana.
SELECT NOME, CIDADE
FROM clientes
WHERE CIDADE IN ('LIMEIRA', 'AMERICANA')

-- 8. Localize os produtos cujo nome contém a palavra “Café”.
SELECT NOME 
FROM produto
WHERE NOME LIKE 'CAFÉ%';
-- 9. Liste os clientes que não informaram telefone.
SELECT NOME, TELEFONE
FROM clientes
WHERE TELEFONE IS NULL;

-- 10. Mostre os pedidos FINALIZADOS com valor acima de R$ 20,00,
--     do maior para o menor valor.
SELECT *
FROM PEDIDO
WHERE STATUS_PEDIDO = 'FINALIZADO'
  AND VALOR_TOTAL > 20.00
ORDER BY VALOR_TOTAL DESC;

-- PARTE C - CÁLCULOS E AGRUPAMENTOS

-- 11. Informe quantos produtos estão cadastrados.
SELECT COUNT(*) AS PRODUTOS_CADASTRADOS
FROM PRODUTO;

-- 12. Mostre menor preço, maior preço e preço médio dos produtos.
SELECT MIN(PRECO) AS MENOR_PREÇO, MAX(PRECO) AS MAIOR_PREÇO, AVG(PRECO) AS MÉDIA_PREÇO
FROM PRODUTO;

-- 13. Informe quantos clientes existem em cada cidade.
SELECT CIDADE, COUNT (*) QUANTIDADE_CLIENTES
FROM clientes
GROUP BY CIDADE;

-- 14. Mostre somente as cidades que possuem dois ou mais clientes.
SELECT CIDADE, COUNT (*) AS QUANTIDADE_CLIENTES
FROM clientes
GROUP BY CIDADE
HAVING COUNT (*) >= 2;

-- 15. Calcule o faturamento total considerando apenas pedidos FINALIZADOS.
SELECT SUM(VALOR_TOTAL) AS TOTAL
FROM pedido
WHERE STATUS_PEDIDO = 'FINALIZADOS';
