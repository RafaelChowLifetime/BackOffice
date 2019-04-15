from sqlalchemy import Column, Date, ForeignKey, String, TIMESTAMP, text
from sqlalchemy.dialects.mysql import INTEGER, FLOAT
from sqlalchemy.orm import relationship

Base = declarative_base()

class Bot(Base):
    __tablename__ = 'bot'
    id_bot = Column(INTEGER, primary_key=True)
    bot_frequencia_id_bot_frequencia = Column(ForeignKey('bot_frequencia.id_bot_frequencia'), nullable=False, Index=True)
    bot_type_id_bot_type = Column(ForeignKey('bot_type.id_bot_type'), nullable=False, Index=True)
    script_id_script = Column(ForeignKey('script.id_script'), nullable=False, Index=True)
    filepath_to_run = Column(String(300), nullable=False)
    grupo_senha_id_grupo_senha = Column(ForeignKey('grupo_senha.id_grupo_senha'), nullable=True)

    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

class BotFrequencia(Base):
    __tablename__ = 'bot_frequencia'
    id_bot_frequencia = Column(INTEGER, primary_key=True)
    minuto = Column(String(2), nullable=False)
    hora = Column(String(2), nullable=False)
    dia_do_mes = Column(String(3), nullable=False)
    mes = Column(String(3), nullable=False)
    dia_da_semana = Column(String(3), nullable=False)

    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

class BotType(Base):
    __tablename__ = 'bot_type'
    id_bot_type = Column(INTEGER, primary_key=True)
    bot_type_name = Column(String(60), nullable=False)

    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

class Credencial(Base):
    __tablename__ = 'credencial'
    id_credencial = Column(INTEGER, primary_key=True)

    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

class GrupoSenha(Base):
    __tablename__ = 'grupo_senha'
    id_grupo_senha = Column(INTEGER, primary_key=True)

    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

class Login(Base):
    __tablename__ = 'login'
    id_login = Column(INTEGER, primary_key=True)

    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))


class Script(Base):
    __tablename__ = 'script'
    id_script = Column(INTEGER, primary_key=True)

    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))
