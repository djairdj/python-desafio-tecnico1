use mybase;
UPDATE Pessoas
	SET nome = 'Eduardo Luiz',
        dataNascimento = '1986-09-23',
        salario = 28000,
        observacoes = 'Primeiro se come o arroz',
        nomeMae = 'Cris Gomes',
        nomePai = 'Antonio Gomes',
		cpf = '05771509414'
        WHERE idPessoa = 'a77c44ec-3ea2-4e59-a313-fbd0a6f2517e';