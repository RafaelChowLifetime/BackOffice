from sqlalchemy import Column, Date, ForeignKey, String, TIMESTAMP, text
from sqlalchemy.dialects.mysql import INTEGER, FLOAT
from sqlalchemy.orm import relationship

Base = declarative_base()

class Saldo(Base):
    __tablename__ = 'saldo'
    id_saldo = Column(INTEGER(11), primary_key=True)
    conta_portfolio_id_conta_portfolio = Column(ForeignKey('conta_portfolio.id_conta_portfolio'), nullable=False, Index=True)
    data_saldo = Column(Date, nullable=False)
    valor = Column(FLOAT, nullable=False)

    data_atualizacao = Column(TIMESTAMP, nullable=False, server_default=text("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"))
