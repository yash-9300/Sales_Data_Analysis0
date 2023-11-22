create database project1;

use project1;

select * from sales_data;
select distinct (country) from sales_data;

select distinct (status) from sales_data;

select distinct (dealsize) from sales_data;

select distinct (territory) from sales_data;

select distinct (city) from sales_data;

#1
select productline,sum(sales) from sales_data group by productline  order by sum(sales) desc;

#2
select year_id,sum(sales) from sales_data group by year_id order by sum(sales) desc;

#3
select dealsize,sum(sales) from sales_data group by dealsize order by sum(sales) desc ;

#4.1
select month_id ,year_id,sum(sales) from sales_data where year_id = 2003 group by
month_id,year_id order by sum(sales) desc limit 1  ;

#4.2
select month_id ,year_id,sum(sales) from sales_data where year_id = 2004 group by
month_id,year_id order by sum(sales) desc limit 1  ;

#4.3
select month_id ,year_id,sum(sales) from sales_data where year_id = 2005 group by
month_id,year_id order by sum(sales) desc limit 1  ;

#5
  with
 cte as 
 (select productline,customername,sum(sales) "total_orders" 
 from sales_data group by productline,customername)
 
 select * from(select *,row_number() over ( partition by productline order by total_orders desc) " top_3_customers"
 from cte) A where top_3_customers <=3;
 
 #6
with
 cte as 
 (select productline,customername,count(ORDERNUMBER) "frequency" 
 from sales_data group by productline,customername)
 
 select * from(select *,row_number() over 
 ( partition by productline order by frequency desc) " top_3_customers"
 from cte) A where top_3_customers <=3;
 
 