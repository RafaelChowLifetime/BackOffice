class Operacao(Base):
      __tablename__'operacao'

      id_renda_fixa = Column(INTEGER(11), primary_key=True)
      portfolio_id_portfolio = Column(ForeignKey('portfolio.id_portfolio'), nullable=False, Index=True)
      conta_portfolio_id_conta_portfolio = Column(ForeignKey('conta_portfolio.id_conta_portfolio'), nullable=False, Index=True)
      tipo_operacao_id_tipo_operacao = Column(ForeignKey('tipo_operacao.id_tipo_operacao'), nullable=False, Index=True)
      elemento_financeiro_id_elemento_financeiro = Column(ForeignKey('elemento_financeiro.id_elemento_financeiro'), nullable=False, Index=True)
      quantidade = Column(FLOAT, nullable=False)
      preco_unitario = Column(FLOAT, nullable=False)
      valor_corretagem = Column(FLOAT, nullable=False)
      valor_iof = Column(FLOAT, nullable=False)
      valor_ir = Column(FLOAT, nullable=False)
      valor_total = Column(FLOAT, nullable=False)
      taxa_operacao = Column(FLOAT)

      data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))


class TipoOperacao(Base):
      __tablename__'tipo_operacao'

       id_tipo_operacao = Column(INTEGER(11), primary_key=True)
       nome_tipo_operacao = Column(String(45))
       impacta_cota = Column(Boolean)
       data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))
