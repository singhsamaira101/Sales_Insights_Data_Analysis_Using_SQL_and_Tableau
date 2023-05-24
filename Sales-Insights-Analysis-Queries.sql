-- Q.1. Show all customers records.
SELECT * FROM customers;

-- Q.2. Show total number of customers
SELECT COUNT(*) FROM customers;

-- Q.3. Show transactions for Chennai market (market code for chennai is Mark001)
SELECT * FROM transactions 
WHERE market_code='Mark001';


-- Q.4. Which customer has the most sales quantity?
SELECT customers.custmer_name, transactions.sales_qty
FROM customers
JOIN transactions ON customers.customer_code = transactions.customer_code
ORDER BY transactions.sales_qty DESC;

-- Q.5. Show distrinct product codes that were sold in chennai.
SELECT DISTINCT product_code FROM transactions 
WHERE market_code='Mark001';

-- Q.6. Show transactions where currency is US dollars.
SELECT * FROM transactions 
WHERE currency="USD"

-- Q.7. Show all the transactions in 2020.
SELECT transactions.*, date.* 
FROM transactions 
JOIN date ON transactions.order_date = date.date 
WHERE date.year=2020;

-- Q.8. Show total revenue in the year 2020.
SELECT SUM(transactions.sales_amount) 
FROM transactions 
JOIN date ON transactions.order_date = date.date 
WHERE date.year = 2020 AND transactions.currency="INR\r" OR transactions.currency="USD\r";

-- Q.9. Show total revenue in year 2020, January Month.
SELECT SUM(transactions.sales_amount) 
FROM transactions 
JOIN date ON transactions.order_date = date.date where date.year=2020 
AND date.month_name="January" AND (transactions.currency="INR\r" OR transactions.currency="USD\r");

-- Q.10. Show total revenue in year 2020 in Chennai.
SELECT SUM(transactions.sales_amount) 
FROM transactions 
JOIN date ON transactions.order_date = date.date 
WHERE date.year = 2020 AND transactions.market_code="Mark001";