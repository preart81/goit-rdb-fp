/* 
 * Атрибути Entity та Code постійно повторюються. Позбудьтеся цього за допомогою нормалізації даних. 
 * Нормалізуйте таблицю `infectious_cases` до 3ї нормальної форми. Збережіть у цій же схемі дві таблиці з нормалізованими даними.
 */
-- * Створюємо таблицю entities
DROP TABLE if EXISTS `entities`
;

CREATE TABLE
  IF NOT EXISTS `entities` (
    `id` INT NOT NULL AUTO_INCREMENT
  , `entity` VARCHAR(50) NOT NULL
  , `code` VARCHAR(50) NULL
  , PRIMARY KEY (`id`)
  )
;

-- * Заповнюємо таблицю entities
INSERT INTO
  `entities` (`entity`, `code`)
SELECT DISTINCT
  `entity`
, `code`
FROM
  `infectious_cases`
;

-- * створюємо таблицю infectious_cases_nf
DROP TABLE if EXISTS `infectious_cases_nf`
;

CREATE TABLE
  IF NOT EXISTS `infectious_cases_nf` (
    `id` INT NOT NULL AUTO_INCREMENT
  , `entity_id` INT NULL
  , `Year` INT unsigned DEFAULT NULL
  , `number_yaws` INT DEFAULT NULL
  , `polio_cases` INT DEFAULT NULL
  , `cases_guinea_worm` INT DEFAULT NULL
  , `number_rabies` DOUBLE DEFAULT NULL
  , `number_malaria` DOUBLE DEFAULT NULL
  , `number_hiv` DOUBLE DEFAULT NULL
  , `number_tuberculosis` DOUBLE DEFAULT NULL
  , `number_smallpox` INT DEFAULT NULL
  , `number_cholera_cases` INT DEFAULT NULL
  , PRIMARY KEY (`id`)
  , CONSTRAINT `fk_infectious_cases_nf_entities` FOREIGN key (`entity_id`) REFERENCES `entities` (`id`)
  )
;

-- * Заповнюємо таблицю infectious_cases_nf
INSERT INTO
  `infectious_cases_nf` (
    `entity_id`
  , `Year`
  , `number_yaws`
  , `polio_cases`
  , `cases_guinea_worm`
  , `number_rabies`
  , `number_malaria`
  , `number_hiv`
  , `number_tuberculosis`
  , `number_smallpox`
  , `number_cholera_cases`
  )
SELECT
  `entities`.`id`
, `Year`
, `number_yaws`
, `polio_cases`
, `cases_guinea_worm`
, `number_rabies`
, `number_malaria`
, `number_hiv`
, `number_tuberculosis`
, `number_smallpox`
, `number_cholera_cases`
FROM
  `infectious_cases`
  LEFT JOIN `entities` ON `infectious_cases`.`entity` = `entities`.`entity`
;