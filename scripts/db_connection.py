import os
from dotenv import load_dotenv
from sqlalchemy import create_engine

# Carregar variáveis do .env
load_dotenv()

DB_NAME = os.getenv("DB_NAME", "ecomerce")  # default se não existir
DB_USER = os.getenv("DB_USER", "postgres")
DB_PASSWORD = os.getenv("DB_PASSWORD", "")
DB_HOST = os.getenv("DB_HOST", "localhost")
DB_PORT = os.getenv("DB_PORT", "5432")

def get_engine():
    """Cria conexão com PostgreSQL via SQLAlchemy"""
    url = f"postgresql+psycopg2://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}"
    engine = create_engine(url)
    return engine
