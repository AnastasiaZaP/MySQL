-- По региону достввки (округу Москвы) найдены партнеры, которых можно рекламировать
-- клиентам по указанным контактам - электронной почте и телефону
SELECT 
	rc.id AS customer_id,
    CONCAT(rc.firstname, ' ',rc.lastname) AS `name`,
    CONCAT(rc.email, ',', ' ', rc.phone) AS customer_contacts_for_advertising_partners,
    ol.delivery_region AS customers_delivery_region,
    p.partner_region,
    p.name_of_shop AS advertised_shop
FROM online_tea_shop.registered_customers rc
JOIN order_list ol ON ol.customers_id = rc.id
JOIN partners p ON p.partner_region = ol.delivery_region
GROUP BY customer_id
ORDER BY customer_id