USE sakila;
SELECT*FROM actor;
SELECT*FROM customer;
SELECT*FROM address;
SELECT COUNT(actor_id) FROM actor;
SELECT*FROM film;
SELECT COUNT(film_id) FROM film;
SELECT 
    customer.first_name,
    customer.last_name,
    address.address,
    address.district
FROM customer
LEFT JOIN address ON customer.address_id = address.address_id;
SELECT 
    customer.first_name,
    customer.last_name,
    address.address,
    address.district
FROM customer
LEFT JOIN address ON customer.address_id = address.address_id
ORDER BY customer.first_name ASC;
SELECT 
    customer.first_name,
    customer.last_name,
    address.address,
    address.district
FROM customer
LEFT JOIN address ON customer.address_id = address.address_id
ORDER BY customer.first_name DESC;
SELECT 
    customer.first_name,
    customer.last_name,
    address.address,
    address.district
FROM customer
LEFT JOIN address ON customer.address_id = address.address_id
ORDER BY customer.first_name DESC
LIMIT 10;
SELECT 
    customer.first_name,
    customer.last_name,
    address.address,
    address.district
FROM customer
LEFT JOIN address ON customer.address_id = address.address_id
ORDER BY customer.first_name ASC
LIMIT 10;
SELECT 
    customer.first_name,
    customer.last_name,
    address.address,
    address.district
FROM customer
LEFT JOIN address ON customer.address_id = address.address_id
ORDER BY customer.first_name ASC
LIMIT 10,10;

SELECT 
    customer.first_name,
    customer.last_name,
    address.address,
    address.district
FROM customer
RIGHT JOIN address ON customer.address_id = address.address_id;
SELECT 
    customer.first_name,
    customer.last_name,
    address.address,
    address.district,
    city.city
FROM 
    customer
INNER JOIN
    address ON customer.address_id = address.address_id
INNER JOIN
    city ON address.city_id = city.city_id;
SELECT 
    customer.first_name,
    customer.last_name,
    address.address,
    address.district,
    city.city
FROM customer
INNER JOIN address ON customer.address_id = address.address_id
INNER JOIN city ON address.city_id = city.city_id;
SELECT 
    customer.first_name,
    customer.last_name,
    address.address,
    address.district,
    city.city,
    country.country
FROM customer
LEFT JOIN address ON customer.address_id = address.address_id
LEFT JOIN city ON address.city_id = city.city_id
LEFT JOIN country ON city.country_id = country.country_id;





















SELECT 
    film.title,
    film.release_year,
    actor.first_name,
    actor.last_name
FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE film.title LIKE 'A%';
SELECT 
    customer.first_name,
    customer.last_name,
    film.title,
    rental.rental_date,
    rental.return_date
FROM rental
JOIN customer ON rental.customer_id = customer.customer_id
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id
ORDER BY rental.rental_date
LIMIT 0,50;
SELECT 
    customer.first_name,
    customer.last_name,
    film.title,
    rental.rental_date,
    rental.return_date
FROM rental
JOIN customer ON rental.customer_id = customer.customer_id
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id
ORDER BY rental.rental_date
LIMIT 50,50;
SELECT 
    customer.first_name,
    customer.last_name,
    film.title,
    rental.rental_date,
    rental.return_date
FROM rental
JOIN customer ON rental.customer_id = customer.customer_id
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id
ORDER BY rental.rental_date
LIMIT 100,50;
SELECT 
    customer.first_name,
    customer.last_name,
    film.title,
    rental.rental_date,
    rental.return_date
FROM rental
JOIN customer ON rental.customer_id = customer.customer_id
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id
ORDER BY rental.rental_date
LIMIT 150,50;












SELECT 
    film.title,
    film.release_year,
    actor.first_name,
    actor.last_name
FROM 
    film f
JOIN 
    film ON film.film_id = fa.film_id
JOIN 
    actor a ON fa.actor_id = a.actor_id
WHERE 
    f.title LIKE 'A%';
SELECT 
    c.first_name,
    c.last_name,
    f.title,
    r.rental_date,
    r.return_date
FROM 
    rental r
JOIN 
    customer c ON r.customer_id = c.customer_id
JOIN 
    inventory i ON r.inventory_id = i.inventory_id
JOIN 
    film f ON i.film_id = f.film_id
