import datetime

from pydantic import BaseModel


class Person(BaseModel):
    name: str
    data_nasc: datetime.date
    salario: float | None = None
    observacao: str | None = None
    nome_mae: str
    nome_pai: str
    cpf: str
