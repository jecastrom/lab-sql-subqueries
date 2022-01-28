SELECT
    c.customer_id,
    concat(c.first_name, ' ', c.last_name) AS customer_name,
    c.email,
    co.country
FROM
    customer c
    INNER JOIN address a ON c.address_id = a.address_id
    INNER JOIN city ci ON a.city_id = ci.city_id
    INNER JOIN country co ON ci.country_id = co.country_id
WHERE
    country = 'Canada';