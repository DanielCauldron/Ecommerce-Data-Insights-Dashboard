-- Dimensão de clientes
CREATE TABLE IF NOT EXISTS dim_customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_name VARCHAR(100),
    customer_city VARCHAR(100),
    customer_state VARCHAR(50)
);

-- Dimensão de produtos
CREATE TABLE IF NOT EXISTS dim_products (
    product_id VARCHAR(50) PRIMARY KEY,
    product_category VARCHAR(100),
    product_price NUMERIC
);

-- Fato de vendas
CREATE TABLE IF NOT EXISTS fact_sales (
    fact_id SERIAL PRIMARY KEY,  -- surrogate key
    order_id VARCHAR(50),
    customer_id VARCHAR(50),
    product_id VARCHAR(50),
    order_date DATE,
    quantity INT,
    product_price NUMERIC,
    revenue NUMERIC,
    CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES dim_customers(customer_id),
    CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES dim_products(product_id),
    CONSTRAINT uq_sales UNIQUE (order_id, customer_id, product_id) -- evita duplicação
);
