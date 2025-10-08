import pandas as pd
import psycopg2
from psycopg2 import sql

# =========================
# Configurações do PostgreSQL
# =========================
DB_CONFIG = {
    "host": "localhost",
    "port": 5432,
    "database": "ecomerce",
    "user": "postgres",
    "password": "123"
}

# =========================
# Caminhos dos arquivos CSV
# =========================
FILES = {
    "dim_customers": "/home/caldeirao/projetos/dashboard-ecommerce/data/processed/dim_customers.csv",
    "dim_products": "/home/caldeirao/projetos/dashboard-ecommerce/data/processed/dim_products.csv",
    "fact_sales": "/home/caldeirao/projetos/dashboard-ecommerce/data/processed/fact_sales.csv"
}

# =========================
# Função para importar CSV
# =========================
def import_csv_to_postgres(table_name, file_path, conn):
    df = pd.read_csv(file_path)
    columns = list(df.columns)
    
    with conn.cursor() as cur:
        for i, row in df.iterrows():
            values = [row[col] for col in columns]
            insert = sql.SQL("INSERT INTO {} ({}) VALUES ({}) ON CONFLICT DO NOTHING").format(
                sql.Identifier(table_name),
                sql.SQL(', ').join(map(sql.Identifier, columns)),
                sql.SQL(', ').join(sql.Placeholder() * len(columns))
            )
            cur.execute(insert, values)
        conn.commit()
    print(f"✅ {table_name} importada com sucesso! Total de {len(df)} registros.")

# =========================
# Conexão e importação
# =========================
def main():
    try:
        conn = psycopg2.connect(**DB_CONFIG)
        print("🔌 Conectado ao PostgreSQL com sucesso!")
        
        for table, file_path in FILES.items():
            import_csv_to_postgres(table, file_path, conn)
        
    except Exception as e:
        print("❌ Erro:", e)
    finally:
        if conn:
            conn.close()
            print("🔒 Conexão encerrada.")

if __name__ == "__main__":
    main()
