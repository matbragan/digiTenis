# pucminas-projeto2
Projeto: Projeto e Desenvolvimento de Sistema de Banco de Dados Relacional - 2023/01
<br>
2º projeto da graduação Banco de Dados - PUC Minas
<br>
<hr>

**Grupo**:<br>
Felipe Siman Nogueira<br>
Letícia Dumêt Passos<br>
Matheus Bragança Soares de Oliveira<br>
Priscila Costa da Silva<br>
Ricardo Freitas dos Santos Filho<br>
Vinícius Evangelista<br>
<br>

### 1 Introdução
O setor tecnológico sempre esteve em constante evolução na nossa sociedade e se tornou peça fundamental nas estratégias de desenvolvimento e melhorias das empresas, trazendo maior eficiência na gestão, aumento da produtividade, redução de custos, projeção de mercado e otimização dos processos internos e externos que envolvem a organização e os seus stakeholders. O objetivo deste trabalho é desenvolver um banco de dados a ser utilizado na empresa do ramo de varejo calçadista, para um sistema de gerenciamento de processos de cadastro, gestão de estoque e vendas de seus produtos.
<br><br>
Conhecida pela sua extensa opção de marcas e modelos e pelo atendimento realizado pelos seus mais de 15 colaboradores, a empresa DigiTênis, de pequeno porte, é especializada na comercialização de tênis no segmento feminino, masculino e infantil, com numerações que variam do 32 ao 45. Seus processos de cadastro, controle de estoque e venda dos produtos são feitos manualmente, refletindo negativamente na organização de informações e entrega de um serviço de qualidade aos seus clientes. Além disso, notou-se a baixa na produtividade da equipe devido a morosidade nos processos, informações inconsistentes e consequentes prejuízos à gestão.
<br><br>
Neste contexto, considerando as características levantadas e infraestrutura observada, será realizado um levantamento e análise dos requisitos funcionais identificados, assim como a elaboração do projeto conceitual, lógico e físico para o desenvolvimento do banco de dados relacional para a empresa.
<br><br>

### 2 Especificação do minimundo
A DigiTênis é uma empresa física de pequeno porte que ainda usa processos manuais para gerenciamento de seus produtos e tomadas de decisões, visto seu alto crescimento dos últimos tempos, este tipo de processo se tornou inviável, fazendo com que a empresa invista em uma gestão de dados, ficando como primeiro passo para isso a construção de um sistema de banco de dados relacional.
<br><br>
Tal sistema será responsável pela linha de tempo dos produtos, desde seu fornecimento, estoque até sua venda, sendo possível também fazer associações de qual funcionário o vendeu, e as características desta venda, como descontos, quantidade de itens, etc.
<br><br>
A entidade **fornecedor** terá como atributos informações referentes à empresa fornecedora daquele produto, como CNPJ, nome fantasia, e-mail e telefone. Após o fornecimento deste produto teremos as entidades **produto** e **estoque**, onde serão armazenados os dados dos produtos - nome, tamanho, categoria, cor, valor de compra e valor de venda - e do estoque - quantidade - respectivamente.
<br><br>
Com a venda de algum produto da DigiTênis na loja física teremos a entidade **item venda** - com a quantidade de produtos vendidos e o desconto dado no produto - a entidade **venda** - com a data da venda e o valor total daquela venda - e a entidade funcionário - com o nome, o cpf e o cargo do funcionário que efetuou aquela venda.
<br><br>
O relacionamento entre todas essas entidades é de suma importância, uma vez que um depende do outro para existir, por exemplo, a venda depende do funcionário para existir, o produto depende do fornecedor para existir, e assim por diante, mais abaixo teremos um diagrama mostrando todos esses relacionamentos.
<br><br>

### 2.1 Requisitos funcionais
Com o funcionamento do sistema de banco de dados relacional da empresa DigiTênis há alguns requisitos funcionais a serem cumpridos. Na tabela 1 temos a frequência de algumas das principais consultas a serem feitas no sistema:
<br><br>

Tabela 1: Frequência esperada de consultas no sistema
Consulta		                                           | Frequência
:----------------------------------------------------- | :---------:
Q001 - Visualizar estoque do produto                   | Alta
Q002 - Atualizar estoque do produto                    | Média
Q003 - Visualizar informações de contato do fornecedor | Média
Q004 - Adicionar/Atualizar fornecedor                  | Baixa
Q005 - Adicionar/Atualizar funcionário                 | Baixa
Q006 - Adicionar/Atualizar produto                     | Média
Q007 - Adicionar/Atualizar venda                       | Alta
Q008 - Visualizar vendas do funcionário                | Baixa
Q009 - Visualizar vendas do dia                        | Baixa

<br>

### 3 Projeto Conceitual
