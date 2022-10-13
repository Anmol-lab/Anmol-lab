select * from employee

alter table employee
add primary key(emp_id);

Copy employee from 
'C:\Users\DELL\Downloads\Sql_2 - Employee.csv' CSV header;



create table booking(booking_id varchar,	
					 booking_date	date,
					 destination	varchar,
					 trans varchar,	
					 amount	int,
					 emp_id  varchar,
					 primary key (booking_id),
					 foreign key (emp_id) REFERENCES employee(emp_id)
);
Copy booking from 
'C:\Users\DELL\Downloads\Sql_2 - Booking.csv' CSV header;

select * from booking;
---Q1. A single SQL query for First booking date, Last booking date,Total booking amount
---and Avg Sales Amount of each employee against their names

select max(b.booking_date),min(b.booking_date), sum(b.amount), avg(b.amount), e.emp_name
from booking b 
left join employee e on e.emp_id = b.emp_id
group by e.emp_name
order by e.emp_name;

---Q2. Compare the Sales Amount of North branch vs South branch	
select e.emp_branch, sum(b.amount) from 
booking b right join employee e on e.emp_id = b.emp_id
group by e.emp_branch

select e.emp_branch, sum(b.amount) from 
booking b , employee e where e.emp_id = b.emp_id
group by e.emp_branch

---Q3 List of all Destinations with their Total Sales Amount 
---in order of Highest to Lowest


select b.destination, sum(b.amount) from booking b
group by b.destination
order by sum(b.amount)  desc;

---Q4. Display the person with Highest Sales in Flights	

select e.emp_id,sum(b.amount), e.emp_name from booking b 
left join employee e on e.emp_id = b.emp_id
group by e.emp_id
order by sum(b.amount) desc limit 1;

