-- ===============================
-- Criação das tabelas
-- ===============================

CREATE TABLE IF NOT EXISTS dim_customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_name VARCHAR(100),
    customer_city VARCHAR(100),
    customer_state VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS dim_products (
    product_id VARCHAR(50) PRIMARY KEY,
    product_category VARCHAR(100),
    product_price NUMERIC
);

CREATE TABLE IF NOT EXISTS fact_sales (
    order_id VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(50),
    product_id VARCHAR(50),
    order_date DATE,
    quantity INT,
    product_price NUMERIC,
    revenue NUMERIC,
    FOREIGN KEY (customer_id) REFERENCES dim_customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES dim_products(product_id)
);

-- ===============================
-- Limpeza das tabelas
-- ===============================

TRUNCATE fact_sales CASCADE;
TRUNCATE dim_products CASCADE;
TRUNCATE dim_customers CASCADE;







