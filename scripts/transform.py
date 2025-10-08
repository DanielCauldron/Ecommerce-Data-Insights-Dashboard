from sqlalchemy import create_engine

def get_engine():
    """
    Cria engine do SQLAlchemy para PostgreSQL local no WSL.
    Ajuste usuário e senha conforme o que você configurou.
    """
    user = "postgres"
    password = "1234"
    host = "localhost"
    port = "5432"
    database = "ecomerce"

    engine = create_engine(
        f"postgresql+psycopg2://{user}:{password}@{host}:{port}/{database}"
    )
    return engine
