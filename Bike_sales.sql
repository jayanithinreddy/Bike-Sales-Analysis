create database bike_sales ;

use bike_sales ;

select * from bike_sales ;

-- Q1 Find the total number of customers.

select count(Customer_id) as Total_customers
from bike_sales ;

-- Q2 Find the total number of customers who purchased and did not purchase bikes.

select `Purchased Bike` , count(Customer_id)  as Total_Purchased_Customers
from bike_sales
group by `Purchased Bike` ;

-- Q3 Find the number of customers in each region. 

select  Region , count(Customer_id) as Total_Customers
from bike_sales
group by Region 
order by Total_Customers  desc ;

-- Q4 Find the average income of customers.

select   round(avg(income),2)  as Average_income
from bike_sales ;

-- Q5 Find the number of bike purchases based on gender.

select Gender , count(`Purchased Bike`) as Gender_Based_Bike_Purcase
from bike_sales
where `Purchased Bike` = 'Yes'
group by Gender ;

-- Q6 Find the bike purchase count based on occupation.

select Occupation , count(*) as Total_Bike_Purcase
from bike_sales
where `Purchased Bike` = 'Yes'
group by Occupation 
order by Total_Bike_Purcase desc ;

-- Q7 Find the average income of customers who purchased and did not purchase bikes.

select `Purchased Bike` , round(avg(income),2) as Average_income
from bike_sales
group by `Purchased Bike` ;

-- Q8 Find which commute distance category has the highest bike purchases. 

select `Commute Distance` , count(*) as Highest_Category
from bike_sales
where `Purchased Bike` = 'Yes'
group by `Commute Distance` 
order by Highest_Category  desc ;

-- Q9 Find the bike purchase percentage for each region.

 select region , count(*) as Total_Customers,
 sum(case when `Purchased Bike` = 'Yes' then 1 else 0 end ) as Bike_Purcases,
 round(sum((case when `Purchased Bike` = 'Yes' then 1 else 0 end )*100.0 ) / 2 ,2) as Purchased_Percentage
 from bike_sales
 group by region ;
 
 -- Q10 Find the bike purchases based on marital status.
 
 select `Marital Status` , count(*) as Total_Customers ,
 sum(case when `Purchased Bike` = 'Yes' then 1 else 0 end ) as Purchased_Bike
 from bike_sales
 group by `Marital Status` ;
 
-- Q11 Find the bike purchase behaviour based on age groups

select CASE
        WHEN Age BETWEEN 25 AND 35 THEN '25-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
        ELSE 'Above 55'
    END AS Age ,
count(*) as Total_Customers,
sum(case when `Purchased Bike` = 'Yes' then 1 else 0 end ) as Purchased_Customers
from bike_sales
group by age 
order by Purchased_Customers desc ;

-- Q12 Find the top 5 customer occupations with the highest average income.

select Occupation , round(avg(Income),2) as Average_income
from bike_sales
group by Occupation
order by Average_income 
limit 5 ;


    
 







