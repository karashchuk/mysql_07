-- Домашнее задание к уроку 7

-- 1.	Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
-- Вариант 1:
select 
	user_id,
	(select name from users where users.id = orders.user_id)
from orders
group by user_id;

-- Вариант 2:
select
	id,
	name
from users 
where id = any (select user_id from orders);


-- 2.	Выведите список товаров products и разделов catalogs, который соответствует товару.

select
	c.name as `catalog`,
	p.name as `name`,
	description,
	price
from products as p
left join catalogs as c
on c.id = p.catalog_id;


-- 3.	(по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). Поля from, to и label содержат английские названия городов, поле name — русское. Выведите список рейсов flights с русскими названиями городов.

-- Вариант 1:
select 
	id,
	(select name from cities where label = flights.`from`) as `from`,
	(select name from cities where label = flights.`to`) as `to`	
from flights;

-- Вариант 2:
select 
	id,
	f.name,
	t.name
from flights
left join cities as f
on f.label = flights.`from`
left join cities as t
on t.label = flights.`to`;
