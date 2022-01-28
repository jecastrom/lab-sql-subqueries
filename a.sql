SELECT
    *
FROM
    (
        SELECT
            title AS film_title
        FROM
            film
        WHERE
            film_id IN (
                SELECT
                    film_id
                FROM
                    film_actor
                WHERE
                    actor_id = (
                        SELECT
                            actor_id
                        FROM
                            (
                                SELECT
                                    actor_id,
                                    count(film_id) AS number_of_films
                                FROM
                                    film_actor
                                GROUP BY
                                    1
                                ORDER BY
                                    2 DESC
                                LIMIT
                                    1
                            ) t
                    )
            )
    ) t0, (
        SELECT
            concat(first_name, ' ', last_name) AS most_prolific_actor_name
        FROM
            actor
        WHERE
            actor_id = (
                SELECT
                    actor_id
                FROM
                    (
                        SELECT
                            actor_id,
                            count(film_id) AS number_of_films
                        FROM
                            film_actor
                        GROUP BY
                            1
                        ORDER BY
                            2 DESC
                        LIMIT
                            1
                    ) t1
            )
    ) t2;