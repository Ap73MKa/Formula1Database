SELECT
    p.ID,
    p.FIRST_NAME,
    p.SECOND_NAME,
    p.COUNTRY,
    YEAR(CURDATE()) - YEAR(p.BIRTH_DATE) - (DATE_FORMAT(CURDATE(), '%m%d') < DATE_FORMAT(p.BIRTH_DATE, '%m%d')) AS AGE
FROM
    PILOTS as p
WHERE
    YEAR(CURDATE()) - YEAR(p.BIRTH_DATE) BETWEEN 30 AND 40
GROUP BY
    p.COUNTRY, p.ID;