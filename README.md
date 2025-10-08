# Dashboard E-commerce

## Visão Geral

Este projeto apresenta um pipeline completo de dados para e-commerce, integrando ETL, análise e visualização interativa. O objetivo é fornecer insights estratégicos sobre vendas, receita, comportamento de clientes e desempenho de categorias, utilizando dados reais processados e visualizados em Metabase e Power BI.

---

## Principais Métricas e Visualizações

- **Ticket Médio:** Valor médio das vendas.
- **Número de Vendas:** Total de transações registradas.
- **Receita Total:** Soma geral das vendas.
- **Categoria Mais Vendida:** Distribuição percentual por categoria (Beleza, Casa, Eletrônicos, Esporte, Roupas).
- **Vendas por Estado:** Receita agregada por UF do cliente.
- **Vendas por Cidade:** Ranking das cidades com maior receita.
- **Categoria por Ano e Estado:** Evolução das vendas por categoria, estado e ano.

*Exemplo de dashboard Metabase:*

![Dashboard E-commerce](metabase/prints/dashboard.png)

---

## Pipeline de Dados

1. **Coleta:** Dados brutos em `data/raw/ecommerce.csv`.
2. **Processamento:** Scripts Python (`scripts/transform.py`) realizam limpeza, transformação e exportação para CSVs de dimensões e fatos.
3. **Carga:** Scripts SQL (`sql/create_tables_postgres.sql`, `sql/insert_data_postgres.sql`) criam e populam tabelas no PostgreSQL.
4. **Visualização:** Dashboards interativos em Metabase (`metabase/prints/`) e Power BI (`powerbi/dashboard.pbix`).

---

## Estrutura do Projeto

```
├── data/
│   ├── raw/         # Dados brutos
│   └── processed/   # Dados tratados (dim_*, fact_*)
├── scripts/         # ETL e conexão com banco
├── sql/             # Criação, inserção e KPIs
├── notebooks/       # Exploração e análise
├── powerbi/         # Dashboard Power BI
├── metabase/        # Prints Metabase
├── requirements.txt # Dependências Python
└── README.md        # Este arquivo
```

---

## Como Executar

1. Instale dependências:
   ```bash
   pip install -r requirements.txt
   ```
2. Execute o ETL:
   ```bash
   python scripts/transform.py
   ```
3. Crie e popule as tabelas no PostgreSQL:
   ```bash
   psql -U postgres -d ecomerce -f sql/create_tables_postgres.sql
   psql -U postgres -d ecomerce -f sql/insert_data_postgres.sql
   ```
4. Visualize os dashboards em Metabase ou Power BI.

---

## Diferenciais Profissionais

- **Pipeline modular e automatizado:** Facilita manutenção e escalabilidade.
- **Visualização clara e estratégica:** Dashboards focados em KPIs relevantes para negócios.
- **Documentação e convenções:** Estrutura padronizada, facilitando onboarding e colaboração.
- **Integração com ferramentas líderes:** PostgreSQL, Metabase, Power BI.

---

## Autor

Projeto desenvolvido por [Daniel Caldeirão].  
Para dúvidas técnicas, consulte `.github/copilot-instructions.md`.
