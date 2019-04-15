class RendaVariavel(Base):
    __tablename__'renda_variavel'
    id_renda_variavel = Column(INTEGER(11), primary_key=True)
    elemento_financeiro_id_elemento_financeiro = Column(ForeignKey('elemento_financeiro.id_elemento_financeiro'), nullable=False, Index=True)
    data_vencimento = Column(DATETIME, nullable=False)
    renda_variavel_id_renda_variavel = Column(INTEGER(11))
    strike_price = Column(FLOAT)
    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))
