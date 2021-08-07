create schema Project_Marom_and_Gal;
use Project_Marom_and_Gal;

create table branch
(ID		INT NOT NULL,
street VARCHAR(20),
building_num INT,
city VARCHAR(20),
avg_month_in INT check(avg_month_in >=0),
avg_month_out INT check(avg_month_out >=0), 
primary key(ID));

create table costumer
(ID		INT NOT NULL,
first_name VARCHAR(20) NOT NULL,
last_name VARCHAR(20) NOT NULL,
phone_num INT,
branch_id INT not null,
primary key(ID),
FOREIGN KEY(branch_id) REFERENCES branch(ID),
unique(first_name, last_name));

create table employee
(ID		INT NOT NULL,
name VARCHAR(20),
phone_num INT,
salary INT,
start_date date,
main_job ENUM ('manager', 'deliver', 'shift manager', 'cleaner', 'cashier'),
branch_id INT not null, 
primary key(ID),
FOREIGN KEY(branch_id) REFERENCES branch(ID));

create table club_member
(ID		INT NOT NULL,
join_date date,
cost_id int not null, 
primary key(ID),
FOREIGN KEY(cost_id) REFERENCES costumer(ID));

create table supplier
(name	VARCHAR(20) NOT NULL,
supply_day ENUM ('sunday','monday', 'tuesday', 'wednesday', 'thursday'),  
primary key(name));

create table product
(ID		INT NOT NULL,
name	VARCHAR(20),
price INT,
supp_name varchar(20), 
primary key(ID),
FOREIGN KEY(supp_name) REFERENCES supplier(name));

create table bouquet
(ID		INT NOT NULL,
flow_type	VARCHAR(20), 
primary key(ID),
FOREIGN KEY(ID) REFERENCES product(ID));

create table add_prod
(ID		INT NOT NULL,
description	VARCHAR(40), 
primary key(ID),
FOREIGN KEY(ID) REFERENCES product(ID));

create table pro_stock
(branch_ID		INT NOT NULL,
pro_ID		INT NOT NULL,
stock int, 
primary key(branch_ID, pro_ID),
FOREIGN KEY(branch_ID) REFERENCES branch(ID),
FOREIGN KEY(pro_ID) REFERENCES product(ID));

create table flo_colors
(bouq_ID INT not null,
color varchar(20),
primary key(bouq_ID,color),
FOREIGN KEY(bouq_ID) REFERENCES bouquet(ID));

insert into branch 
(ID, street, building_num, city, avg_month_in, avg_month_out)
values 
(1, 'bilu', 4, 'ness ziona', 40000, 20000),
(2, 'bialik', 105, 'ramat gan', 35000, 17000),
(3, 'dizengoff', 225, 'tel aviv', 70000, 30000),
(4, 'barak', 30, 'eilat', 20000, 30000),
(5, 'rabbin', 78, 'petah tikva', 30000, 38000);

insert into employee
(ID, name, phone_num, salary, start_date, main_job, branch_id)
values
(10, 'yakov nachmani', 0526789012, 15000, '2004-03-12', 'manager',1),
(11, 'shmuel cohen', 0541234098, 9000, '2004-04-18', 'shift manager', 1),
(20, 'ronit shimon', null, 11000, '2010-10-15', 'manager', 2),
(21, 'shlomi levi', 052345981, 7000, '2011-11-01', 'cashier', 2),
(30, 'sara yitzhak', 0522345879, 12000, '2009-08-01', 'manager',3),
(31, 'yogav levi', 0542233567, 6000, '2005-02-11', 'deliver', 3),
(32, 'dorin omer', 0545516931, 8000, '2010-01-01', 'shift manager', 3),
(40, 'motti levi', 0542567812, 10500, '2012-04-10', 'manager', 4),
(41, 'avraham sharabi', 0506784356, 6000, '2012-09-16', 'cleaner', 4),
(50, 'shira yakovi', null, 11500, '2019-11-20', 'manager', 5),
(51, 'sara anat', 0549576789, 8000, '2020-06-25', 'shift manager', 5);

insert into costumer
(ID, first_name, last_name, phone_num, branch_id)
values
(100, 'shlomi', 'shabat', 0524545454, 1),
(101, 'hazi' , 'askenazi', 0506767676, 1),
(200, 'sharon', 'levi', 0549898989,2),
(201, 'gal', 'binyamin', '0542344321', 2),
(300, 'ran', 'tovia', '0544456743', 3),
(301, 'tomer', 'cohen', '0526677986',3),
(400, 'dor', 'hamma', '0529876544', 4),
(401, 'shoshana', 'levi', '0502341567', 4),
(500, 'yariv', 'shoshani', '0509876543', 5),
(501, 'david', 'cohen', null , 5);

