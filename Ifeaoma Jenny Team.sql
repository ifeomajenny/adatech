-- 1. Top 10 Customers and how much they spent
select CompanyName, OrderDate, UnitPrice, Quantity, (UnitPrice * Quantity) as Cost_Of_Goods_Sold
from Customers
join Orders on Customers.CustomerID = Orders.CustomerID
join OrderDetails on Orders.OrderID = OrderDetails.OrderID
Order by Cost_Of_Goods_Sold DESC
limit 10;

-- 2. Top Customers favorite product 
select CompanyName, Quantity, ProductName, QuantityPerUnit
from Customers
join Orders on Customers.CustomerID = Orders.CustomerID
join OrderDetails on Orders.OrderID = OrderDetails.OrderID
join Products on OrderDetails.ProductID = Products.ProductID
Order by QuantityPerUnit DESC
limit 10;

-- 3a. Country where our Customers are located 
select Country, count(Country)
from Customers
group by Country
order by 'value_occurrence' DESC
limit 1;

-- 3b. and Total spend per country is

select Country, Quantity, ProductName, QuantityPerUnit, (Quantity * QuantityPerUnit) as Total_Spend_Per_Country
from Customers
join Orders on Customers.CustomerID = Orders.CustomerID
join OrderDetails on Orders.OrderID = OrderDetails.OrderID
join Products on OrderDetails.ProductID = Products.ProductID
Order by Total_Spend_Per_Country ASC

--4. Top 10 most popular product

select ProductName, UnitsOnOrder
from Products
order by UnitsOnOrder DESC
limit 10;


-- 5. Suppliers for our most popular Products

select ProductName, UnitsOnOrder, CompanyName, ContactName, City, Country
from Products
join Suppliers on Products.SupplierID = Suppliers.SupplierID
order by UnitsOnOrder DESC
limit 10;

-- Table for Visualization

create VIEW "Customers and Orders by Country" as
select CompanyName, Country, Region, ShipCountry, ShipCity, ShipName
from Customers
join Orders on Customers.CustomerID = Orders.CustomerID
order by Country ASC



