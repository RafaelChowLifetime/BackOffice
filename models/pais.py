class Pais(Base):
      __tablename__'pais'

      id_pais = Column(INTEGER(11), primary_key=True)
      nome_pais = Column(String(40))

      data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))


class Nacionalidade(Base):
    __tablename__'nacionalidade'

    id_nacionalidade = Column(INTEGER(11), primary_key=True)
    pais_id_pais = Column(ForeignKey('pais.id_pais'), nullable=False, Index=True)
    nome_nacionalidade = Column(String(70))
    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))
