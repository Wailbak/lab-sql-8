USE sakila;


SELECT title, length, RANK() OVER (ORDER BY length DESC) AS ranking
FROM film
WHERE length IS NOT NULL AND length > 0
ORDER BY length DESC;



SELECT 
    title,
    length,
    rating,
    RANK() OVER (PARTITION BY rating ORDER BY length DESC) AS ranking
FROM 
    film
WHERE 
    length IS NOT NULL AND length > 0
ORDER BY 
    rating,
    length DESC;
    
    

SELECT 
    c.name AS category_name,
    COUNT(fc.film_id) AS number_of_films
FROM 
    category c
JOIN 
    film_category fc ON c.category_id = fc.category_id
GROUP BY 
    c.name
ORDER BY 
    number_of_films DESC, 
    category_name;


SELECT 
    a.actor_id, 
    a.first_name, 
    a.last_name, 
    COUNT(fa.film_id) AS number_of_films
FROM 
    actor a
JOIN 
    film_actor fa ON a.actor_id = fa.actor_id
GROUP BY 
    a.actor_id
ORDER BY 
    number_of_films DESC
LIMIT 1;


SELECT 
    c.customer_id, 
    c.first_name, 
    c.last_name, 
    COUNT(r.rental_id) AS number_of_rentals
FROM 
    customer c
JOIN 
    rental r ON c.customer_id = r.customer_id
GROUP BY 
    c.customer_id
ORDER BY 
    number_of_rentals DESC
LIMIT 1;


SELECT 
    f.film_id, 
    f.title, 
    COUNT(r.rental_id) AS rental_count
FROM 
    film f
JOIN 
    inventory i ON f.film_id = i.film_id
JOIN 
    rental r ON i.inventory_id = r.inventory_id
GROUP BY 
    f.film_id
ORDER BY 
    rental_count DESC
LIMIT 1;














