SELECT
    a.actor_id,
    concat(a.first_name, ' ', a.last_name) AS actors,
    (
        SELECT
            title
        FROM
            film
        WHERE
            title = 'Alone Trip'
    ) AS film_title
FROM
    film f
    INNER JOIN film_actor fa ON f.film_id = fa.film_id
    INNER JOIN actor a ON fa.actor_id = a.actor_id
WHERE
    title = 'Alone Trip'
GROUP BY
    1;