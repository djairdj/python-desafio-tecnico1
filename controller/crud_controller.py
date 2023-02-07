import datetime
import random as rnd
import uuid

from models.person import Person
from service.service_crud import Service_Crud


class Crud:
    def __init__(self):
        self.service = Service_Crud()

    def del_by_id(self, str_id: str):
        return self.service.delete_by_id(str_id)

    def del_by_cpf(self, cpf: str):
        return self.service.delete_by_cpf(cpf)

    def get_by_id(self, str_id: str):
        dado = self.service.get_by_id(str_id)
        # return dado
        # return dado if not isinstance(dado, tuple) else self.person_from_tuple(dado)
        return self.person_from_tuple(dado) if dado is not None else dado

    def get_by_cpf(self, cpf: str):
        dado = self.service.get_by_cpf(cpf)
        return self.person_from_tuple(dado) if dado is not None else dado

    def get_all(self):
        array = self.service.get_all()
        if len(array) > 0:
            for i in range(len(array)):
                array[i] = self.person_from_tuple(array[i])
        return array

    def create_person(self, *person: Person):
        fields = [
            "nome",
            "ano de nascimento",
            "mes de nascimento",
            "dia de nascimento",
            "salário",
            "descritivo a respeito",
            "nome da mãe",
            "nome do pai",
        ]
        if len(person) == 1:
            person = person[0]
        else:
            ent = []
            for each in fields:
                ent.append(input("Informe o " + each + ": "))
            cpf = ''
            person = Person(self.id_unica(), ent[0], datetime.date(int(ent[1]), int(ent[2]), int(ent[3])),
                            float(ent[4]), ent[5], ent[6], ent[7], cpf)
        while self.get_by_id(person.get_id()) is not None:
            person.set_id(self.id_unica())
        dado = self.service.create_person(person)
        return dado

    def update_by_id(self, str_id: str, person: Person):
        return self.service.update_by_id(str_id, person)

    def update_by_cpf(self, str_cpf: str):
        exist = self.get_by_cpf(str_cpf)
        if isinstance(exist, Person):
            fields = ["nome", "ano de nascimento", "mes de nascimento", "dia de nascimento", "salário",
                      "descritivo a respeito", "nome da mãe", "nome do pai", ]
            ent = []
            for each in fields:
                ent.append(input("Atualize o valor do " + each + ": "))
            person = Person(exist.get_id(), ent[0], datetime.date(int(ent[1]), int(ent[2]), int(ent[3])),
                            float(ent[4]), ent[5], ent[6], ent[7], exist.get_cpf())
            return self.service.update_by_cpf(str_cpf, person)
        else:
            raise Exception("CPF não encontrado na base.")

    def person_from_tuple(self, tupla: tuple):
        f = []
        for i in tupla:
            f.append(i)
        person = Person(f[0], f[1], f[2], f[3], f[4], f[5], f[6], f[7])
        return person

    def person_from_basemodel(self, dictionary: dict):
        f = [self.id_unica()]
        for i in dictionary:
            f.append(dictionary[i])

        person = Person(f[0], f[1], f[2], f[3], f[4], f[5], f[6], f[7])
        return person

    def basemodel_from_person(self, person: Person):
        basemodel = {
            'name': person.get_name(),
            'data_nasc': person.data_nasc(),
            'salario': person.get_wage(),
            'observacao': person.get_comments(),
            'nome_mae': person.get_nome_mae(),
            'nome_pai': person.get_nome_pai(),
            'cpf': person.get_cpf()
        }
        return basemodel

    def id_unica(self):
        # método rude de testar uma estratégia de definição de id diferente
        u = 2
        if u == 1:
            return str(uuid.uuid4())
        return str(rnd.randint(1, 9999))
