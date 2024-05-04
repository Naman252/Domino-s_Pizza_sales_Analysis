select * from pizza_sales;

# ------ KPI'S ------------
 #1 Calculate the total revenue of pizza orders?
 
 select sum(total_price) as total_revenue
 from pizza_sales;
 
#2  Calculate Average order value ?

select sum(total_price) / count(distinct order_id) as Avg_order_value
from pizza_sales;

#3  Calculate total pizza sold?

select sum(quantity) as total_pizza_sold
from pizza_sales;

#4  Calculate total orders?

select count(distinct order_id) as total_orders
from pizza_sales;

#5  Calculate Average pizza per order?

select cast(cast(sum(quantity) as decimal(10,2)) / cast(count(distinct order_id)as decimal(10,2)) as decimal (10,2))
as Avg_pizza_per_order
from pizza_sales;

#6  Find out the daily trends of  Total orders?

select extract(day from order_date ) as month_name, count(distinct order_id) as total_orders
from pizza_sales
group by month_name;

#7 Monthly Trends for total orders?

select date_format(order_date) as order_day, count(distinct order_id) as total_orders
from pizza_sales
group by order_day;

#8 Find out % of sales by pizza category?

select pizza_category, cast(sum(total_price) as decimal(10,2)) as total_revenue,
cast(sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as decimal(10,2)) as PCT
from pizza_sales
group by pizza_category;

#9 Find out % of sale by pizza size?

select pizza_size, cast(sum(total_price)as decimal(10,1)) as total_revenue,
cast(sum(total_price)* 100 / (select sum(total_price) from pizza_sales) as decimal(10,1)) as PCT
from pizza_sales
group by pizza_size;

#10  Find out total pizza sold by pizza category?
 
 select pizza_category, sum(quantity) as total_pizza_sold
 from pizza_sales
 group by pizza_category
 order by total_pizza_sold desc;
 
 #11 Top 5 best seller by revenue?
 
select pizza_name, sum(total_price) as total_revenue
from pizza_sales
group by pizza_name
order by total_revenue desc 
limit 5;

#12 Bottom 5 pizza by revenue?
 
 select pizza_name, sum(total_price) as total_revenue
 from pizza_sales
 group by pizza_name
 order by total_revenue asc
 limit 5 ;
 
 #13 Top 5 pizza by quantity ?
  
  select pizza_name, sum(quantity) as total_pizza_sold
  from pizza_sales
  group by pizza_name
  order by total_pizza_sold desc
  limit 5;
  
  #14 Bottom 5 pizza by quantity?
  
  select pizza_name, sum(quantity) as total_pizza_sold
  from pizza_sales
  group by pizza_name
  order by total_pizza_sold asc
  limit 5;
  
  #15 Top 5 best seller by total orders?
  
  select pizza_name, count(distinct order_id) as total_orders
  from pizza_sales
  group by pizza_name
  order by total_orders desc
  limit 5;
  
  #16 Bottom 5 best seller by total_orders?
  
  select pizza_name, count(distinct order_id) as total_orders
  from pizza_sales
  group by pizza_name
  order by total_orders asc
  limit 5;
