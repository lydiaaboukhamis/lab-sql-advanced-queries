#Lab | SQL Advanced queries

#In this lab, you will be using the Sakila database of movie rentals.

#Instructions

#1.List each pair of actors that have worked together.
select * from sakila.film_actor;

select sub1.first_name, sub1.last_name, sub2.first_name, sub2.last_name, sub1.film_id from (select fa1.actor_id, a1.first_name, a1.last_name, fa1.film_id from sakila.film_actor fa1
join sakila.actor a1 on fa1.actor_id = a1.actor_id ) sub1 join 
(select fa2.actor_id, fa2.film_id, a2.first_name, a2.last_name from sakila.film_actor fa2 join sakila.actor a2 on fa2.actor_id = a2.actor_id) sub2
on 
sub1.film_id = sub2.film_id
and sub1.actor_id < sub2.actor_id;


#2.For each film, list actor that has acted in more films.
select * from sakila.film_actor;
select * from sakila.film;

select sub1.first_name, sub1.last_name, sub1.title, sub2.title from (select fa1.actor_id, a1.first_name, a1.last_name, fa1.film_id, f1.title from sakila.film_actor fa1 
join 
sakila.film f1 on fa1.film_id = f1.film_id 
join 
sakila.actor a1 on fa1.actor_id = a1.actor_id) sub1
join 
(select fa2.actor_id, a2.first_name, a2.last_name, fa2.film_id, f2.title from sakila.film_actor fa2 join sakila.film f2 on fa2.film_id= f2.film_id 
join sakila.actor a2 on fa2.actor_id=a2.actor_id) sub2
on sub1.actor_id = sub2.actor_id
and sub1.film_id <>sub2.film_id
order by sub1.title;