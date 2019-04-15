# coding: utf-8
from sqlalchemy import Column, Date, ForeignKey, String, TIMESTAMP, text
from sqlalchemy.dialects.mysql import INTEGER
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()
metadata = Base.metadata


class Endereco(Base):
    __tablename__ = 'endereco'

    id_endereco = Column(INTEGER(11), primary_key=True)
    logradouro = Column(String(120), nullable=False)
    numero = Column(INTEGER(11), nullable=False)
    cep = Column(String(20), nullable=False)
    bairro = Column(String(45))
    cidade = Column(String(45), nullable=False)
    Pais = Column(String(45), nullable=False)
    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))


class Pais(Base):
    __tablename__ = 'pais'
    __table_args__ = {'schema': 'pais'}

    id_pais = Column(INTEGER(11), primary_key=True)
    nome_pais = Column(String(45), nullable=False)
    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))


class StatusCivil(Base):
    __tablename__ = 'status_civil'

    id_status_civil = Column(INTEGER(11), primary_key=True)
    nome_status_civil = Column(String(45), nullable=False)
    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))


class Cliente(Base):
    __tablename__ = 'cliente'

    id_cliente = Column(INTEGER(11), primary_key=True)
    tipo_cliente = Column(String(45), nullable=False)
    endereço_id_endereço = Column(ForeignKey('endereco.id_endereco'), nullable=False, index=True)
    email = Column(String(60), nullable=False)
    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

    endereco = relationship('Endereco')


class Nacionalidade(Base):
    __tablename__ = 'nacionalidade'
    __table_args__ = {'schema': 'pais'}

    id_nacionalidade = Column(INTEGER(11), primary_key=True)
    pais_id_pais = Column(ForeignKey('pais.pais.id_pais'), nullable=False, index=True)
    nome_nacionalidade = Column(String(70), nullable=False)
    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

    pai = relationship('Pai')


class PessoaFisica(Base):
    __tablename__ = 'pessoa_fisica'

    id_pessoa_fisica = Column(INTEGER(11), primary_key=True)
    rg = Column(String(9), nullable=False)
    cpf = Column(String(11), nullable=False)
    nome = Column(String(70), nullable=False)
    sobrenome = Column(String(70), nullable=False)
    nome_mae = Column(String(100))
    sexo = Column(String(45), nullable=False)
    nacionalidade_id_nacionalidade = Column(ForeignKey('pais.nacionalidade.id_nacionalidade'), nullable=False, index=True)
    nome_pai = Column(String(100))
    data_nascimento = Column(Date, nullable=False)
    cliente_id_cliente = Column(ForeignKey('cliente.id_cliente'), nullable=False, index=True)
    status_civil_id_status_civil = Column(ForeignKey('status_civil.id_status_civil'), nullable=False, index=True)
    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

    cliente = relationship('Cliente')
    nacionalidade = relationship('Nacionalidade')
    status_civil = relationship('StatusCivil')


class PessoaJuridica(Base):
    __tablename__ = 'pessoa_juridica'

    id_pessoa_juridica = Column(INTEGER(11), primary_key=True)
    id_cliente = Column(INTEGER(11), nullable=False)
    razao_social = Column(String(200), nullable=False)
    cnpj = Column(String(45), nullable=False)
    cliente_id_cliente = Column(ForeignKey('cliente.id_cliente'), nullable=False, index=True)
    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

    cliente = relationship('Cliente')
