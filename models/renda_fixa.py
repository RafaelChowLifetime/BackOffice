class RendaFixa(Base):
      __tablename__'renda_variavel'

      id_renda_fixa = Column(INTEGER(11), primary_key=True)
      elemento_financeiro_id_elemento_financeiro = Column(ForeignKey('elemento_financeiro.id_elemento_financeiro'), nullable=False, Index=True)
      data_emissao = Column(DATETIME, nullable=False)
      data_vencimento = Column(DATETIME, nullable=False)
      taxa = Column(FLOAT, nullable=False)
      indice_id_indice = Column(ForeignKey('indice.id_indice'), nullable=False, Index=True)

      data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))
