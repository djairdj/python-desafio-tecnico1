from fastapi import FastAPI

from controller.crud_controller import Crud
from schemas.person import Person

app = FastAPI()
controller = Crud()


@app.get("/hello/{name}")
async def say_hello(name: str):
    return {"message": f"Hello {name}"}


@app.get("/")
async def root() -> list:
    dados = controller.get_all()
    for i in range(0, len(dados)):
        item = dados[i]
        dados[i] = {'id': item.get_id(), **controller.basemodel_from_person(item)}
    print(dados)
    return dados


@app.get("/{_id}")
async def get_pessoa_id(_id):
    item = controller.get_by_id(f'{_id}')
    pessoa = 'Não encontrado.'
    if item is not None:
        pessoa = {'id': item.get_id(), **controller.basemodel_from_person(item)}
    print(pessoa)
    return pessoa


@app.delete("/{_id}")
async def remove_id(_id):
    elemento = controller.del_by_id(f'{_id}')
    print(elemento)
    return elemento


@app.put("/{_id}")
async def update_person(_id, pessoa: Person):
    item_dict = pessoa.dict()
    pessoa = await get_pessoa_id(f'{_id}')
    if not isinstance(pessoa, str):
        person = controller.person_from_basemodel(item_dict)
        controller.update_by_id(f'{_id}', person)
        elemento = {'id': f'{_id}', **item_dict}
        print(elemento)
        return elemento
    return pessoa


@app.post("/")
async def create_person(pessoa: Person):
    item_dict = pessoa.dict()
    person = controller.person_from_basemodel(item_dict)
    try:
        controller.create_person(person)
        elemento = {'id': person.get_pessoa_id(), **item_dict}
        print(elemento)
        return elemento
    except Exception:
        ex = "CPF duplicado!"
        print(ex)
        return ex
