create database core_bank;
USE core_bank;
select database();

drop table if exists customer, account;

select * from account;

-- Создание таблицы 1 с сheak -- 
 
create table customer (
	customer_id INT AUTO_INCREMENT PRIMARY KEY,
    username varchar(50) unique check (username != '') not null,
	password_hash varchar(255) not null,
    mail varchar(100) unique, 
    full_name varchar(50) not null,
    birth_date DATE,
    is_active boolean default true
);

-- Применение ограничений -- 

alter table customer
add column phone varchar(20) unique;

alter table customer 
add constraint mail check (mail is NULL OR mail LIKE '%@%');

alter table customer 
add constraint phone CHECK (phone is null or phone != '');



-- Создание таблицы 2 с foreing_key -- 

create table account (
	account_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT not null,
    account_number varchar(20) not null unique,
    currency ENUM('BYN', 'USD', 'EUR') not null,
    account_type ENUM('CURRENT', 'SAVING', 'CREDIT') not null,
    foreign key (customer_id) references customer(customer_id)
);

-- Заполнение таблицы 1 --


INSERT INTO customer (username, password_hash, mail, full_name, birth_date, phone) VALUES
	('DenisDetrov', 'dasfewfnweio', 'killa@mail.ru', 'Жмышенко Валерий Альбертович', '2002-05-01', '+1234567890'),
	('NataliMorskayPehot', 'dfdgdgerwe22323', 'jiwsll2sq2@mail.ru', 'Наталья Морская Пехота', '2001-02-03', '+1234567232'),
    ('PavelDurov67', 'dasfewfnw2311eio', 'durov@mail.ru', 'Павел Дуров', '2001-11-01', '+1234567891'),
    ('Luxury Gril', 'HWNSKU2323ssdw2', 'jujulsil21123@mail.ru', 'Полина Игоревна Марченка', '1990-11-01', +1234563891),
    ('Jacque Fresco', 'dasfe23231eio', 'Jacque@mail.ru', 'Жак Фреско', '1916-01-29', '+1334567891'),
    ('Brad Piti', 'HWNNMLQAZXSWQ!@', 'Pitty2@mail.ru', 'Уильям Брэдли Питт', '1987-07-15', '+1265567891'),
    ('Fox228', 'QAZXSW!23', 'FireFox@mail.ru', 'Меган Дениз Фокс', '1986-11-01', '+1239967891'),
    ('Sweetie fox', 'QWERTY1234!', 'sweetie@mail.ru', 'Дарья', '2001-06-25', '+5234567891'),
    ('bezos', 'amazonthebest1337', 'bezos@mail.ru', 'Джеффри Престон Безос', '2001-11-01', '+7634567891'),
    ('Jeffrey88Edward', 'LittleSaintJames', 'Edward@mail.ru', 'Джеффри Эдвард Эпштейн', '1953-11-01', '+6734567891'),
    ('GOATCR7', 'QAZXCVBWSJ2321s', 'CR7@gmail.com', 'Криштиану Роналду душ Сантуш Авейру', '1985-03-02', '+7777777777');
    
    
    -- Заполнение таблицы 2 --
    
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
    
-- Обновляем/добовляем--
     
update customer set phone = '+7999999999' where customer_id = 1;
update account SET account_type = 'CREDIT' where account_id = 1;

-- Проверка --

SELECT * FROM customer;
SELECT * FROM account;

-- Удоляем --

drop table if exists account, customer;
drop database if exists core_bank;


