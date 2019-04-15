from sqlalchemy import Column, Date, ForeignKey, String, TIMESTAMP, text
from sqlalchemy.dialects.mysql import INTEGER, FLOAT
from sqlalchemy.orm import relationship

Base = declarative_base()

class Banco(Base):
    __tablename__ = 'banco'
    id_banco = Column(INTEGER(11), primary_key=True)
    nome_banco = Column(String(45), nullable=False)
    numero_banco = Column(String(45), nullable=False)
    
    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

class ContaPortfolio(Base):
    __tablename__ = 'conta_portfolio'
    id_conta_portfolio = Column(INTEGER(11), primary_key=True)
    banco_id_banco = Column(ForeignKey('banco.id_banco'), nullable=False, Index=True)
    moeda_id_moeda = Column(ForeignKey('moeda.id_moeda'), nullable=False, Index=True)
    pais_id_pais = Column(ForeignKey('pais.id_pais'), nullable=False, Index=False)
    portfolio_id_portfolio = Column(ForeignKey('portfolio.id_portfolio'), nullable=False, Index=False)
    agencia = Column(String(45), nullable=False)
    conta = Column(String(45), nullable=False)
    
    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

class TipoPortfolio(Base):
    __tablename__ = 'tipo_portfolio'
    id_tipo_portfolio = Column(INTEGER(11), primary_key=True)
    nome_tipo_portfolio = Column(String(90), nullable=False)
    

    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

class PerfilRisco(Base):
    __tablename__ = 'perfil_risco'
    id_perfil_risco = Column(INTEGER(11), primary_key=True)
    perfil_risco = Column(String(45), nullable=False)

    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

class PlPosicao(Base):
    __tablename__ = 'pl_posicao'
    id_pl_posicao = Column(INTEGER(11), primary_key=True)
    portfolio_id_portfolio = Column(ForeignKey('portfolio.id_portfolio'), nullable=False)
    valor_pl = Column(FLOAT, nullable=False)

    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

class Portfolio(Base):
    __tablename__ = 'portfolio'
    id_portfolio = Column(INTEGER(11), primary_key=True)
    perfil_risco_id_perfil_risco = Column(ForeignKey('perfil_risco.id_perfil_risco'), nullable=False, Index=True)
    cliente_id_cliente = Column(ForeignKey('cliente.id_cliente'), nullable=False, Index=True)
    subtipo_portfolio_id_subtipo_portfolio = Column(ForeignKey('subtipo_portfolio.id_subtipo_portfolio'), nullable=False, Index=True)
    benchmark_id_benchmark = Column(ForeignKey('benchmark.id_benchmark'), nullable=False, Index=True)
    moeda_id_moeda = Column(ForeignKey('moeda_id_moeda'), nullable=False, Index=True)
    tipo_interno_portfolio_id_tipo_interno_portfolio = Column(ForeignKey('tipo_interno_portfolio_id_tipo_interno_portfolio'), nullable=False, Index=True)    

    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))


class PortfolioSistema(Base):
    __tablename__ = 'portfolio_sistema'
    id_portfolio_sistema = Column(INTEGER(11), primary_key=True)
    sistema_id_sistema = Column(ForeignKey('sistema.id_sistema'), nullable=False, Index=True)
    portfolio_id_portfolio = Column(ForeignKey('portfolio.id_portfolio'), nullable=False, Index=True)
    codigo_portfolio_no_sistema = Column(String(45), nullable=False)

    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))


class SubtipoPortfolio(Base):
    __tablename__ = 'subtipo_portfolio'
    id_subtipo_portfolio = Column(INTEGER(11), primary_key=True)
    id_tipo_portfolio_id_tipo_portfolio = Column(ForeignKey('id_tipo_portfolio.id_tipo_portfolio'), nullable=False, Index=True)
    nome_sub_tipo_portfolio = Column(String(45), nullable=False)
    
    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))


class TipoInternoPortfolio(Base):
    __tablename__ = 'tipo_interno_portfolio'
    id_tipo_interno_portfolio = Column(INTEGER(11), primary_key=True)
    nome_tipo_interno_portfolio = Column(String(45), nullable=False)

    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))
