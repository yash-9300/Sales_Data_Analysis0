create database project03;

use project03;
show tables;

select * from cleaned_data01;


select * from sales_data;
select distinct (country) from cleaned_data01;

select distinct (status) from cleaned_data01;

select distinct (dealsize) from cleaned_data01;

select distinct (territory) from cleaned_data01;

select distinct (city) from cleaned_data01;


# what is the Sales by Productline?
select productline,sum(sales) from cleaned_data01 group by productline  
order by sum(sales) desc;

# What is the Sales by Year?
select year_id,sum(sales) from cleaned_data01 group by 
year_id order by sum(sales) desc;


# What is the Sales by Dealsize?
select dealsize,sum(sales) from cleaned_data01
 group by dealsize order by sum(sales) desc ;

# 	Which is the Best Month For Sale Per Year?
select month_id ,year_id,sum(sales) 
from cleaned_data01 where year_id = 2003 group by
month_id,year_id order by sum(sales) desc limit 1  ;

#4.2
select month_id ,year_id,sum(sales) 
from cleaned_data01 where year_id = 2004 group by
month_id,year_id order by sum(sales) desc limit 1  ;

#4.3
select month_id ,year_id,sum(sales)
 from cleaned_data01 where year_id = 2005 group by
month_id,year_id order by sum(sales) desc limit 1  ;

# Who are the Top 3 Customers On The Basis of Sales as per productline?
  with
 cte as 
 (select productline,customername,sum(sales) "total_orders" 
 from cleaned_data01  group by productline,customername)
 
 select * from(select *,row_number() 
 over ( partition by productline order by total_orders desc) " top_3_customers"
 from cte) A where top_3_customers <=3;
 
 
  # Top 3 Customers on the Basis of Total Number of Orders as Per Productline?
with
 cte as 
 (select productline,customername,count(ORDERNUMBER) "frequency" 
 from cleaned_data01 group by productline,customername)
 
 select * from(select *,row_number() over 
 ( partition by productline order by frequency desc) " top_3_customers"
 from cte) A where top_3_customers <=3;
 





