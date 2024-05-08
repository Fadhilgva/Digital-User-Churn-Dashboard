--Soal 1.1
CREATE DATASET rakamin;

CREATE TABLE rakamin.customers
(
    CustomerID INT64 NOT NULL,
    FirstName STRING NOT NULL,
    LastName  STRING NOT NULL,
    CustomerEmail STRING NOT NULL,
    CustomerPhone STRING NOT NULL,
    CustomerAddress STRING NOT NULL,
    CustomerCity  STRING NOT NULL,
    CustomerState STRING NOT NULL,
    CustomerZip INT64 NOT NULL,
    PRIMARY KEY (CustomerID) NOT ENFORCED
);

--Soal 1.2
CREATE TABLE rakamin.products (
    ProdNumber STRING NOT NULL,
    ProdName STRING NOT NULL,
    Category INT64 NOT NULL,
    Price FLOAT64 NOT NULL,
    PRIMARY KEY (ProdNumber) NOT ENFORCED
);

--Soal 1.3
CREATE TABLE rakamin.orders (
    OrderID INT64 NOT NULL,
    Date DATE NOT NULL,
    CustomerID INT64 NOT NULL,
    ProdNumber STRING NOT NULL,
    Quantity INT64 NOT NULL,
    PRIMARY KEY (OrderId) NOT ENFORCED
);

--Soal 1.4
CREATE TABLE rakamin.product_category 
(
    CategoryID INT64 NOT NULL,,
    CategoryName STRING NOT NULL,
    CategoryAbbreviation STRING NOT NULL,
    PRIMARY KEY (CategoryID) NOT ENFORCED
);

--Soal 2.1
ALTER TABLE rakamin.orders
ADD CONSTRAINT fk_customer FOREIGN KEY (CustomerID) REFERENCES rakamin.customers(CustomerID) NOT ENFORCED;

--Soal 2.2
ALTER TABLE rakamin.orders
ADD CONSTRAINT fk_product FOREIGN KEY (ProdNumber) REFERENCES rakamin.products(ProdNumber) NOT ENFORCED;

--Soal 2.3
ALTER TABLE rakamin.products
ADD CONSTRAINT fk_productcategory FOREIGN KEY (Category) REFERENCES rakamin.product_category(CategoryID) NOT ENFORCED;

--Soal 3
SELECT 
  orders.Date, 
  product_category.CategoryName, 
  products.ProdName, 
  CAST(products.Price AS DECIMAL) AS Price,
  orders.Quantity,
  CAST(products.Price AS DECIMAL) * orders.Quantity AS TotalSales, 
  customers.CustomerEmail, 
  customers.CustomerCity
FROM 
    rakamin.orders
INNER JOIN 
    rakamin.customers ON customers.CustomerID = orders.CustomerID
INNER JOIN 
    rakamin.products ON orders.ProdNumber = products.ProdNumber
INNER JOIN 
    rakamin.product_category ON products.Category = product_category.CategoryID
ORDER BY orders.Date;