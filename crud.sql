-- Aqui você deve colocar os códigos SQL referentes às
-- Simulações de um CRUD

-- Criação
-- 1)
INSERT INTO clientes (nome, lealdade)
VALUES
('Georgia', 0);

-- 2)
INSERT INTO pedidos (status, cliente_id)
VALUES
('Recebido', 6); 

-- 3)
INSERT INTO produtos_pedidos (pedido_id, produto_id)
VALUES
(6, 1),
(6, 2),
(6, 6),
(6, 8),
(6, 8);

-- Leitura
-- 1)
SELECT
  clientes.*, pedidos.*, produtos.*
FROM
  produtos_pedidos
  JOIN pedidos ON pedidos.id = produtos_pedidos.pedido_id
  JOIN clientes ON clientes.id = produtos_pedidos.pedido_id
  JOIN produtos ON produtos.id = produtos_pedidos.produto_id
  WHERE
  clientes.nome = 'Georgia';

-- Atualização
-- 1)
	-- CHECANDO PONTOS DE LEALDADE DE GEORGIA
	SELECT
	  SUM(produtos.pts_de_lealdade)
	FROM
	  produtos_pedidos
	  JOIN pedidos ON pedidos.id = produtos_pedidos.pedido_id
	  JOIN clientes ON clientes.id = produtos_pedidos.pedido_id
	  JOIN produtos ON produtos.id = produtos_pedidos.produto_id
	  WHERE
	  clientes.nome = 'Georgia';
	-- RESULTADO : 48
	-- SETANDO OS NOVOS PONTOS DE GEORGIA
	UPDATE
	clientes
	SET 
	lealdade = 48
	WHERE 
	nome = 'Georgia';

-- Deleção
-- 1)
DELETE FROM 
	clientes
   	WHERE
   	clientes.nome = 'Marcelo' RETURNING *;