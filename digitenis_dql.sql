USE digitenis

/*Cadastrar novos fornecedores*/
INSERT INTO fornecedor (id_fornecedor, cnpj, nome, email)
VALUES (id_fornecedor, '[CNPJ Fornecedor]', '[Nome Fornecedor]', '[E-mail Fornecedor]')


/*Cadastrar novos produtos*/
INSERT INTO produto (id_produto, nome, tamanho, categoria, valor_compra, valor_venda, id_fornecedor)
VALUES (id_produto, '[Nome Produto]', tamanho, '[Categoria Produto]', valor_compra, valor_venda, id_fornecedor)


/*Cadastrar novos funcionários*/
INSERT INTO funcionario (id_funcionario, primeiro_nome, sobrenome, cpf, cargo)
VALUES (id_funcionario, '[Primeiro Nome]', '[Sobrenome]', '[CPF]', '[Cargo Funcionário]')


/*Efetivar vendas*/
INSERT INTO venda (id_venda, valor_total, data, hora, id_funcionario)
VALUES (id_venda, valor_total, CAST((GETDATE()) AS date), CAST((GETDATE()) AS TIME), id_funcionario)

INSERT INTO item_venda (id_produto, id_venda, quantidade, desconto)
VALUES (id_produto, id_venda, quantidade, desconto)


/*Visualizar informações de contato dos fornecedores*/
SELECT * FROM fornecedor
    WHERE nome = '[Nome Fornecedor]';


/*Atualizar valor de venda dos produtos*/
UPDATE produto
    SET valor_venda = valor
    WHERE id_produto = id_produto;


/*Visualizar estoque por produto*/
SELECT p.id_produto, p.nome, p.tamanho, e.quantidade
    FROM produto AS p
    INNER JOIN estoque AS e ON p.id_produto = e.id_produto
    WHERE  p.id_produto = id_produto; 


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
ORDER BY id_venda


/*Visualizar lista dos itens mais vendidos por funcionário*/
SELECT f.primeiro_nome, p.nome, SUM(iv.quantidade) 'Qtd' FROM venda v
INNER JOIN item_venda iv ON iv.id_venda = v.id_venda
INNER JOIN produto p ON p.id_produto = iv.id_produto
INNER JOIN funcionario f ON f.id_funcionario = v.id_funcionario
GROUP BY f.primeiro_nome, p.nome
ORDER BY f.primeiro_nome, Qtd DESC


/*Visualizar média de saída de cada produto por dia*/
SELECT p.nome, AVG(iv.quantidade) AS 'media_saida' FROM item_venda iv
INNER JOIN venda v ON v.id_venda = iv.id_venda
INNER JOIN produto p ON p.id_produto = iv.id_produto
GROUP BY p.nome


/*Calcular a quantidade de dias em que o estoque deve romper, considerando a média de saída diária dos produtos*/



/*Visualizar quantidade de fornecedores ativos cadastrados*/ -- temos um campo para identificar se está ativo?
SELECT * FROM fornecedor


/*Atualizar dados cadastrais dos fornecedores*/



/*Atualizar dados cadastrais dos funcionários*/



/*Visualizar média dos valores de vendas*/



/*Visualizar média de itens por venda*/



/*Visualizar categoria de produto que mais é vendido*/



/*Dar baixa no estoque*/



/*Dar entrada no estoque*/

