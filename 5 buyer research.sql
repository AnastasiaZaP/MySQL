-- Исследование покупателей: пол, средний возраст, наиболее предпочитаемый продукт
SELECT 
	gender,
	ROUND(AVG(timestampdiff(YEAR, date_of_birth, NOW())), 2) AS average_age,
    c.tea_name AS preferred_product,
    COUNT(gender) AS number_of_customers
FROM online_tea_shop.registered_customers rc
JOIN order_list ol ON ol.customers_id = rc.id
JOIN catalog c ON c.id = ol.id_catalog
WHERE gender = 'м'
GROUP BY c.tea_name
HAVING number_of_customers >= 2
UNION
SELECT
	gender,
	ROUND(AVG(timestampdiff(YEAR, date_of_birth, NOW())), 2) AS average_age,
    c.tea_name AS preferred_product,
    COUNT(gender) AS number_of_customers
FROM online_tea_shop.registered_customers rc
JOIN order_list ol ON ol.customers_id = rc.id
JOIN catalog c ON c.id = ol.id_catalog
WHERE gender = 'ж'
GROUP BY c.tea_name
HAVING number_of_customers >= 2
ORDER BY average_age