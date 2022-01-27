SELECT
    title AS film_title,
    length AS above_avg_duration
FROM
    film
WHERE
    length > (
        SELECT
            avg(length)
        FROM
            film
    )
ORDER BY
    2 DESC
LIMIT
    10;