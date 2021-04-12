-- Через группы в социальных сетях, в которых состоят клиенты, найдены партнеры, когорых можно им рекламировать
SELECT 
	sg.social_network AS social_network,
    sg.group_name AS partners_and_customers_group,
    CONCAT(rc.firstname, ' ', rc.lastname) AS `name`,
    p.name_of_shop AS advertised_shop
FROM online_tea_shop.registered_customers rc
JOIN social_group sg ON sg.id = rc.social_group_id
JOIN partners p ON p.social_group_id = sg.id