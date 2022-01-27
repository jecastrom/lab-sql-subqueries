SELECT
    title,
    (
        SELECT
            count(inventory_id) AS num_of_copies
        FROM
            inventory
        WHERE
            film_id IN (
                SELECT
                    film_id
                FROM
                    film
                WHERE
                    title = 'Hunchback Impossible'
            )
    ) AS num_of_copies_available
FROM
    film
WHERE
    title = 'Hunchback Impossible';