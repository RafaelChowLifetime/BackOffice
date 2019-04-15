class AliasNomeElementoFinanceiro(Base):

    __tablename__'alias_nome_elemento_financeiro'

    alias_nome_elemento_financeiro = Column(INTEGER(11), primary_key=True)
    elemento_financeiro_id_elemento_financeiro = Column(ForeignKey('elemento_financeiro.id_elemento_financeiro'), nullable=False, Index=True)
    alias_elemento_financeiro_sistema = Column(String(60))

    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))


class AliasSubTipoElementoFinanceiro(Base):

    __tablename__'alias_sub_tipo_elemento_financeiro'

    id_alias_sub_tipo_elemento_financeiro = Column(INTEGER(11), primary_key=True)
    sub_tipo_ativo_id_sub_tipo_ativo = Column(ForeignKey('sub_tipo_ativo.id_sub_tipo_ativo'), nullable=False, Index=True)
    alias_sub_elemento_financeiro_sistema = Column(String(60))
    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))


class AliasTipoElementoFinanceiro(Base):
    __tablename__'alias_tipo_elemento_financeiro'
    alias_tipo_elemento_financeiro = Column(INTEGER(11), primary_key=True)
    tipo_ativo_id_tipo_ativo = Column(ForeignKey('tipo_ativo.id_tipo_ativo'), nullable=False, Index=True)
    id_sistema = Column(INTEGER(11), nullable=False)
    alias_tipo_ativo_sistema = Column(String(60))
    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))


class Benchmark(Base):
    __tablename__'benchmark'
    id_benchmark = Column(INTEGER(11), primary_key=True)
    nome_benchmark = Column(String(45), nullable=False)
    elemento_financeiro_id_elemento_financeiro = Column(INTEGER(11))
    indice_id_indice = Column(INTEGER(11))
    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))


class ElementoFinanceiro(Base):
    __tablename__'elemento_financeiro'
    id_elemento_financeiro = Column(INTEGER(11), primary_key=True)
    sub_tipo_elemento_financeiro_id_sub_tipo_ativo = Column(ForeignKey('sub_tipo_elemento_financeiro.id_sub_tipo_ativo'), nullable=False, Index=True)
    pais_id_pais = Column(ForeignKey('pais.id_pais'), nullable=False, Index=True)
    moeda_id_moeda = Column(ForeignKey('moeda.id_moeda'), nullable=False, Index=True)
    nome_elemento_financeiro = Column(String(45), nullable=False)
    cnpj = Column(String(11))
    isin = Column(String(45))
    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))


class Indice(Base):
    __tablename__'indice'
    id_indice = Column(INTEGER(11), primary_key=True)
    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))


class Moeda(Base):
    __tablename__'moeda'
    id_moeda = Column(INTEGER(11), primary_key=True)
    pais_id_pais = Column(ForeignKey('pais.id_pais'), nullable=False, Index=True)
    nome_moeda = Column(String(45), nullable=False)
    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))



class Sistema(Base):
    __tablename__'sistema'
    id_sistema = Column(INTEGER(11), primary_key=True)
    nome_sistema = Column(String(45), nullable=False)
    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))


class SubTipoElementoFinanceiro(Base):
    __tablename__'sub_tipo_elemento_financeiro'
    id_sub_tipo_elemento_financeiro = Column(INTEGER(11), primary_key=True)
    tipo_ativo_id_tipo_ativo = Column(ForeignKey('tipo_ativo.id_tipo_ativo'), nullable=False, Index=True)
    id_tipo_ativo = Column(INTEGER(11), nullable=False)
    nome_subtipo_ativo = Column(String(45), nullable=False)
    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))

class TipoElementoFinanceiro(Base):
    __tablename__'tipo_elemento_financeiro'
    id_tipo_elemento_financeiro = Column(INTEGER(11), primary_key=True)
    nome_tipo_elemento_financeiro = Column(String(45), nullable=False)
    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))
