-- 1. How many actors are there with the last name ‘Wahlberg’?

SELECT first_name, last_name 
FROM actor
WHERE last_name = 'Wahlberg'

-- output: 2

-- 2. How many payments were made between $3.99 and $5.99?

SELECT count(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

-- Output: 5,607

-- 3. What film does the store have the most of? (search in inventory)

SELECT DISTINCT film_id, count(film_id), store_id
FROM inventory
GROUP BY DISTINCT film_id, store_id;
-- Output: film id 969
SELECT *
FROM inventory;

-- film id 969 = West Lion

-- 4. How many customers have the last name ‘William’?

SELECT *
FROM customer
WHERE last_name = 'William';

-- Output: 0

-- 5. What store employee (get the id) sold the most rentals?

SELECT *
FROM staff;

SELECT DISTINCT staff_id, count(staff_id)
FROM rental
GROUP BY DISTINCT staff_id;

-- staff id 1 sold 8,040 rentals

-- Output: Mike Hillyer
 
-- 6. How many different district names are there?

SELECT count(district)
FROM address;

-- Output: 603

-- 7. What film has the most actors in it? (use film_acto r table and get film_id)

SELECT count(actor_id), film_id
FROM film_actor
GROUP BY film_id
ORDER BY count(actor_id) DESC;

-- Output: Lambs Cincinatti

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)

SELECT count(last_name), store_id
FROM customer
WHERE last_name like '%es'
GROUP BY store_id;

-- Output: 13

-- 9. How many payment amount s (4.99, 5.99 , etc.) had a number of rentals above 250 for customers with ids between 380 and 430? ( use group by and having > 250)

SELECT *
FROM payment;

SELECT DISTINCT amount, count(amount)
FROM payment
WHERE customer_id BETWEEN 380 AND 480
GROUP BY DISTINCT amount
HAVING count(amount) > 250;

-- Output: 3

-- 10. Within the film table, how many rating categories are there? And what rating has the most movies total?

SELECT DISTINCT rating, count(rating) 
FROM film
GROUP BY DISTINCT rating
ORDER BY count(rating) DESC;

-- Output: 5, PG-13
