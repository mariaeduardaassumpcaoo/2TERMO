-- Parte A — Básico Fundamentos

-- 1. Crie vw_produtos_ativos .
CREATE VIEW VW_PRODUTOS_ATIVOS
AS SELECT ID_PRODUTO, NOME, PRECO
FROM PRODUTO;

-- 2. Consulte apenas produtos da view com preço maior que R$ 10,00.
SELECT ID_PRODUTO, NOME, PRECO
FROM produto
WHERE PRECO >= 10.00;

-- 3. Liste todas as views do banco.
SELECT TABLE_NAME FROM information_schema.VIEWS
WHERE TABLE_SCHEMA = DATABASE ();

-- 4. Exiba a definição de vw_produtos_ativos .
SELECT * FROM vw_produto_ativos;

-- Parte B — Relacionamentos Intermediário

-- 5. Crie vw_produtos_categorias usando INNER JOIN.
CREATE VIEW vw_produtos_categorias AS
SELECT PR.NOME AS PRODUTO, CA.NOME AS CATEGORIA
FROM PRODUTO PR
INNER JOIN CATEGORIA CA
ON PR.ID_CATEGORIA = CA.ID_CATEGORIA;

-- 6. Crie vw_pedidos_clientes .
CREATE VIEW VW_PEDIDOS_CLIENTES
AS SELECT ID_CLIENTE, NOME
FROM CLIENTES;
-- 7. Consulte somente pedidos FINALIZADOS pela view.

-- 8. Crie uma view com pedido, produto, quantidade, preço unitário e
-- subtotal.

-- Parte C — Relatórios Intermediário/
-- Avançado

-- 9. Crie vw_vendas_por_produto com SUM e GROUP BY.

-- 10. Liste os produtos pelo maior faturamento.

-- 11. Crie uma view que apresente todos os clientes e a quantidade de
-- pedidos, inclusive zero.

-- 12. Descubra, pela view anterior, clientes que nunca compraram.

-- Parte D — Manutenção

-- 13. Use CREATE OR REPLACE para acrescentar id_categoria em uma
-- view.

-- 14. Crie uma view simples e teste uma atualização permitida pelo SGBD.

-- 15. Crie uma view de produtos ativos com WITH CHECK OPTION e
-- analise seu efeito.

-- 16. Remova uma view de teste com DROP VIEW IF EXISTS.