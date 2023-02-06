# Criando uma base de dados e também uma API.
## Objetivos
- [x] O objetivo desse código é desenvolver uma API que integra com um banco de dados SQL para persistência dos dados.

A aplicação back-end aqui desenvolvida consegue *criar*, *atualizar*, *remover* e *selecionar* dados da base SQL.<br>

## Configurando Ambiente:
Para preparar o ambiente para funcionamento da aplicação será necessário uma base de dados SQL Server rodando localmente, seja conteinerizada (como por exemplo o docker) ou não, além de um interpretador da linguagem Python.

No arquivo "[base.py](./bd/base.py)" é possível ajustar previamente as credenciais de acesso ao banco de dados.

Também é requerida a instalação via executável (Python e Postman) e via linha de comando das dependências abaixo. É necessário que os comandos de terminal sejam executados na pasta raiz do projeto.<br>

### Dependências:
- [Python 3.11](https://www.python.org/downloads/)
- [Postman](https://www.postman.com/downloads/)
```sh
- pip install pyodbc
```
```sh
- pip install pydantic
```
```sh
- pip install Faker==0.7.4
```
```sh
- pip install fastapi
```
```sh
- pip install uvicorn
```

## Executando a aplicação
Para executar a aplicação back-end, é necessário executar/abrir o terminal, navegar até a pasta do   projeto e rodar o seguinte comando:
```sh
uvicorn main:app --reload
```
Após o comando acima ser executado com sucesso a API estará sendo executada e escutando requisições na porta 8000 da máquina "[localhost](http://127.0.0.1:8000/docs#/default)" e por meio da interface web da FastAPI é possível executar também consultas e comandos de inserção por ela.

Caso queira executar umas operações via terminal, deixei um arquivo chamado "[terminal_crud](./terminal_crud.py)", onde dá pra navegar também nas opções que a API oferece.<br>

Nos quesitos solicitados com relação a configuração do banco de dados foram executados os seguintes passos:

### Banco de Dados

- [x] 0 - Criar base de dados chamada _mybase_ e definir ela como atual para operações.

- [x] 1 - Criar script para criação da tabela **Pessoas**:
    - Campos:
        - **idPessoa** (Chave Primária)
        - **nome**
        - **dataNascimento**
        - **salario**
        - **observacoes**

- [x] 2 - Criar script para alteração da tabela **Pessoas**:
    - Campos a adicionar:
        - **nomeMae**
        - **nomePai**
        - **cpf**

- [x] 3 - Criar um script para adicionar índices de pesquisa a tabela **Pessoas**:
    - Índices para as colunas:
        - **nome**
        - **dataNascimento**

- [x] 4 - Criar um script para adicionar índice/chave única a tabela **Pessoas**:
    - Chave única:
        - **cpf**

- [x] 5 - Criar um script para criar uma procedure de **inserção** de registros:
    - Procedure deverá receber como parâmetros os campos da tabela **Pessoas**.
    - Procedure deverá retornar para a API o valor do campo **idPessoa**.

- [x] 6 - Criar um script para criar uma procedure de **atualização** de registros:
    - Procedure deverá receber como parâmetros os campos da tabela **Pessoas**.
    - Procedure deverá retornar para a API o valor **OK**.

- [x] 7 - Criar um script para criar uma procedure de **remoção** de registros:
    - Procedure deverá receber como parâmetros o **idPessoa** a ser removido da tabela de **Pessoas**.
    - Procedure deverá retornar para a API o valor **OK**.

- [x] 8 - Criar um script para criar uma procedure de **seleção** de todos os registros:
    - Procedure deverá retornar todos os registros existentes na tabela de **Pessoas**.

- [x] 9 - Criar um script para criar uma procedure de **obter** um registro:
    - Procedure deverá receber como parâmetros o **idPessoa** a ser selecionado na tabela.

- [x] 10 - Criar um script para inserir dados na tabela de **Pessoas** através da procedure de **inserção**.

- [x] 11 - Criar um script para atualizar dados na tabela de **Pessoas** através da procedure de **atualização**.

- [x] 12 - Criar um script para remover dados na tabela de **Pessoas** através da procedure de **remoção**.

- [x] 13 - Criar um script para selecionar registros na tabela de **Pessoas** através da procedure de **seleção** de
todos os registros.

- [x] 14 - Criar um script para selecionar um registro na tabela de **Pessoas** através da procedure de **seleção** de
um registro.

- [x] 15 - Testar a execução dos scripts no banco de dados.

Há na pasta "[scripts_automaticos](./regras/banco/scripts_automaticos/)" os scripts gerados pelo sistema gerente de banco de dados SQL Server Management Studio.<br>
Já na pasta "[scripts_manuais](./regras/banco/scripts_manuais/)" os scripts que fiz manualmente a cada inserção de nova funcionalidade na estrutura do banco.

### API
- [x] 1 - Criar um controller para manipular os dados da tabela de Pessoas.

- [x] 2 - Criar uma rota para **criar** registros na tabela de Pessoas.
    - [x] Método deverá receber um _JSON_ com os campos da tabela de Pessoas.
    - [x] Método deverá conectar ao banco de dados.
    - [x] Método deverá chamar a procedure de criação passando os parâmetros recebidos.
    - [x] Método deverá **imprimir** no console o “_id_” retornado pela procedure.

- [x] 3 - Criar uma rota para **atualizar** registros na tabela de Pessoas.
    - [x] Método deverá receber um JSON com os campos da tabela de Pessoas.
    - [x] Método deverá conectar ao banco de dados.
    - [x] Método deverá chamar a procedure de atualização passando os parâmetros recebidos.
    - [x] Método deverá **imprimir** no console o texto retornado pela procedure.

- [x] 4 - Criar uma rota para **remover** registros na tabela de Pessoas.
    - [x] Método deverá receber o “_id_” do registro a ser removido na tabela de Pessoas.
    - [x] Método deverá conectar ao banco de dados.
    - [x] Método deverá chamar a procedure de remoção passando o “_id_” do registro a ser removido.
    - [x] Método deverá **imprimir** no console o texto retornado pela procedure.

- [x] 5 - Criar uma rota para **selecionar todos** os registros na tabela de Pessoas.
    - [x] Método deverá conectar ao banco de dados.
    - [x] Método deverá chamar a procedure de seleção de pessoas.
    - [x] Método deverá **imprimir** no console os dados dos registros retornados pela procedure.

- [x] 6 - Criar uma rota para **selecionar um** registro na tabela de Pessoas.
    - [x] Método deverá receber o “_id_” do registro a ser selecionado na tabela de Pessoas.
    - [x] Método deverá conectar ao banco de dados.
    - [x] Método deverá chamar a procedure de obter passando o “_id_” do registro a ser obtido.
    - [x] Método deverá **imprimir** no console os dados do registro retornado pela procedure.

- [x] 7 - Criar arquivo com chamadas de teste a API com o _Postman_.

O arquivo "[API-Pessoas-Desafio-Dev.postman_collection.json](./API-Pessoas-Desafio-Dev.postman_collection.json)" possui uma **Postman Collection** para interação com a API desenvolvida.
