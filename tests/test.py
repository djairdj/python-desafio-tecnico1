import datetime
import random as rnd
from unittest import TestCase

from faker import Faker

from controller.crud_controller import Crud
from models.person import Person


def __rnd_fields():
    base_data = {
        'day': [1, 28],
        'month': [1, 12],
        'year': [1950, data_today.year - 18], # Maioridade
        'cash': [1200, 19780]
    }  # Possibilidade de uso da api Faker para obtenção de dados para teste
    lista = []
    for x, y in base_data.items():
        lista.append(rnd.randint(y[0], y[1]))
    return lista


def new_person():
    days, months, years, moneys = __rnd_fields()
    birth = datetime.date(years, months, days)
    id_str = Crud().id_unica()
    comments_rnd = Faker().text().split(".")[0]
    last_name = Faker().last_name()
    mother = Faker().first_name_female() + " " + last_name
    father = Faker().first_name_male() + " " + last_name
    name = Faker().first_name() + " " + last_name
    cpf = ''
    person = Person(id_str, name, birth, moneys, comments_rnd, mother, father, cpf)
    return person


data_today = datetime.datetime.today()
day, month, year, money = __rnd_fields()
obs_rnd = Faker().text().split(".")[0]
controller = Crud()


class Test(TestCase):
    __p = new_person()

    def test_create_pessoa(self):
        assert controller.create_person(self.__p)

    def test_get_by_id(self):
        str_id = "a77c44ec-3ea2-4e59-a313-fbd0a6f2517e"
        got = controller.get_by_id(str_id)
        if got is None:
            print("id: " + str_id + "\npreviamente inexistente.")
        else:
            assert got is not None

    def test_get_by_id_none(self):
        this_id = "39"
        assert controller.get_by_id(this_id) is None

    def test_delete_by_id(self):
        str_id = "fc1ebea7-efc3-42fa-9aed-d51064b141a3"
        got = controller.get_by_id(str_id)
        if got:
            print("Tupla a ser excluída:\n" + str(got))
        assert controller.del_by_id(str_id)

    def test_get_all(self):
        got = controller.get_all()
        if len(got) == 0:
            print("tabela vazia.")
        else:
            print(len(got), "Elemento(s) na tabela.")

    def test_update_comments_by_id(self):
        first = controller.service.get_first_element()
        watch = Faker().text().split(".")[0]
        print("Observação a ser alterada: ", first[4])
        print("Próxima observação será: " + watch)
        temp_person = Person(
            first[0], first[1], first[2], first[3], watch, first[5], first[6], first[7]
        )
        assert controller.update_by_id(first[0], temp_person)

    def test_update_by_id(self):
        first = controller.service.get_first_element()
        fields = [
            "Félix Cantador",
            datetime.datetime(2010, 1, 17),
            23416,
            "Time The Voice!"
        ]
        print("Elementos que serão alterados: " + str(first))
        print("Novas Alterações:", fields)
        this_person = Person(
            first[0], fields[0], fields[1], fields[2], fields[3], first[5], first[6], first[7]
        )
        assert controller.update_by_id(first[0], this_person)
