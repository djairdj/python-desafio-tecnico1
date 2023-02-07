from controller.crud_controller import Crud

control = Crud()


def menu_main():
    menu = """,___MENU OPTIONS___,
|------------------|
|0 - Exit          |
|1 - Create Person |
|5 - Read Person   |
|4 - Read People   |
|2 - Update Person |
|3 - Delete Person |
|------------------|"""
    loop = True
    options = {
        "0": 'True',
        "1": 'create_person()',
        "2": 'update_person()',
        "3": 'del_person()',
        "4": 'get_people()',
        "5": 'get_person()'
    }
    while loop:
        print(menu)
        opt = input("Informe uma opção acima: ")
        if opt not in options:
            print("Opção inválida!")
        else:
            try:
                dado = eval(options[opt])
                if not isinstance(dado, bool):
                    if isinstance(dado, list):
                        print_list(dado)
                    else:
                        print(dado)
                print("Operação realizada com sucesso!")
            except Exception as ex:
                print("Algo deu errado: " + ex.__str__())
        if opt == "0":
            print("Até a próxima!")
            loop = False


def create_person():
    return control.create_person()


def get_person():
    _id = input("Informe o cpf exato para busca: ")
    dado = control.get_by_cpf(_id)
    if dado is None:
        raise Exception("CPF Não achado no banco de dados.")
    return dado


def update_person():
    _cpf = input("Informe o cpf exato para busca: ")
    return control.update_by_cpf(_cpf)


def del_person():
    _id = input("Informe o cpf exato para busca: ")
    return control.del_by_cpf(_id)


def get_people():
    return control.get_all()


def print_list(array: list):
    for i in range(1, len(array) + 1):
        print(array[i - 1])


menu_main()
