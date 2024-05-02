-- all transactions for Chennai;
SELECT * FROM sales.transactions WHERE market_code="Mark001";

-- all transactions in USD 
SELECT * FROM sales.transactions WHERE currency = "USD";

-- all transactions from 2020 
SELECT sales.transactions.*, sales.date.* FROM sales.transactions INNER JOIN sales.date ON sales.transactions.order_date = sales.date.date WHERE sales.date.year = 2020;

-- total sales from 2020
SELECT SUM(sales.transactions.sales_amount) FROM sales.transactions INNER JOIN sales.date ON sales.transactions.order_date = sales.date.date WHERE sales.date.year = 2020;

-- total sales from 2019
SELECT SUM(sales.transactions.sales_amount) FROM sales.transactions INNER JOIN sales.date ON sales.transactions.order_date = sales.date.date WHERE sales.date.year = 2019;

-- total sales from 2020 for Chennai
SELECT SUM(sales.transactions.sales_amount) FROM sales.transactions INNER JOIN sales.date ON sales.transactions.order_date = sales.date.date WHERE sales.date.year = 2020 AND sales.transactions.market_code="Mark001";

-- what are the distinct product solde in Chennai 
SELECT DISTINCT product_code FROM sales.transactions WHERE market_code = "Mark001";

-- top 5 products with the least sales
SELECT DISTINCT sales.transactions.product_code, ROUND(SUM(sales.transactions.sales_amount), 2) AS Product_Sales FROM sales.transactions
GROUP BY sales.transactions.product_code
ORDER BY Product_Sales
LIMIT 5;

-- top 5 products with the most sales
SELECT DISTINCT sales.transactions.product_code, ROUND(SUM(sales.transactions.sales_amount), 2) AS Product_Sales FROM sales.transactions
GROUP BY sales.transactions.product_code
ORDER BY Product_Sales DESC
LIMIT 5;

-- market with the lowest sales 
SELECT DISTINCT sales.transactions.market_code, ROUND(SUM(sales.transactions.sales_amount), 2) AS Market_Sales FROM sales.transactions
GROUP BY sales.transactions.market_code
ORDER BY Market_Sales 
LIMIT 5;

-- market with the most sales 
SELECT DISTINCT sales.transactions.market_code, ROUND(SUM(sales.transactions.sales_amount), 2) AS Market_Sales FROM sales.transactions
GROUP BY sales.transactions.market_code
ORDER BY Market_Sales DESC
LIMIT 5;
