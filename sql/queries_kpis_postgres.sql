-- Receita total
SELECT SUM(revenue) AS total_revenue
FROM fact_sales;

-- Ticket médio
SELECT AVG(revenue) AS avg_ticket
FROM fact_sales;

-- Receita por estado
SELECT c.customer_state, SUM(f.revenue) AS revenue_state
FROM fact_sales f
JOIN dim_customers c ON f.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY revenue_state DESC;

-- Top 5 produtos mais vendidos (por quantidade)
SELECT p.product_category, SUM(f.quantity) AS total_sold
FROM fact_sales f
JOIN dim_products p ON f.product_id = p.product_id
GROUP BY p.product_category
ORDER BY total_sold DESC
LIMIT 5;

-- 📈 Produtos mais lucrativos (por receita total)
SELECT p.product_category,
       SUM(f.revenue) AS total_revenue
FROM fact_sales f
JOIN dim_products p ON f.product_id = p.product_id
GROUP BY p.product_category
ORDER BY total_revenue DESC
LIMIT 5;

-- Clientes novos por mês
SELECT DATE_TRUNC('month', order_date) AS month,
       COUNT(DISTINCT customer_id) AS new_customers
FROM fact_sales
GROUP BY month
ORDER BY month;

-- Vendas mensais (quantidade e receita)
SELECT DATE_TRUNC('month', order_date) AS month,
       SUM(quantity) AS total_quantity,
       SUM(revenue) AS total_revenue
FROM fact_sales
GROUP BY month
ORDER BY month;
