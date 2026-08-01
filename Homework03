
-- БД 
create database core_bank;
USE core_bank;
select database();

drop table if exists customer, account;

select * from account;

 
create table customer (
	customer_id INT AUTO_INCREMENT PRIMARY KEY,
    username varchar(50) unique check (username != '') not null,
	password_hash varchar(255) not null,
    mail varchar(100) unique, 
    full_name varchar(50) not null,
    birth_date DATE,
    is_active boolean default true
);


alter table customer
add column phone varchar(20) unique;

alter table customer 
add constraint mail check (mail is null or mail like '%@%');

alter table customer 
add constraint phone CHECK (phone is null or phone != '');


create table account (
	account_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT not null,
    account_number varchar(20) not null unique,
    currency ENUM('BYN', 'USD', 'EUR') not null,
    account_type ENUM('CURRENT', 'SAVING', 'CREDIT') not null,
    foreign key (customer_id) references customer(customer_id)
);

INSERT INTO customer (username, password_hash, mail, full_name, birth_date, phone) VALUES
	('DenisDetrov', 'dasfewfnweio', 'killa@mail.ru', 'Жмышенко Валерий Альбертович', '2002-05-01', '+1234567890'),
	('NataliMorskayPehot', 'dfdgdgerwe22323', 'jiwsll2sq2@mail.ru', 'Наталья Морская Пехота', '2001-02-03', '+1234567232'),
    ('PavelDurov67', 'dasfewfnw2311eio', 'durov@mail.ru', 'Павел Дуров', '2001-11-01', '+1234567891'),
    ('Luxury Gril', 'HWNSKU2323ssdw2', 'jujulsil21123@mail.ru', 'Полина Игоревна Марченка', '1990-11-01', '+1234563891'),
    ('Jacque Fresco', 'dasfe23231eio', 'Jacque@mail.ru', 'Жак Фреско', '1916-01-29', '+1334567891'),
    ('Brad Piti', 'HWNNMLQAZXSWQ!@', 'Pitty2@mail.ru', 'Уильям Брэдли Питт', '1987-07-15', '+1265567891'),
    ('Fox228', 'QAZXSW!23', 'FireFox@mail.ru', 'Меган Дениз Фокс', '1986-11-01', '+1239967891'),
    ('Sweetie fox', 'QWERTY1234!', 'sweetie@mail.ru', 'Дарья', '2001-06-25', '+5234567891'),
    ('bezos', 'amazonthebest1337', 'bezos@mail.ru', 'Джеффри Престон Безос', '2001-11-01', '+7634567891'),
    ('Jeffrey88Edward', 'LittleSaintJames', 'Edward@mail.ru', 'Джеффри Эдвард Эпштейн', '1953-11-01', '+6734567891'),
    ('GOATCR7', 'QAZXCVBWSJ2321s', 'CR7@gmail.com', 'Криштиану Роналду душ Сантуш Авейру', '1985-03-02', '+7777777777');
    
    
INSERT INTO account (customer_id, account_number, currency, account_type) VALUES
	(1, 'BYN111111', 'BYN', 'CURRENT'),
	(1, 'USD111111', 'USD', 'SAVING'),
	(2, 'BYN222222', 'BYN', 'CURRENT'),
	(3, 'BYN333333', 'BYN', 'CURRENT'),
	(4, 'BYN444444', 'BYN', 'CURRENT'),
	(5, 'BYN555555', 'BYN', 'CURRENT'),
	(5, 'USD555555', 'USD', 'SAVING'),
	(6, 'BYN666666', 'BYN', 'CURRENT'),
	(7, 'BYN777777', 'BYN', 'CURRENT'),
	(10, 'USD888888', 'USD', 'CURRENT'),
    (11, 'USD777777', 'EUR', 'SAVING');
    
     
update customer set phone = '+7999999999' where customer_id = 1;
update account SET account_type = 'CREDIT' where account_id = 1;


-- НАЧАЛО ДЗ 3 

-- выборка данных и даблицы 
SELECT *
from account;

-- выборка данных где счет только BYN
select * 
from account
where currency = 'BYN';

-- выборка данных где есть и USD и EUR

select *
from account 
where currency IN ('USD', 'EUR');

-- или так

select *
from account 
where currency = 'USD' or currency = 'EUR';

-- или 

select *
from account 
where currency NOT IN ('BYN');

-- выборка где валюта USD а тип счета SAVING

select *
from account 
where currency = 'USD' and account_type = 'SAVING';

-- использование LIKE тут выбираем пользователей где пароль начинается на d
 select *
 from customer
 where password_hash LIKE 'd%';
 
 -- тоже самое но заканчивается на 3 
 select *
 from customer
 where password_hash LIKE 'd%3';
 
 -- выбор пользователя где в пароле есть 223
 select *
 from customer
 where password_hash LIKE '%223%';


-- LIKE + AND/OR
select *
from customer
where password_hash LIKE '%gd%3' and phone LIKE '+123%';


-- поиск по дате
select *
from customer
where birth_date like '2002-%-%';

-- Все пользовати за 1990-01-01 and 2002-01-01 года рождения.
select *
from customer
where birth_date between '1990-01-01' and '2002-01-01';


-- общее количесвто клиентов
select count(*)
from customer;

-- количесвто клиентов у которых дата рождения  1990-01-01' and '2002-01-01
select count(*)
from customer
where birth_date between '1990-01-01' and '2002-01-01';


-- количесвто клиентов с статусом тру
select count(*)
from customer
where is_active ='1';


select min(birth_date) as Самый_старый_клиент
from customer;

select max(birth_date) as Самый_молодой_клиент
from customer;

-- количество счетов по типу валюты

select currency, count(*)
from account
group by currency;

-- вывести валюты у которых счетов больше 2 
SELECT currency, COUNT(*)
FROM account
GROUP BY currency
HAVING COUNT(*) > 2;

-- количество счетов для каждого счете + сортировка по возрастаню
select account_type, count(*)
from account 
group by account_type
order by count(*) desc;

select *
from account;


-- вывсети количесвто счетов для кажого клиента и отсортировать по возрастанию
select customer_id, count(account_type)
from account
group by customer_id
order by count(account_type) desc;

-- кол-во клиент у которого больше одного счета
select customer_id, count(account_type)
from account
group by customer_id
having  count(account_type) > 1;


select account_type, max(account_id), min(account_id)
from account
group by account_type;

-- Конец 

