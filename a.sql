SELECT
    concat(c.first_name, ' ', c.last_name) AS customer_name,
    round(sum(amount), 2) AS amount
FROM
    customer c
    JOIN payment p ON c.customer_id = p.customer_id
GROUP BY
    1
HAVING
    amount > (
        SELECT
            avg(amount)
        FROM
            (
                SELECT
                    concat(c.first_name, ' ', c.last_name) AS customer_name,
                    round(sum(amount), 2) AS amount
                FROM
                    customer c
                    JOIN payment p ON c.customer_id = p.customer_id
                GROUP BY
                    1
            ) AS sub1
    )
ORDER BY
    2 DESC;