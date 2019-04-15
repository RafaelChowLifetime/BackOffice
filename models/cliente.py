from sqlalchemy import Column, Date, ForeignKey, String, TIMESTAMP, text
from sqlalchemy.dialects.mysql import INTEGER
from sqlalchemy.orm import relationship

Base = declarative_base()


#TODO: add relationships


class Cliente(Base):
    __tablename__ = 'cliente'
    id_cliente = Column(INTEGER(11), primary_key=True)
    endereco_id_endereco = Column(ForeignKey('endereco.id_endereco'), nullable=False, index=True)   
    tipo_cliente = Column(String(45), nullable=False)
    email = Column(String(60), nullable=False)
    
    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))


class ClienteSistema(Base):
    __tablename__ = 'cliente_sistema'
    id_cliente_sistema = Column(INTEGER(11), primary_key=True)
    cliente_id_cliente = Column(ForeignKey('cliente.id_cliente'), nullable=False, index=True)
    sistema_id_sistema = Column(ForeignKey('sistema.id_sistema'), nullable=False, index=True)
    codigo_cliente_no_sistema = Column(String(70), nullable=False)    
    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

class Endereco(Base):
    __tablename__ = 'endereco'
    logradouro = Column(String(120), nullable=False)
    numero = Column(INTEGER(11), nullable=False)
    cep = Column(String(20), nullable=False)
    bairro = Column(String(45), nullable=True)
    cidade = Column(String(45), nullable=False)
    pais = Column(String(45), nullable=False)
    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

class PessoaFisica(Base):
    __tablename__ = 'pessoa_fisica'
    id_pessoa_fisica = Column(INTEGER(11), primary_key=True)
    nacionalidade_id_nacionalidade = Column(ForeignKey('nacionalidade.id_nacionalidade'), nullable=False, index=True)
    cliente_id_cliente = Column(ForeignKey('cliente.id_cliente'), nullable=False, index=True)
    status_civil = Column(ForeignKey('status_civil.id_status_civil'), nullable=False, index=False)
    rg = Column(String(9), nullable=False)
    cpf = Column(String(11), nullable=False)
    nome = Column(String(70), nullable=False)
    sobrenome = Column(String(70), nullable=False)
    nome_mae = Column(String(100), nullable=True)
    nome_pai = Column(String(100), nullable=True)
    sexo = Column(String(45), nullable=False)
    data_nascimento = Column(Date, nullable=False)

    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

class PessoaJuridica(Base):
    __tablename__ = ' pessoa_juridica'
    id_pessoa_juridica = Column(INTEGER(11), primary_key=True)
    cliente_id_cliente = Column(ForeignKey('cliente.id_cliente'), nullable=False, index=True)
    razao_social = Column(String(200), nullable=False)
    cnpj = Column(String(45), nullable=False)

    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

class StatusCivil(Base):
    __tablename__ = 'status_civil'
    id_status_civil = Column(INTEGER(11), primary_key=True)
    nome_status_civil = Column(String(45), nullable=False)

    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))


class AliasNomePessoaFisica(Base):
    __tablename__ = 'alias_nome_pessoa_fisica'
    id_alias_nome_pessoa_fisica = Column(INTEGER(11), primary_key=True)
    pessoa_fisica_id_pessoa_fisica = Column(ForeignKey('pessoa_fisica.id_pessoa_fisica'), nullable=False, index=True)
    nome_alias_nome_pessoa_juridica = Column(String(80), nullable=False)

    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))


class AliasNomePessoaJuridica(Base):
    __tablename__ = 'alias_nome_pessoa_juridica'
    id_alias_nome_pessoa_juridica = Column(INTEGER(11), primary_key=True)
    pessoa_fisica_id_pessoa_juridica = Column(ForeignKey('pessoa_fisica.id_pessoa_juridica'), nullable=False, index=True)
    nome_alias_nome_pessoa_juridica = Column(String(80), nullable=False)

    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