insert into club_member
(ID, join_date, cost_id)
values
(1111, '2004-04-18', 100),
(1112, '2005-06-21', 201),
(1114, '2013-01-30', 400),
(1115, '2020-01-01', 501);

insert into supplier
(name, supply_day)
values 
('meshek 25' , 'monday'),
('gan mor', 'sunday'),
('balon poreah', 'wednesday'),
('elisha matanot', 'thursday');

insert into product 
(ID, name, price, supp_name)
values 
(10000, 'chocholate bar', 15, 'balon poreah'),
(11111, 'bottle of white vine', 70, 'elisha matanot'),
(12345, 'bottle of red vine', 65, 'elisha matanot'),
(19225, 'birthday bouquet', 70, 'meshek 25'),
(19876, 'valentines bouquet', 80, 'meshek 25'),
(19654, 'wedding bouquet', 65, 'gan mor');

insert into bouquet 
(ID, flow_type)
values 
(19225, 'rose'),
(19876, 'sunflower'),
(19654, 'lily');

insert into add_prod
(ID, description)
values
(10000, 'Heart-shaped milk chocolate pack'),
(11111, 'italian dry white wine'),
(12345, 'Red wine from the Golan Heights');

 insert into pro_stock
 (branch_ID, pro_ID, stock)
 values
 (1, 10000, 15), (1, 19654, 23),
 (2, 19654, 46), (2, 11111, 8),
 (3, 11111,34), (3, 19225, 27),
 (4, 19225, 50), (4, 12345, 22),
 (5, 12345, 37), (5, 10000, 56);
 
 insert into flo_colors
(bouq_ID, color)
values
(19225, 'red'),
(19225, 'yellow'),
(19225, 'purple'),
(19876, 'yellow'),
(19654, 'white'),
(19654, 'pink');

-- general manager --

select branch_id,count(*) 'number of employees' 
from employee
where branch_id = 3;

select id, name, phone_num
from employee
where main_job = 'manager';

select costumer.first_name, costumer.last_name, costumer.phone_num, branch.city
from costumer, branch
where branch.id = costumer.branch_id
and phone_num is not null
order by branch.city asc;

select  id 'branch_id', avg_month_in, avg_month_out 
from branch
where avg_month_in - avg_month_out < 0 ;

select branch.id 'branch_id'
from branch, employee
where avg_month_in>=40000
and employee.branch_id = branch.id
group by branch.id
having count(*)>2;


select product.id, product.name, flo_colors.color
from product, flo_colors
where product.id in (select bouquet.ID
from bouquet
where bouquet.id = flo_colors.bouq_ID);

select id 
from branch
where branch.id in(select employee.branch_id
						from employee
						where salary>=10000);

update employee
set phone_num = 0528876562
where employee.id = 50;

insert into branch (ID, street, building_num, city, avg_month_in, avg_month_out)
values
(6, 'ben gurion', null, 'beer sheva', null, null);
  
-- branch manager -- 

select id 'employee_id', name, salary
from employee
where start_date like '2010%'
and branch_id = 2;

select sum(salary)
from employee
group by branch_id
having branch_id = 5;

select product.id, product.name, pro_stock.stock
from product, pro_stock
where product.id = pro_stock.pro_ID
and pro_stock.branch_ID = 1;

select costumer.first_name, costumer.last_name, club_member.ID 'member_id'
from costumer, club_member, branch
where costumer.id = club_member.cost_id
and costumer.branch_id = branch.ID
and branch.id = 2;

select product.id 'product_id', supplier.name 'supplier_name'
from product,supplier
where product.supp_name=supplier.name
and supply_day = 'monday';

select e1.id 'worker_id', e1.name 'worker_name', e1.phone_num 'worker_phone_num',
 e2.id 'manager_id', e2.name 'manager_name', e2.phone_num 'manager_phone_num'
from employee e1, employee e2
where e1.main_job = 'cashier'
and e2.main_job = 'manager'
and e1.branch_id = e2.branch_id;

delete from employee
where employee.id = 31;

update pro_stock
set stock = 36
where branch_id = 4
and pro_ID = 19225;


 

