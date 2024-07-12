SELECT w1.id
FROM weather w1
JOIN weather w2
    ON w1.recordDate-1 = w2.recordDate
    AND w1.temperature > w2.temperature