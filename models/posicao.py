from sqlalchemy import Column, Date, ForeignKey, String, TIMESTAMP, text
from sqlalchemy.dialects.mysql import INTEGER, FLOAT
from sqlalchemy.orm import relationship

Base = declarative_base()

class Posicao(Base):
    __tablename__ = 'posicao'
    id_posicao = Column(INTEGER(11), primary_key=True)

    portfolio_id_portfolio = Column(ForeignKey('portfolio.id_portfolio'), nullable=False, Index=True)
    subtipo_posicao_id_subtipo_posicao = Column(ForeignKey('subtipo_posicao.id_subtipo_posicao'), nullable=False, Index=True)
    conta_portfolio_id_conta_portfolio = Column(ForeignKey('conta_portfolio.id_conta_portfolio'), nullable=False, Index=True)
    elemento_financeiro_id_elemento_financeiro = Column(ForeignKey('elemento_financeiro.id_elemento_financeiro'), nullable=False, Index=True)
    data_posicao = Column(Date, nullable=False)
    preco_unitario = Column(FLOAT, nullable=False)
    quantidade = Column(FLOAT, nullable=False)
    valor_total = Column(FLOAT, nullable=False)
    porcentagem_do_pl = Column(FLOAT, nullable=True)

    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

class PosicaoConsolidada(Base):
    __tablename__ = 'posicao_consolidada'
    id_posciao_consolidada = Column(INTEGER(11), primary_key=True)
    portfolio_id_portfolio = Column(ForeignKey('portfolio.id_portfolio'), nullable=True)
    elemento_financeiro_id_elemento_financeiro = Column(ForeignKey('elemento_financeiro.id_elemento_financeiro'), nullable=True)
    data_posicao = Column(Date, nullable=True)


    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

class SubtipoPosicao(Base):
    __tablename__ = 'subtipo_posicao'
    id_subtipo_posicao = Column(INTEGER(11), primary_key=True)
    
    posicao_consolidada_id_posicao_consolidada = Column(ForeignKey('posicao_consolidada.id_posicao_consolidada'), nullable=False, Index=True)
    tipo_posicao_id_tipo_posicao = Column(ForeignKey('tipo_posicao_id_tipo_posicao'), nullable=False, Index=True)
    nome_subtipo_posicao = Column(String(45), nullable=False)
    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

class TipoPosicao(Base):
    __tablename__ = 'tipo_posicao'
    id_tipo_posicao = Column(INTEGER(11), primary_key=True)
    nome_tipo_posicao = Column(String(45), nullable=False)
    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))