ORDER BY 
    r.rental_date
LIMIT 50 OFFSET 0;
SELECT 
    f.title,
    f.release_year,
    c.first_name,
    c.last_name,
    r.rental_date,
    r.return_date
FROM 
    film f
JOIN 
    inventory i ON f.film_id = i.film_id
JOIN 
    rental r ON i.inventory_id = r.inventory_id
JOIN 
    customer c ON r.customer_id = c.customer_id
WHERE 
    f.title >= 'B' AND f.title < 'D'  -- Huruf B sampai C (kurang dari D)
ORDER BY 
    f.title ASC
LIMIT 100 OFFSET 0;
SELECT 
    a.first_name,
    a.last_name,
    COUNT(fa.film_id) AS total_films
FROM 
    actor a
LEFT JOIN 
    film_actor fa ON a.actor_id = fa.actor_id
GROUP BY 
    a.actor_id, a.first_name, a.last_name
ORDER BY 
    total_films ASC;
SELECT
    f.title,
    f.release_year,
    c.first_name AS customer_first_name,
    c.last_name AS customer_last_name,
    a.address,
    a.district,
    ci.city,
    a.postal_code,
    a.phone
FROM
    actor ac
JOIN
    film_actor fa ON ac.actor_id = fa.actor_id
JOIN
    film f ON fa.film_id = f.film_id
JOIN
    inventory i ON f.film_id = i.film_id
JOIN
    rental r ON i.inventory_id = r.inventory_id
JOIN
    customer c ON r.customer_id = c.customer_id
JOIN
    store s ON i.store_id = s.store_id
JOIN
    address a ON s.address_id = a.address_id
JOIN
    city ci ON a.city_id = ci.city_id
WHERE
    ac.first_name = 'GINA' AND ac.last_name = 'DEGENERES';



SELECT 
    film.title,
    film.release_year,
    actor.first_name,
    actor.last_name
FROM 
    film
JOIN 
    film_actor ON film.film_id = film_actor.film_id
JOIN 
    actor ON film_actor.actor_id = actor.actor_id
WHERE 
    film.title LIKE 'A%';
    
SELECT 
    customer.first_name,
    customer.last_name,
    film.title,
    rental.rental_date,
    rental.return_date
FROM 
    rental
JOIN 
    customer ON rental.customer_id = customer.customer_id
JOIN 
    inventory ON rental.inventory_id = inventory.inventory_id
JOIN 
    film ON inventory.film_id = film.film_id
ORDER BY 
    rental.rental_date
LIMIT 50 OFFSET 0;
SELECT 
    film.title,
    film.release_year,
    customer.first_name,
    customer.last_name,
    rental.rental_date,
    rental.return_date
FROM 
    film
JOIN 
    inventory ON film.film_id = inventory.film_id
JOIN 
    rental ON inventory.inventory_id = rental.inventory_id
JOIN 
    customer ON rental.customer_id = customer.customer_id
WHERE 
    film.title >= 'B' AND film.title < 'D'  -- Judul film berawalan B sampai C
ORDER BY 
    film.title ASC
LIMIT 100 OFFSET 0;
SELECT 
    actor.first_name,
    actor.last_name,
    COUNT(film_actor.film_id) AS jumlah_film
FROM 
    actor
LEFT JOIN 
    film_actor ON actor.actor_id = film_actor.actor_id
GROUP BY 
    actor.actor_id, actor.first_name, actor.last_name
ORDER BY 
    jumlah_film ASC;
SELECT
    film.title,
    film.release_year,
    customer.first_name AS customer_first_name,
    customer.last_name AS customer_last_name,
    address.address,
    address.district,
    city.city,
    address.postal_code,
    address.phone
FROM
    actor
JOIN
    film_actor ON actor.actor_id = film_actor.actor_id
JOIN
    film ON film_actor.film_id = film.film_id
JOIN
    inventory ON film.film_id = inventory.film_id
JOIN
    rental ON inventory.inventory_id = rental.inventory_id
JOIN
    customer ON rental.customer_id = customer.customer_id
JOIN
    store ON inventory.store_id = store.store_id
JOIN
    address ON store.address_id = address.address_id
JOIN
    city ON address.city_id = city.city_id
WHERE
    actor.first_name = 'GINA' AND actor.last_name = 'DEGENERES';




