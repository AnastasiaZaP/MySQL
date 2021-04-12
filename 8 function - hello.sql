CREATE DEFINER=`root`@`localhost` FUNCTION `hello`() RETURNS char(245) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
    DETERMINISTIC
BEGIN
	DECLARE good_morning CHAR (245);
    DECLARE good_day CHAR (245);
    DECLARE good_evening CHAR (245);
    DECLARE good_night CHAR (245);
    SET good_morning = 'Доброе утро! Добро пожаловать в наш интернет-магазин. В столь ранний час рекомендуем взбодриться чашечкой пуэра или красного чая. Но если вы любите другой продукт, у нас вы найдете то, что вам по душе. В нашем каталоге всегда актуальные товары.';
    SET good_day = 'Добрый день! Добро пожаловать в наш интернет-магазин. Для данного времени суток подойдет любой чай. В нашем каталоге всегда актуальные товары.';
    SET good_evening = 'Добрый вечер! Добро пожаловать в наш интернет-магазин. Перед сном лучше выпить иван-чай. Но если вы любите другой продукт, у нас вы найдете то, что вам по душе. В нашем каталоге всегда актуальные товары.';
    SET good_night = 'Добро пожаловать в наш интернет-магазин. В нашем каталоге всегда актуальные товары. Рекомендуем оформить заказ и лечь спать. Доброй ночи!';
    CASE
		WHEN CURTIME() BETWEEN '06:00:00' AND '11:59:59' THEN RETURN good_morning;
		WHEN CURTIME() BETWEEN '12:00:00' AND '17:59:59' THEN RETURN good_day;
        WHEN CURTIME() BETWEEN '18:00:00' AND '23:59:59' THEN RETURN good_evening;
        WHEN CURTIME() BETWEEN '00:00:00' AND '05:59:59' THEN RETURN good_night;
	END CASE;

END