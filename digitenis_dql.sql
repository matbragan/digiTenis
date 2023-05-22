USE digitenis;

/*Cadastrar novos fornecedores*/
INSERT INTO fornecedor (id_fornecedor, cnpj, nome, email)
VALUES (21, '6478912300015', 'Olympikus', 'contato@olympikus.com.br');


/*Cadastrar novos produtos*/
INSERT INTO produto (id_produto, nome, tamanho, categoria, valor_compra, valor_venda, id_fornecedor)
VALUES (21, 'Anyway 2', 39, 'Corrida', 80, 119.90, 21);


/*Cadastrar novos funcionários*/
INSERT INTO funcionario (id_funcionario, primeiro_nome, sobrenome, cpf, cargo)
VALUES (19, 'Gisele', 'Oliveira', '45695135726', 'Vendedor');


/*Efetivar vendas*/
INSERT INTO venda (id_venda, valor_total, data, hora, id_funcionario)
VALUES (29, 359.70, CAST((GETDATE()) AS date), CAST((GETDATE()) AS TIME), 19);

INSERT INTO item_venda (id_produto, id_venda, quantidade, desconto)
VALUES (21, 29, 3, 35.97);


/*Visualizar informações de contato dos fornecedores*/
SELECT nome, email FROM fornecedor;


/*Atualizar valor de venda dos produtos*/
UPDATE produto
SET valor_venda = 323.73
WHERE id_produto = 21;


/*Visualizar estoque por produto*/
SELECT p.id_produto, p.nome, p.tamanho, e.quantidade
    FROM produto AS p
    INNER JOIN estoque AS e ON p.id_produto = e.id_produto
    WHERE  p.id_produto = 20; 


/*Visualizar vendas do dia*/
SELECT v.data, p.nome, i.quantidade, i.desconto, v.valor_total
    FROM venda AS v
    INNER JOIN item_venda AS i ON v.id_venda = i.id_venda
    INNER JOIN produto AS p ON i.id_produto = p.id_produto
    WHERE v.data = '2023-03-21';
    

/*Visualizar dias com maiores vendas*/
SELECT [data], SUM(valor_total) AS 'valor_total'
    FROM venda
    GROUP BY [data]   
    ORDER BY valor_total DESC;


/*Visualizar funcionários com maiores vendas*/
SELECT f.primeiro_nome AS Funcionario, ROUND(SUM(v.valor_total),2) AS Valor_Total
    FROM venda AS v
    INNER JOIN funcionario AS f ON v.id_funcionario = f.id_funcionario
    GROUP BY primeiro_nome
    ORDER BY valor_total DESC;


/*Visualizar lista dos itens comprados por venda*/
SELECT iv.id_venda, p.nome, p.tamanho, p.categoria, v.data, iv.quantidade FROM item_venda iv
INNER JOIN produto p ON p.id_produto = iv.id_produto
INNER JOIN venda v ON v.id_venda = iv.id_venda
ORDER BY id_venda;


/*Visualizar lista dos itens mais vendidos por funcionário*/
SELECT f.primeiro_nome, p.nome, SUM(iv.quantidade) 'Qtd' FROM venda v
INNER JOIN item_venda iv ON iv.id_venda = v.id_venda
INNER JOIN produto p ON p.id_produto = iv.id_produto
INNER JOIN funcionario f ON f.id_funcionario = v.id_funcionario
GROUP BY f.primeiro_nome, p.nome
ORDER BY f.primeiro_nome, Qtd DESC;


/*Visualizar média de saída de cada produto por dia*/
SELECT p.nome, AVG(iv.quantidade) AS 'media_saida' FROM item_venda iv
INNER JOIN venda v ON v.id_venda = iv.id_venda
INNER JOIN produto p ON p.id_produto = iv.id_produto
GROUP BY p.nome;


/*Calcular a quantidade de dias em que o estoque deve romper, considerando a média de saída diária dos produtos*/
SELECT e.id_produto, e.quantidade, saida.media_saida, (e.quantidade / saida.media_saida) AS 'previsao_dias_rompimento' FROM estoque e
INNER JOIN (
	SELECT p.id_produto, AVG(iv.quantidade) AS 'media_saida' FROM item_venda iv
	INNER JOIN venda v ON v.id_venda = iv.id_venda
	INNER JOIN produto p ON p.id_produto = iv.id_produto
	GROUP BY p.id_produto
) saida ON saida.id_produto = e.id_produto;


/*Atualizar dados cadastrais dos fornecedores*/
UPDATE fornecedor
SET email = 'contato2@fila.com.br'
WHERE id_fornecedor = 10;


/*Atualizar dados cadastrais dos funcionários*/
UPDATE funcionario
SET cargo = 'Gerente'
WHERE id_funcionario = 12;

/*Visualizar média dos valores de vendas*/
SELECT AVG(valor_total) AS 'media_valor_total'
FROM venda;


/*Visualizar média de itens por venda*/
SELECT COUNT(v.id_venda) AS 'total_vendas', SUM(i.quantidade) AS 'total_itens_vendidos', ROUND((SUM(CAST(i.quantidade AS float))/COUNT(v.id_venda)),2) AS 'media_itens_por_venda'
FROM venda v
INNER JOIN item_venda i ON i.id_venda = v.id_venda

/*Visualizar categoria de produto que mais é vendido*/
SELECT p.categoria, SUM(iv.quantidade) AS 'quantidade'
FROM item_venda iv
INNER JOIN produto p ON p.id_produto = iv.id_produto
GROUP BY p.categoria
ORDER BY quantidade DESC;


/*Dar baixa no estoque*/
UPDATE estoque
SET quantidade = quantidade - 1
WHERE id_produto = 3;


/*Dar entrada no estoque*/
UPDATE estoque
SET quantidade = quantidade + 1
WHERE id_produto = 3;
