drop table if exists zepto;

create table zepto(
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outOfstock BOOLEAN,
quantity INTEGER
);

-- DATA EXPLORATION 

-- COUNT OF ROWS
select count(*) from zepto;

-- SAMPLE DATA 
select * from zepto
limit 10;

-- NULL VALUES
select * from zepto
where name is null
or
category is null
or 
mrp is null
or 
discountPercent is null
or 
discountedSellingPrice is null
or 
availableQuantity is null
or 
weightInGms is null
or 
outOfstock is null
or 
quantity is null;

-- DIFFERENT PRODUCT CATEGORIES
select distinct category
from zepto
order by category;

-- PRODUCTS INSTOCK VS OUTOFSTOCK
select outOfstock,count(sku_id)
from zepto
group by outOfstock;

-- PRODUCTS NAME PRESENT MULTIPLE TIMES
select name,count(sku_id) as "NUMBER OF SKUs"
from zepto
group by name
having count(sku_id)>1
order by count(sku_id) desc;

-- DATA CLEANING

-- PRODUCT WITH = 0 
select * from zepto
where mrp=0 or discountedSellingPrice=0;

delete from zepto where mrp=0;

-- CONVERT PAISE INTO RUPEES
update zepto
set mrp=mrp /100.0,
discountedSellingPrice = discountedSellingPrice /100.0;

select mrp,discountedSellingPrice from zepto;

-- DATA ANALYSIS

-- Q1.Find the top 10 best-value products based on the discount percentage.

select distinct name,mrp,discountpercent
from zepto
order by discountpercent desc
limit 10;

-- Q2.What are the Products with High MRP but Out of Stock

select distinct category,mrp
from zepto
where outOfstock = TRUE and mrp>300
order by mrp desc;

-- Q3.Calculate Estimated Revenue for each category

select category,
sum(discountedSellingPrice * availableQuantity) as "total_revenue"
from zepto
group by category
order by total_revenue;

-- Q4.Find all products where MRP is greater than ₹500 and discount is less than 10%.

select distinct name,mrp,discountPercent 
from zepto
where mrp>500 and discountPercent<10
order by mrp desc, discountPercent desc;


-- Q5.Identify the top 5 cetegories offering the highest average discount percentage; 

select category,
round(avg(discountPercent),2) as "avg_discount"
from zepto
group by category
order by avg_discount desc
limit 5;

-- Q6.Find the price per gram for products above 100g and sort by best value.

select distinct name, weightInGms, discountedSellingPrice,
ROUND(discountedSellingPrice/weightInGms,2) as price_per_grm
FROM ZEPTO
where weightInGms>=100
order by price_per_grm;

-- Q7.Group the products into categories like Low, Medium, Bulk.

select name,weightInGms,
case when weightIngms<1000 then 'low'
	 when weightInGms<5000 then 'medium'
	 else 'bulk'
	 end as weight_category
from zepto;

-- Q8.What is the Total Inventory Weight Per Category.

select category,
sum(weightInGms * availableQuantity) as total_weight
from zepto
group by category
order by total_weight;