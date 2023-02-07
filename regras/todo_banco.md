## Banco de Dados

-[x] 0 - Criar base de dados chamada _mybase_ e definir ela como atual para operações.

-[x] 1 - Criar script para criação da tabela **Pessoas**:
    - Campos:
        - **idPessoa** (Chave Primária)
        - **nome**
        - **dataNascimento**
        - **salario**
        - **observacoes**

-[x] 2 - Criar script para alteração da tabela **Pessoas**:
    - Campos a adicionar:
        - **nomeMae**
        - **nomePai**
        - **cpf**

-[x] 3 - Criar um script para adicionar índices de pesquisa a tabela **Pessoas**:
    - Índices para as colunas:
        - **nome**
        - **dataNascimento**

-[x] 4 - Criar um script para adicionar índice/chave única a tabela **Pessoas**:
    - Chave única:
        - **cpf**

-[x] 5 - Criar um script para criar uma procedure de **inserção** de registros:
    - Procedure deverá receber como parâmetros os campos da tabela **Pessoas**.
        - Procedure deverá retornar para a API o valor do campo **idPessoa**.

-[x] 6 - Criar um script para criar uma procedure de **atualização** de registros:
    - Procedure deverá receber como parâmetros os campos da tabela **Pessoas**.
    - Procedure deverá retornar para a API o valor **OK**.

-[x] 7 - Criar um script para criar uma procedure de **remoção** de registros:
    - Procedure deverá receber como parâmetros o **idPessoa** a ser removido da tabela de **Pessoas**.
    - Procedure deverá retornar para a API o valor **OK**.

-[x] 8 - Criar um script para criar uma procedure de **seleção** de todos os registros:
    - Procedure deverá retornar todos os registros existentes na tabela de **Pessoas**.

-[x] 9 - Criar um script para criar uma procedure de **obter** um registro:
    - Procedure deverá receber como parâmetros o **idPessoa** a ser selecionado na tabela.

-[x] 10 - Criar um script para inserir dados na tabela de **Pessoas** através da procedure de **inserção**.

-[x] 11 - Criar um script para atualizar dados na tabela de **Pessoas** através da procedure de **atualização**.

-[x] 12 - Criar um script para remover dados na tabela de **Pessoas** através da procedure de **remoção**.

-[x] 13 - Criar um script para selecionar registros na tabela de **Pessoas** através da procedure de **seleção** de
 todos os registros.

-[x] 14 - Criar um script para selecionar um registro na tabela de **Pessoas** através da procedure de **seleção** de
 um registro.

-[x] 15 - Testar a execução dos scripts no banco de dados.

-[x] 16 - Subir os scripts em um repositório do [_**github**_](https://github.com/) e disponibilizar o _link_ para
 avaliação.