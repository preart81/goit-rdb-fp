/* 
 * 3. Проаналізуйте дані:
 * Для кожної унікальної комбінації Entity та Code або їх id порахуйте середнє, мінімальне, максимальне значення та суму для атрибута Number_rabies.
 * 💡 Врахуйте, що атрибут Number_rabies може містити порожні значення ‘’ — вам попередньо необхідно їх відфільтрувати.
 * Результат відсортуйте за порахованим середнім значенням у порядку спадання.
 * Оберіть тільки 10 рядків для виведення на екран.
 */
SELECT
  `entity`
, `code`
, ROUND(AVG(`number_rabies`)) AS `avg_number_rabies`
, ROUND(MIN(`number_rabies`)) AS `min_number_rabies`
, ROUND(MAX(`number_rabies`)) AS `max_number_rabies`
, ROUND(SUM(`number_rabies`)) AS `sum_number_rabies`
FROM
  pandemic.infectious_cases_nf icn
  LEFT JOIN pandemic.entities e ON icn.entity_id = e.id
WHERE
  `number_rabies` != ''
  AND `number_rabies` IS NOT NULL
GROUP BY
  `entity`
, `code`
ORDER BY
  `avg_number_rabies` DESC
LIMIT
  10
;