
-------------***** Retrieve all columns from the table for the first 10 rows.****-------

SELECT  TOP 10 * FROM [Alibaba Data]

------------********  Display the products where the shipping city is 'Bangalore'***---

SELECT DISTINCT(Item_NM) FROM [Alibaba Data]
WHERE Shipping_city = 'Bangalore'


--------***** the top 5 products with the highest item price ***-----

SELECT TOP 5 WITH TIES Item_NM , Item_Price FROM (
SELECT DISTINCT (Item_NM) , Item_Price FROM [Alibaba Data]
)
AS Uniqe_Items
ORDER BY Item_Price DESC

------------********** Calculate the average quantity sold *********---------

SELECT AVG(quantity) as AVG_QUANTUTY FROM [Alibaba Data]

----***** Group the data by category and display the total quantity sold for each category**-- 

SELECT Category , SUM(Quantity) AS Total_Quantity FROM [Alibaba Data]
group by Category
order by SUM(Quantity)





---***** Create a new table for payment methods and join it with the main table to display product names and their 
                                        -----**** payment methods *********-----


select DISTINCT(Payment_Method) FROM [Alibaba Data]

CREATE TABLE Payment_Method(PM_ID  INT , payment_method  VARCHAR(50) primary key )

INSERT INTO Payment_Method (PM_ID , payment_method)
values ( 1, 'Prepied') ,  (2, 'COD')

UPDATE Payment_Method 
SET payment_method = 'Prepaid'
WHERE payment_method = 'Prepied'

SELECT * FROM Payment_Method
SELECT * FROM [Alibaba Data]

SELECT Name , p.payment_method FROM [Alibaba Data] a
join Payment_Method p ON P.payment_method = a . Payment_Method

----------******** Find products where the cost price is greater than the average cost price ****--------


SELECT DISTINCT(Item_NM) , cost_price  FROM [Alibaba Data]
WHERE cost_price >( SELECT AVG(cost_price) FROM [Alibaba Data])
ORDER BY Cost_Price 

--------**** Calculate the total special price for products in the 'WATCHES‘ category *****-----


SELECT SUM(special_price) AS total_special_price FROM [Alibaba Data]
WHERE Category = 'WATCHES'

--------****Increase the cost price by 10% for products in the Women Clothing  category (Women Apparel) *****-----

GO
CREATE VIEW Women10 AS (
SELECT DISTINCT(Item_NM) , SUM(Cost_Price + Cost_Price*10/100) ASCOST_PRICE_10 FROM [Alibaba Data]
WHERE Category = 'Women Apparel'
GROUP BY Item_NM)
GO

SELECT * FROM  Women10

----***** Remove all products where the sale flag is ‘Not on Sale’*****-----

SELECT * FROM [Alibaba Data]

SELECT DISTINCT(Sale_Flag) FROM [Alibaba Data]

DELETE FROM [Alibaba Data]
WHERE Sale_Flag = 'Not on Sale'

----***** Create a new column 'Discount_Type' that categorizes products based on their item price: 'High' if above $8000, 
------*******'Medium' if between $5000 and $8000, 'Low' if below $5000*****-----

ALTER TABLE [Alibaba Data] ADD Discount_Type VARCHAR(100)

SELECT * FROM [Alibaba Data]

UPDATE [Alibaba Data] SET Discount_Type =
CASE 
WHEN Item_Price > 8000 then ' High'
WHEN Item_Price BETWEEN 5000 AND 8000 then ' Medium'
ELSE 'Low'
END;

----***** Rank the products based on their special prices within each category *****-----


SELECT Item_NM , Category , Special_price ,DENSE_RANK () OVER(partition by Category ORDER BY Special_price DESC )
AS Category_RANK 
FROM [Alibaba Data]


----*****  Calculate the running total of the quantity sold for each product ***----


SELECT 
   DISTINCT Item_NM,
    Quantity,
    SUM(Quantity) OVER (
        PARTITION BY Item_NM 
        ORDER BY S_no
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS Running_Total
FROM [Alibaba Data];




---****** Identify Cities with Above-Average Special Price per Category  *****-----

SELECT AVG(Special_price) as AVG_Special_Price FROM [Alibaba Data]

SELECT Shipping_city, Category, AVG(Special_price) AS Avg_SpecialPrice
FROM [Alibaba Data]
GROUP BY Shipping_city, Category
HAVING AVG(Special_price) >
       (SELECT AVG(Special_price)
        FROM [Alibaba Data] AS T2
        WHERE T2.Category = [Alibaba Data].Category) ORDER BY Avg_SpecialPrice
        





