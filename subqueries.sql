

SELECT first_name, last_name
FROM customer
INNER JOIN address ON customer.address_id = address.address_id
WHERE district = 'Texas';

---Jennifer Davis, Kim Cruze, Richard Maccrary, Bryan Hardison, Ian still

SELECT first_name, last_name, amount
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99

-- we got 3661 names thare above $6.99

SELECT first_name, last_name
FROM customer
WHERE customer_id IN ( 
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175
);


--- I get 135 names of people who made peyment amount of $175

SELECT first_name, first_name country
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE city_id IN(
    SELECT city_id
    FROM city
    WHERE country_id IN (
        SELECT country_id
        FROM country
        WHERE country = "Nepal"
    )
);

-- we have no customer that live in napal and neple is not even city 


SELECT COUNT(amount), first_name, last_name
FROM staff
INNER JOIN payment
ON payment. staff_id = staff.staff_id 
GROUP BY  first_name, last_name
ORDER BY COUNT(amount) DESC;

-- JON STEPHENS HAD THE MOST SALES WITH 7304

SELECT COUNT(title), rating
FROM film
GROUP BY rating
ORDER BY COUNT(title) DESC;

---PG-13 has 223 movies, NC-17 has 209 movies, R has 196 movies, PG has 194 movies, G has 178 movies

SELECT first_name, last_name 
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id, amount
    HAVING COUNT(amount) = 1 AND amount > 6.99
);

-- There are 529 people who have made a single payment of $6.99


SELECT customer_id
FROM rental
WHERE customer_id IN(
    SELECT amount
    FROM payment
    WHERE amount = 0
);

--- we did not give away a free store rentals away 

