SELECT name
FROM CUSTOMER
WHERE REFEREE_ID IS NULL
UNION ALL
SELECT NAME
FROM CUSTOMER
WHERE REFEREE_ID != 2
