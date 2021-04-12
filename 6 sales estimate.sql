-- Оценка продаж
SELECT 
	ol.id_catalog,
    c.tea_name,
    COUNT(ol.id_catalog) AS number_of_sales,
    IF(COUNT(ol.id_catalog) >= 2, 'хорошо продается', 'надо поднять продажи') AS sales_estimate
FROM order_list ol
LEFT JOIN catalog c ON c.id = ol.id_catalog
GROUP BY ol.id_catalog
ORDER BY number_of_sales DESC;

