from sqlalchemy import create_engine
import os
import sys
# from os import subprocesses
# import subprocesses
# engine = create_engine('mysql+pymysql//rafael:lifetime@127.0.0.1:3306/cliente')


DB_USER = 'rafael'
DB_PASS = 'lifetime' 
DB_HOST = 'localhost'
DB_PORT = '3306'



schema_list = ['cliente', 'elemento_financeiro', 'portfolio', 'movimentacao', 'operacoes', 'pais', 'posicao', 'renda_fixa', 'renda_variavel', 'saldo']

#  information_schema  |
# | bots                |
# | cliente             |
# | elemento_financeiro |
# | movimentacao        |
# | mysql               |
# | operacoes           |
# | pais                |
# | performance_schema  |
# | portfolio           |
# | posicao             |
# | renda_fixa          |
# | renda_variavel      |
# | saldo               |
# | sys


DATABASE = 'cliente'

# for schema in schema_list:
#     code_gen = 'sqlacodegen --outfile {}.py mysql+pymysql://rafael:lifetime@localhost:3306/{}'.format(schema, schema)
#     os.system(code_gen)



connect_string = 'mysql+pymysql://{}:{}@{}:{}/{}?charset=utf8mb4'.format(DB_USER, DB_PASS, DB_HOST, DB_PORT, DATABASE)
connect_string = 'mysql+pymysql://{}:{}@{}:{}'.format(DB_USER, DB_PASS, DB_HOST, DB_PORT)


engine = create_engine(connect_string)


# # from sqlalchemy import inspect
# # inspector = inspect(engine)

# # for table_name in inspector.get_table_names():
# #    for column in inspector.get_columns(table_name):
# #        print("Column: %s" % column['name'])



# from sqlalchemy import MetaData
# m = MetaData()
# m.reflect(engine)

# for table in m.tables.values():
#     print(table.name)
#     for column in table.c:
#         print(column.name)