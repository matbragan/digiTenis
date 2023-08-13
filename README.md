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
Vinícius Evangelista<br>
<br>

### Etapa 1
**Definição do grupo de trabalho e do objetivo do projeto**

### Etapa 2
**Projeto Conceitual do Banco de Dados**
- [erd_conceptual_model.brM3](https://github.com/matbragan/pucminas-projeto2/blob/main/erd_conceptual_model.brM3)

### Etapa 3
**Projeto Lógico do Banco de Dados**
- [eer_logical_model.brM3](https://github.com/matbragan/pucminas-projeto2/blob/main/eer_logical_model.brM3)

### Etapa 4
**Projeto Físico do Banco de Dados**
- [digitenis_ddl.sql](https://github.com/matbragan/pucminas-projeto2/blob/main/digitenis_ddl.sql)
- [digitenis_dml.sql](https://github.com/matbragan/pucminas-projeto2/blob/main/digitenis_dml.sql)
- [digitenis_dql.sql](https://github.com/matbragan/pucminas-projeto2/blob/main/digitenis_dql.sql)

### Etapa 5
**Dataframes em Python**
- [functional_requirements.ipynb](https://github.com/matbragan/pucminas-projeto2/blob/main/functional_requirements.ipynb)

<br>
<hr>
<br>

### Criação do banco de dados via Docker
~~~sh
sudo docker run \
-e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=digiTenis1@" \
-p 1433:1433 --name digiTenis --hostname digiTenis -d \
mcr.microsoft.com/mssql/server:2019-latest
~~~
- usuário: sa
- senha: digiTenis1@

<br>

[Conectando no banco de dados do SQLServer pelo Python](https://tryolabs.com/blog/2012/06/25/connecting-sql-server-database-python-under-ubuntu)
