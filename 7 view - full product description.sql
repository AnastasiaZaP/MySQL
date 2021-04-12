CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `full_product_description` AS
    SELECT 
        `c`.`tea_name` AS `tea_name`,
        `m`.`country` AS `country`,
        `t`.`category` AS `category`,
        `t`.`description` AS `description`
    FROM
        ((`catalog` `c`
        LEFT JOIN `manufacturers` `m` ON ((`m`.`id` = `c`.`manufacturers_id`)))
        LEFT JOIN `tea_categories` `t` ON ((`t`.`id` = `c`.`tea_categories_id`)))