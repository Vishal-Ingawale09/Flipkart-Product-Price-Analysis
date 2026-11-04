SELECT * FROM flipkart_products;

--Overall Catalog KPIs (KPI Metrics)

SELECT 
    COUNT(*) AS total_products,
    ROUND(AVG(retail_price), 2) AS avg_retail_price,
    ROUND(AVG(discounted_price), 2) AS avg_selling_price,
    ROUND(AVG(discount_percentage), 2) AS avg_discount_pct
FROM flipkart_products;

--Top 10 Categories by Volume & Pricing Strategy

SELECT 
    primary_category,
    COUNT(*) AS product_count,
    ROUND(AVG(retail_price), 2) AS avg_retail_price,
    ROUND(AVG(discounted_price), 2) AS avg_selling_price,
    ROUND(AVG(discount_percentage), 2) AS avg_discount_pct
FROM flipkart_products
GROUP BY primary_category
ORDER BY product_count DESC
LIMIT 10;

--Price Segment Share & Discount Depth (Subquery / Share %)

SELECT 
	price_segment,
	COUNT(*) AS product_count,
	ROUND(COUNT(*) *100.0 / (SELECT COUNT(*) FROM flipkart_products), 2),
	ROUND(AVG(discount_percentage), 2) AS avg_discount_pct
FROM flipkart_products
GROUP BY price_segment
ORDER BY product_count DESC;

--Top Aggressive Discounting Brands (HAVING Clause)

SELECT
	brand,
	COUNT(*) AS product_count,
	ROUND(AVG(retail_price), 2) AS avg_retail_price,
	ROUND(AVG(discounted_price), 2) AS avg_selling_price,
	ROUND(AVG(discount_percentage), 2) AS avg_discount_pct
FROM flipkart_products
WHERE brand != 'Generic / Unknown'
GROUP BY brand
HAVING COUNT(*) >= 20
ORDER BY avg_discount_pct DESC
LIMIT 10;

--Top 3 Sub-Categories per Category (Advanced CTE & DENSE_RANK Window Function)

WITH CategoryRanks AS (
	SELECT 
	primary_category,
	sub_category,
	COUNT(*) AS product_count,
	ROUND(AVG(discount_percentage), 2) avg_discount,
	DENSE_RANK() OVER(PARTITION BY primary_category ORDER BY COUNT(*) DESC) AS rnk
	FROM flipkart_products
	WHERE primary_category IN ('Clothing', 'Jewellery', 'Footweare')
	GROUP BY primary_category, sub_category
)
SELECT
	primary_category,
	sub_category,
	product_count,
	avg_discount
FROM CategoryRanks
WHERE rnk <= 3;









