-- Week 5 - Monday Questions

-- 1. How many actors are there with the last name ‘Wahlberg’?
select count(actor_id) as actor_count
from actor
where last_name = 'Wahlberg';

-- 2. How many payments were made between $3.99 and $5.99?
select count(payment_id) as payment_count
from payment
where amount between 3.99 and 5.99;


-- 3. What film does the store have the most of? (search in inventory)
select f.film_id, f.title, count(i.film_id) as inventory_count
from film f 
	inner join inventory i 
	on f.film_id = i.film_id
group by f.film_id, f.title
order by count(i.film_id) desc;

-- 4. How many customers have the last name ‘William’?
select last_name, count(customer_id) as customer_count
from customer
group by last_name
having last_name = 'William';

-- 5. What store employee (get the id) sold the most rentals?
select p.staff_id, concat(s.first_name, ' ', s.last_name) as staff_name, sum(p.amount) as total_sale
from payment p
	inner join staff s 
	on p.staff_id = s.staff_id
group by p.staff_id, concat(s.first_name, ' ', s.last_name)
order by sum(p.amount) desc;

-- 6. How many different district names are there?
select count(distinct district) as district_count
from address;

-- 7. What film has the most actors in it? (use film_actor table and get film_id)
select film_id, count(distinct actor_id) as actor_count
from film_actor
group by film_id
order by count(distinct actor_id) desc;

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
select count(customer_id) as customer_count
from customer
where store_id = 1 and last_name like '%es';


-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
select amount, count(rental_id) as rental_count
from payment
where customer_id between 380 and 430
group by amount
having count(rental_id) > 250;

-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?
select rating, count(film_id) as film_count
from film f 
group by rating
order by count(film_id) desc;