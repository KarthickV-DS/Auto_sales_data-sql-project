use project1;
select * from auto_sales_data ;
#found the details who ordered long ago
select * from auto_sales_data 
order by DAYS_SINCE_LASTORDER desc;
#Q2
#found the details based on the quantity ordered
select * from auto_sales_data
order by QUANTITYORDERED desc ;
#Q3
#In this the dataset is within the year of 2018 and 2020
SELECT distinct(DATE_FORMAT(STR_TO_DATE(ORDERDATE, '%d/%m/%Y'), '%Y')) AS uniqueyears
FROM auto_sales_data;
select ORDERDATE from auto_sales_data;
#Q4
#With this query i found orderline 1 produces maximum output
select count(ORDERLINENUMBER),ORDERLINENUMBER from auto_sales_data
group by ORDERLINENUMBER  ;
#Q5
#From this query found that it is producing 7 automobiles 
#select * from auto_sales_data where ORDERLINENUMBER = 1 ;
#From this we found that the no:1 lot produces Majority of classiccars
SELECT 
    PRODUCTLINE, COUNT(PRODUCTLINE)
FROM
    auto_sales_data
WHERE
    ORDERLINENUMBER = 1
GROUP BY PRODUCTLINE; 
#Q6
#classic cars is the most produced product from the orderline 1
SELECT 
    PRODUCTLINE, COUNT(PRODUCTLINE)
FROM
    auto_sales_data
WHERE
    ORDERLINENUMBER = 1
GROUP BY PRODUCTLINE
ORDER BY COUNT(PRODUCTLINE) DESC
LIMIT 1; 
#Q7 
#trains are the least produced product in this line
SELECT 
    PRODUCTLINE, COUNT(PRODUCTLINE)
FROM
    auto_sales_data
WHERE
    ORDERLINENUMBER = 1
GROUP BY PRODUCTLINE
ORDER BY COUNT(PRODUCTLINE) ASC
LIMIT 1; 
#Q8
#count of each dealsize in the data 
select * from auto_sales_data ;
SELECT 
    DEALSIZE, COUNT(DEALSIZE)
FROM
    auto_sales_data
GROUP BY DEALSIZE;
#Q9
#In this i have segregated product line and separate dealsize
#Classic cars and medium are the highest
#Trains and large dealsize are the lowest 
SELECT 
    PRODUCTLINE, DEALSIZE, COUNT(DEALSIZE)
FROM
    auto_sales_data
GROUP BY PRODUCTLINE , DEALSIZE
ORDER BY COUNT(DEALSIZE) DESC;
#Q10
#Euro shopping channel has made the most no of purchases
SELECT 
    CUSTOMERNAME, COUNT(CUSTOMERNAME) totalpurchasemade
FROM
    auto_sales_data
GROUP BY CUSTOMERNAME
ORDER BY COUNT(CUSTOMERNAME) DESC;
#Q11
#Classic cars is most sold product in the Euro shopping channel 
SELECT 
    PRODUCTLINE, COUNT(PRODUCTLINE)
FROM
    auto_sales_data
WHERE
    CUSTOMERNAME = 'Euro Shopping Channel'
GROUP BY PRODUCTLINE
ORDER BY COUNT(PRODUCTLINE) DESC; 
#Q12
#Sum of the quantity ordered* price for the different deal size
#From this we found that medium size has the major sale in term of pricing
select * from auto_sales_data ;
SELECT 
    DEALSIZE, SUM(CEIL((QUANTITYORDERED * PRICEEACH))) total
FROM
    auto_sales_data
GROUP BY DEALSIZE; 

#Q13
#Madrid has the most count in city
select CITY , count(CITY) from auto_sales_data
group by CITY 
order by count(CITY) desc; 
#Q14
#same here classic cars are the most sold product in madrid
select PRODUCTLINE,count(PRODUCTLINE) from auto_sales_data where CITY = "MADRID"
group by PRODUCTLINE
order by count(PRODUCTLINE) desc; 