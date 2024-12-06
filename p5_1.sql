/* 
 * 5. Побудуйте власну функцію.
 * Створіть і використайте функцію, що будує такий же атрибут, як і в попередньому завданні: функція має приймати на вхід значення року, а повертати різницю в роках між поточною датою та датою, створеною з атрибута року (1996 рік → ‘1996-01-01’).
 */

DROP FUNCTION IF EXISTS diff_year;

DELIMITER $$

CREATE FUNCTION `pandemic`.`diff_year`(_year INT) RETURNS int
    NO SQL
    DETERMINISTIC
BEGIN
  RETURN TIMESTAMPDIFF(YEAR, MAKEDATE(_year, 1), CURRENT_DATE());
END$$

DELIMITER ;
