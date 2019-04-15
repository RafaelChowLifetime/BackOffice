from sqlalchemy import Column, Date, ForeignKey, String, TIMESTAMP, text
from sqlalchemy.dialects.mysql import INTEGER, FLOAT
from sqlalchemy.orm import relationship

Base = declarative_base()


class AliasNomeMovimentacao(Base):
    __tablename__'alias_nome_movimentacao'
    id_alias_nome_movimentacao = Column(INTEGER(11), primary_key=True)
    nome_movimentacao_id_nome_movimentacao = Column(ForeignKey('nome_movimentacao.id_nome_movimentacao'), nullable=False, Index=True)
    nome_movimentacao_banco = Column(String(80), nullable=False)
    
    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

class AliasNomeTipoMovimentacao(Base):
    __tablename__ = 'alias_nome_tipo_movimentacao'
    id_alias_nome_tipo_movimentacao = Column(INTEGER(11), primary_key=True)
    alias_nome_tipo_movimentacao = Column(String(45), nullable=False)
    
    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))
    

class AliasSuptipoMovimentacao(Base):
    __tablename__ = 'alias_subtipo_movimentacao'
    id_alias_subtipo_movimentacao = Column(INTEGER(11), primary_key=True)
    subtipo_movimentacao_id_subtipo_movimentacao = Column(ForeignKey('subtipo_movimentacao.id_subtipo_movimentacao'), nullable=False, Index=False)
    nome_subtipo_movimentacao = Column(String(45), nullable=False, Index=False)

    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))    

class AliasTipoMovimentacao(Base):
    __tablename__ = 'alias_tipo_movimentacao'
    id_alias_tipo_movimentacao = Column(INTEGER(11), primary_key=True)
    tipo_movimentacao_id_tipo_movimentacao = Column(ForeignKey('tipo_movimentacao.id_tipo_movimentacao'), nullable=False, Index=False)
    nome_alias_tipo_movimentacao = Column(String(45), nullable=False)

    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

class Movimentacao(Base):
    __tablename__ = 'movimentacao'
    id_movimentacao = Column(INTEGER(11), primary_key=True)
    conta_portfolio_id_conta_portfolio = Column(ForeignKey('conta_portfolio.id_conta_portfolio'), nullable=False, Index=False)
    subtipo_movimentacao_id_subtipo_movimentacao = Column(ForeignKey('subtipo_movimentacao.id_subtipo_movimentacao'), nullable=False, Index=False)
    nome_movimentacao_id_nome_movimentacao = Column(ForeignKey('nome_movimentacao.id_nome_movimentacao'), nullable=False, Index=False)
    data_movimentacao = Column(Date, nullable=False)
    valor_movimentacao = Column(FLOAT, nullable=False)

    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

class NomeMovimentacao(Base):
    __tablename__ = 'nome_movimentacao'
    id_nome_movimentacao = Column(INTEGER(11), primary_key=True)
    nome_movimentacao = Column(String(80), nullable=False)

    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

class SubtipoMovimentacao(Base):
    __tablename__ = 'subtipo_movimentacao'
    id_subtipo_movimentacao = Column(INTEGER(11), primary_key=True)
    tipo_movimentacao_id_tipo_movimentacao = Column(ForeignKey('tipo_movimentacao.id_tipo_movimentacao'), nullable=False, Index=False)
    tipo_impacto_subtipo_movimentacao_na_cota = Column(ForeignKey('tipo_impacto_subtipo_movimentacao_na_cota'), nullable=False, Index=False)
    nome_subtipo_movimentacao = Column(String(45), nullable=False, Index=False)
    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

class TipoMovimentacao(Base):
    __tablename__ = 'tipo_movimentacao'
    id_tipo_movimentacao = Column(INTEGER(11), primary_key=True)
    nome_tipo_movimentacao = Column(String(80), nullable=False)

    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

class TipoImpactoSubtipoMovimentacaoNaCota(Base):
    __tablename__ = 'tipo_impacto_subtipo_movimentacao_na_cota'
    nome_tipo_impacto_subtipo_movimentacao_na_cota = Column(String(45), nullable=False)
    valor_impacto_subtipo_movimentacao_na_cota = Column(INTEGER(11), nullable=False)
    
    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))


