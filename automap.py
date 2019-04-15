from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine

Base = automap_base()


DB_USER = 'rafael'
DB_PASS = 'lifetime' 
DB_HOST = 'localhost'
DB_PORT = '3306'


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


# DATABASE = 'cliente'

connect_string = 'mysql+pymysql://{}:{}@{}:{}'.format(DB_USER, DB_PASS, DB_HOST, DB_PORT)


engine = create_engine(connect_string)


# engine, suppose it has two tables 'user' and 'address' set up
# engine = create_engine("sqlite:///mydatabase.db")

# reflect the tables
Base.prepare(engine, reflect=True)

# mapped classes are now created with names by default
# matching that of the table name.
session = Session(engine)

# rudimentary relationships are produced


# collection-based relationships are by default named
# "<classname>_collection"
# print (u1.address_collection)