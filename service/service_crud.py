from bd import base
from models.person import Person


class Service_Crud:
    __table = "Pessoas"

    def __rebuild_table(self):
        table = Service_Crud.__table
        self.__drop_table(table)
        self.__create_table(table)
        return True

    def __drop_table(self, table: str):
        comando = f"""drop table if exists {table};"""
        cursor_base = base.cursor()
        cursor_base.execute(comando)
        cursor_base.commit()
        cursor_base.close()
        return True

    def __create_table(self, table: str):
        comando = f"""CREATE table {table} (
        idPessoa int identity primary Key,
        nome varchar(100) not null,
        dataNascimento date not null,
        salario float,
        observacoes varchar(200)
        );"""
        cursor_base = base.cursor()
        cursor_base.execute(comando)
        cursor_base.commit()
        cursor_base.close()
        return True

    def get_all(self) -> list:
        comando = f"""EXEC SELECTION;"""
        cursor = base.cursor()
        cursor.execute(comando)
        lista = cursor.fetchall()
        cursor.close()
        return lista

    def get_by_id(self, str_id: str):
        cur = base.cursor()
        comando = f"""SELECT * FROM {self.__table} WHERE idPessoa = '{str_id}';"""
        cur.execute(comando)
        data = cur.fetchone()
        cur.close()
        return data

    def get_by_cpf(self, str_cpf: str):
        cur = base.cursor()
        comando = f"""SELECT * FROM {self.__table} WHERE cpf = '{str_cpf}';"""
        cur.execute(comando)
        data = cur.fetchone()
        cur.close()
        return data

    def get_first_element(self):
        cur = base.cursor()
        comando = f"""SELECT * FROM {self.__table} ORDER BY nome;"""
        cur.execute(comando)
        data = cur.fetchone()
        cur.close()
        return data

    def update_by_id(self, str_id: str, person: Person) -> bool:
        comando = f"""EXEC ATUALIZACAO
        '{str_id}',
        '{person.get_name()}',
        '{person.data_nasc()}',
         {person.get_wage()},
        '{person.get_comments()}',
        '{person.get_nome_mae()}',
        '{person.get_nome_pai()}',
        '{person.get_cpf()}';"""
        cursor_base = base.cursor()
        cursor_base.execute(comando)
        cursor_base.commit()
        cursor_base.close()
        return True

    def update_by_cpf(self, str_cpf: str, person: Person) -> bool:
        comando = f"""UPDATE {self.__table} SET nome = '{person.get_name()}',
        dataNascimento = '{person.data_nasc()}',
        salario = {person.get_wage()},
        observacoes = '{person.get_comments()}',
        nomeMae = '{person.get_nome_mae()}',
        nomePai = '{person.get_nome_pai()}',
        cpf = '{person.get_cpf()}'
        WHERE cpf = '{str_cpf}';"""
        cursor_base = base.cursor()
        cursor_base.execute(comando)
        cursor_base.commit()
        cursor_base.close()
        return True

    def delete_by_id(self, str_id: str) -> bool:
        comando = f"""EXEC REMOCAO '{str_id}';"""
        cursor_base = base.cursor()
        cursor_base.execute(comando)
        cursor_base.commit()
        cursor_base.close()
        return True

    def delete_by_cpf(self, str_cpf: str):
        comando = f"""DELETE FROM {self.__table} WHERE cpf = '{str_cpf}';"""
        cursor_base = base.cursor()
        cursor_base.execute(comando)
        cursor_base.commit()
        cursor_base.close()
        return True

    def create_person(self, person: Person) -> bool:
        comando = f"""EXEC INSERTION '{person.get_id()}',
                        '{person.get_name()}',
                        '{person.data_nasc()}',
                         {person.get_wage()},
                        '{person.get_comments()}',
                        '{person.get_nome_mae()}',
                        '{person.get_nome_pai()}',
                        '{person.get_cpf()}';"""
        cursor_base = base.cursor()
        cursor_base.execute(comando)
        cursor_base.commit()
        cursor_base.close()
        return True
