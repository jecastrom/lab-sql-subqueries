SELECT
    c.category_id,
    c.`name` AS category,
    f.film_id,
    f.title AS film_title
FROM
    film f
    INNER JOIN (
        SELECT
            film_id,
            category_id
        FROM
            film_category
    ) fc ON f.film_id = fc.film_id
    INNER JOIN (
        SELECT
            category_id,
            `name`
        FROM
            category
        WHERE
            `name` = 'Family'
    ) c ON fc.category_id = c.category_id
LIMIT
    10;
------********************************************
SELECT
    title
FROM
    film
WHERE
    film_id IN (
        SELECT
            film_id
        FROM
            film_category
        WHERE
            category_id = (
                SELECT
                    category_id
                FROM
                    category
                WHERE
                    name = 'Family'
            )
    )
LIMIT
    10;