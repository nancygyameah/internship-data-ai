SELECT * FROM Customer LIMIT 10; 

-- Top 5 customers by total spend 
SELECT c.FirstName, c.LastName, SUM(i.Total) AS Spend 
FROM Customer c 
JOIN Invoice i ON i.CustomerId = c.CustomerId 
GROUP BY c.CustomerId 
ORDER BY Spend DESC 
LIMIT 5; 

 -- Revenue by country 
SELECT BillingCountry, SUM(Total) AS Revenue 
FROM Invoice 
GROUP BY BillingCountry 
ORDER BY Revenue DESC; 

-- OTHER SIX QUERIES
--AVERAGE INVOICE VALUES
SELECT AVG(Total) AS Average_Invoice_Value
FROM Invoice;
 
 --INVOICES PER YEAR
 SELECT
    strftime('%Y', InvoiceDate) AS Year,
    COUNT(InvoiceId) AS Number_of_Invoices
FROM Invoice
GROUP BY Year
ORDER BY Year;


--SALES BY Genre
SELECT
    Genre.Name AS Genre,
    SUM(InvoiceLine.UnitPrice * InvoiceLine.Quantity) AS Total_Sales
FROM InvoiceLine
JOIN Track
    ON InvoiceLine.TrackId = Track.TrackId
JOIN Genre
    ON Track.GenreId = Genre.GenreId
GROUP BY Genre.Name
ORDER BY Total_Sales DESC;

--TOP 5 TRACKS BY SALES
SELECT
    Track.Name AS Track_Name,
    SUM(InvoiceLine.UnitPrice * InvoiceLine.Quantity) AS Sales
FROM InvoiceLine
JOIN Track
    ON InvoiceLine.TrackId = Track.TrackId
GROUP BY Track.TrackId
ORDER BY Sales DESC
LIMIT 5;


--CUSTOMERS PER Country
SELECT
    Country,
    COUNT(CustomerId) AS Number_of_Customers
FROM Customer
GROUP BY Country
ORDER BY Number_of_Customers DESC;

--TOTAL REVENUE
SELECT
    SUM(Total) AS Total_Revenue
FROM Invoice;



