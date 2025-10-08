# Copilot Instructions for AI Coding Agents

## Visão Geral do Projeto
Este projeto é um dashboard de e-commerce com foco em análise de dados, ETL e visualização. Ele utiliza Python para scripts de transformação e conexão com banco de dados, SQL para manipulação de dados, e ferramentas como Metabase e Power BI para visualização.

## Estrutura Principal
- `data/`: Dados brutos e processados. Arquivos CSV para dimensões e fatos.
- `scripts/`: Scripts Python para ETL e conexão com banco de dados.
- `sql/`: Scripts SQL para criação de tabelas, inserção e consultas de KPIs.
- `notebooks/`: Análises exploratórias em Jupyter Notebook.
- `powerbi/` e `metabase/`: Dashboards e prints para visualização.
- `tests/`: (Pasta reservada para testes, sem exemplos presentes ainda)

## Fluxo de Dados
1. Dados brutos em `data/raw/ecommerce.csv`.
2. Processamento via scripts Python (`scripts/transform.py`).
3. Dados processados salvos em `data/processed/`.
4. Scripts SQL (`sql/`) para criar tabelas e inserir dados no PostgreSQL.
5. Visualização em Metabase/Power BI.

## Convenções e Padrões
- Scripts Python usam funções para ETL e conexão (ex: `db_connection.py`).
- Dados processados seguem padrão de nomenclatura: `dim_*` para dimensões, `fact_*` para fatos.
- SQL separado por propósito: criação, inserção, KPIs.
- Visualizações não são geradas por código, mas por ferramentas externas.

## Workflows Essenciais
- **ETL:** Execute `transform.py` para processar dados.
- **Banco de Dados:** Use scripts SQL para criar e popular tabelas.
- **Visualização:** Atualize dashboards manualmente em Power BI/Metabase.
- **Testes:** (Sem exemplos, mas scripts podem ser testados isoladamente)

## Integrações e Dependências
- Python (veja `requirements.txt` para dependências).
- PostgreSQL para armazenamento de dados.
- Ferramentas externas: Metabase, Power BI.

## Exemplos de Padrões
- Função de conexão em `scripts/db_connection.py`:
  ```python
  def connect_postgres():
      # ...conexão usando psycopg2...
  ```
- Transformação de dados em `scripts/transform.py`:
  ```python
  def process_data():
      # ...leitura, limpeza e exportação de CSV...
  ```

## Recomendações para Agentes
- Priorize automação dos fluxos ETL e SQL.
- Mantenha a separação clara entre dados brutos, processados e scripts.
- Documente comandos não triviais para build/test/debug se forem criados.
- Atualize este arquivo conforme novas convenções surgirem.
