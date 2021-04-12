CREATE DEFINER=`root`@`localhost` TRIGGER `new_customer` AFTER INSERT ON `registered_customers` FOR EACH ROW BEGIN
  INSERT INTO new_customer 
    SET 
      id = NEW.id,
      `name` = CONCAT(NEW.firstname, ' ', NEW.lastname),
      gender = NEW.gender,
      email = NEW.email,
      phone = NEW.phone,
      created_at = NEW.created_at;
END