SELECT
    (
        SELECT
            category_id
        FROM
            category
        WHERE
            `name` = 'Family'
    ) AS category_id,
    (
        SELECT
            `name`
        FROM
            category
        WHERE
            `name` = 'Family'
    ) AS film_category,
    title AS film_title
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
    );