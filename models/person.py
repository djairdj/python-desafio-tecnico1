import datetime
import random


class Person:
    def __init__(self, _id: str, name: str, data_nascimento: datetime.date, salario: float, obs: str, nome_mae: str,
                 nome_pai: str, cpf=''):
        self.__id = _id
        self.__name = name
        self.__data_birth = data_nascimento
        self.__wage = salario
        self.__comments = obs
        self.__nome_mae = nome_mae
        self.__nome_pai = nome_pai
        self.__cpf = cpf if cpf != '' else random.randint(
            10000000000, 99999999999)

    def __str__(self):
        ret = "Nome:" + self.__name \
              + ", id: " + self.__id \
              + ", cpf: " + self.__cpf \
              + ", nascimento: " + self.__data_birth.strftime("%d/%m/%Y") \
              + ", salario: " + str(self.__wage) \
              + ", observação: " + self.__comments \
              + ", nome da mãe: " + self.__nome_mae \
              + ", nome do pai: " + self.__nome_pai
        return ret

    def data_nasc(self):
        return self.__data_birth

    def get_name(self):
        return self.__name

    def get_wage(self):
        return self.__wage

    def get_comments(self):
        return self.__comments

    def get_id(self):
        return self.__id

    def get_nome_mae(self):
        return self.__nome_mae

    def get_nome_pai(self):
        return self.__nome_pai

    def get_cpf(self):
        return self.__cpf

    def set_id(self, id: str):
        self.__id = id
