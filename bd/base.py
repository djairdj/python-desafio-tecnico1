import pyodbc
import os

def cursor():
    database = 'mybase'
    username = os.environ['user_bd'] # aqui substitua pelo seu usuário do banco de dados
    password = os.environ['password_bd'] # aqui substitua pela sua senha do banco de dados
    #username = 'myuser'
    #password = 'senha'
    server = 'localhost\\SQLEXPRESS;DATABASE='+database
    url_conn = 'DRIVER={ODBC Driver 17 for SQL Server};SERVER=' + server + ';UID=' + username + ';PWD=' + password

    conn = pyodbc.connect(url_conn)
    return conn.cursor()
