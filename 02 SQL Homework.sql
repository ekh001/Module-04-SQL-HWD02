--1. 
select first_name, last_name, district
from customer
inner join address
on customer.address_id = address.address_id
where district like 'Texas';
--A: Jennifer Davis, Kim Cruz, Richard Mccrary, Bryan Hardison, Ian Still

--2. 
select first_name, last_name, amount
from customer
inner join payment
on customer.customer_id = payment.customer_id
where amount > 6.99
order by amount asc;
--A: 

--3. 
select first_name, last_name, amount
from customer
inner join payment
on customer.customer_id = payment.customer_id
where amount > 175.00
order by amount desc;
--A: 

--4. 
select customer.first_name, customer.last_name, customer.email, country
from customer
full join address
on customer.address_id = address.address_id 
full join city 
on address.city_id = city.city_id 
full join country
on city.country_id = country.country_id
where country = 'Nepal';
--A: Kevin Schuler

--5. 
select count(staff_id) as transactions, staff_id from payment
group by staff_id 
order by staff_id desc
--A: Jon with 7,304 transactions

--6. 
select rating, count(film)
from film
group by rating
order by count(film) desc;
--A: PG-13 with 223 movies

--7. 
select first_name, last_name
from customer
where customer_id in (
	select count(amount)
	from payment
	group by customer_id 
	having count(amount) > 6.99
	order by count(amount) desc
)
group by first_name, last_name ;


--8. How many free rentals did our store give away?
select payment_id, amount
from payment
inner join rental
on rental.rental_id = payment.rental_id
where amount > 5.00
order by amount desc;
--A: 0, nothing in life is free. It costs at least 2 dollars.

select first_name, last_name
from customer 
	where customer_id in (
	select customer_id 
	from payment
	where amount > 6.99
	);

