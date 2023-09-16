--INER JOIN 
--(1)Listar todos los productos junto con sus categorias 
SELECT Products.ProductName, Categories.CategoryName
FROM Products
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID;

--(2)Obtener informacion sobre los productos en un pedido especifico
SELECT Products.ProductName, Order_Details.Quantity, Order_Details.UnitPrice
FROM Products
INNER JOIN Order_Details ON Products.ProductID = Order_Details.ProductID
WHERE Order_Details.OrderID = 10248;

--(3)Lista los empleados junto con sus jefes 
SELECT E.EmployeeID, E.FirstName AS EmployeeFirstName, E.LastName AS EmployeeLastName, 
       M.FirstName AS ManagerFirstName, M.LastName AS ManagerLastName
FROM Employees E
INNER JOIN Employees M ON E.ReportsTo = M.EmployeeID;

--(4)obtener un lista de clientes y sus pedidos 
SELECT Customers.ContactName, Orders.OrderID, Orders.OrderDate
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

--(5)Listar los productos que han sido pedidos al menos una vez 
SELECT DISTINCT Products.ProductName
FROM Products
INNER JOIN Order_Details ON Products.ProductID = Order_Details.ProductID;


--(6) Producto con el precio mínimo en cada categoría
SELECT c.CategoryName, MIN(p.UnitPrice) AS MinPrice
FROM Categories c
INNER JOIN Products p ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryName;


--(7)Obtener una lista de empleados junto con la informacion de sus territorios asignados
SELECT Employees.FirstName, Employees.LastName, Territories.TerritoryDescription
FROM Employees
INNER JOIN EmployeeTerritories ON Employees.EmployeeID = EmployeeTerritories.EmployeeID
INNER JOIN Territories ON EmployeeTerritories.TerritoryID = Territories.TerritoryID;


--(8)Listar los clientes que han realizado compras en un año especifico 
SELECT Customers.ContactName, Orders.OrderDate
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE YEAR(Orders.OrderDate) = 1997;

--(9)Obtener una lista de proveedores y los productos que suministran
SELECT Suppliers.CompanyName, Products.ProductName
FROM Suppliers
INNER JOIN Products ON Suppliers.SupplierID = Products.SupplierID;

--(10)Listar los clientes junto con los productos que han comprado
SELECT Customers.ContactName, Products.ProductName
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
INNER JOIN Order_Details ON Orders.OrderID = Order_Details.OrderID
INNER JOIN Products ON Order_Details.ProductID = Products.ProductID;

--(11)Cliente con la fecha de pedido más antigua
SELECT c.CustomerID, c.ContactName, MIN(o.OrderDate) AS OldestOrderDate
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.ContactName;



--(12)Listar los productos junto con sus proveedores y categorias
SELECT Products.ProductName, Suppliers.CompanyName, Categories.CategoryName
FROM Products
INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID;


--(13)Obtener una lista de pedidos y los empleados que los han procesado
SELECT Orders.OrderID, Employees.FirstName AS EmployeeFirstName, Employees.LastName AS EmployeeLastName
FROM Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID;



--(14)Empleado con la fecha de contratación más antigua
SELECT e.EmployeeID, e.FirstName, e.LastName, MIN(e.HireDate) AS OldestHireDate
FROM Employees e
GROUP BY e.EmployeeID, e.FirstName, e.LastName;




--(15)Lista los productos y la cantidad total vendida de cada uno
SELECT Products.ProductName, SUM(Order_Details.Quantity) AS TotalSold
FROM Products
INNER JOIN Order_Details ON Products.ProductID = Order_Details.ProductID
GROUP BY Products.ProductName;


--(16)Obtener ina lista de empleados y sus respectivas ciudades de envio y pedidos 
SELECT Employees.FirstName, Employees.LastName, Orders.ShipCity
FROM Employees
INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID;


--(17) Listar los productos y sus precios unitarios junto con la categorias a las que pertenecen 
SELECT Products.ProductName, Products.UnitPrice, Categories.CategoryName
FROM Products
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID;


--(18) Obtener una lista de pedidos y los detalles de envio correspondientes, incluyendo informacion sobre el transportista
SELECT Orders.OrderID, Orders.OrderDate, Shippers.CompanyName, Shippers.Phone
FROM Orders
INNER JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID;


--(19) Listar los clientes junto con sus pedidos y los productos en cada pedido: 
SELECT Customers.ContactName, Orders.OrderID, Products.ProductName
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
INNER JOIN Order_Details ON Orders.OrderID = Order_Details.OrderID
INNER JOIN Products ON Order_Details.ProductID = Products.ProductID;


--(20)Proveedor con el producto más barato
SELECT s.SupplierID, s.CompanyName, MIN(p.UnitPrice) AS MinPrice
FROM Suppliers s
INNER JOIN Products p ON s.SupplierID = p.SupplierID
GROUP BY s.SupplierID, s.CompanyName;



--(21) Listar los productos junto con la cantidad total vendida y el valor total de ventas para cada uno
SELECT Products.ProductName, SUM(Order_Details.Quantity) AS TotalSold, SUM(Order_Details.Quantity * Order_Details.UnitPrice) AS TotalSales
FROM Products
INNER JOIN Order_Details ON Products.ProductID = Order_Details.ProductID
GROUP BY Products.ProductName;


--(22)Listar los productos y sus proveedores, incluyendo información de contacto del proveedor:
SELECT Products.ProductName, Suppliers.CompanyName, Suppliers.ContactName, Suppliers.ContactTitle, Suppliers.Phone
FROM Products
INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID;


--(23)Obtener una lista de pedidos y los detalles de envío correspondientes, ordenados por fecha de envío:
SELECT Orders.OrderID, Orders.OrderDate, Shippers.CompanyName, Shippers.Phone, Orders.ShippedDate
FROM Orders
INNER JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
ORDER BY Orders.ShippedDate;


--(24)Listar los clientes junto con sus pedidos, incluyendo la fecha de pedido y la fecha de entrega prevista
SELECT Customers.ContactName, Orders.OrderID, Orders.OrderDate, Orders.RequiredDate
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;


--(25)Listar los clientes que han realizado pedidos más de una vez:
SELECT Customers.ContactName, COUNT(Orders.OrderID) AS NumOrders
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.ContactName
HAVING COUNT(Orders.OrderID) > 1;


--(26)Obtener una lista de empleados junto con los productos que han vendido en pedidos
SELECT Employees.FirstName, Employees.LastName, Products.ProductName
FROM Employees
INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
INNER JOIN Order_Details ON Orders.OrderID = Order_Details.OrderID
INNER JOIN Products ON Order_Details.ProductID = Products.ProductID;


--(27)Proveedor con el proucto mas barato
SELECT s.SupplierID, s.CompanyName, MIN(p.UnitPrice) AS MinPrice
FROM Suppliers s
INNER JOIN Products p ON s.SupplierID = p.SupplierID
GROUP BY s.SupplierID, s.CompanyName;


--(28)Empleado con la cantidad de procutos vendidos mas bajo (pa correrlo)
SELECT e.EmployeeID, e.FirstName, e.LastName, MIN(od.Quantity) AS MinQuantitySold
FROM Employees e
INNER JOIN Orders o ON e.EmployeeID = o.EmployeeID
INNER JOIN Order_Details od ON o.OrderID = od.OrderID
GROUP BY e.EmployeeID, e.FirstName, e.LastName;



--(29)Listar los productos junto con sus categorías y las unidades vendidas en cada categoría
SELECT Categories.CategoryName, Products.ProductName, SUM(Order_Details.Quantity) AS TotalSold
FROM Categories
INNER JOIN Products ON Categories.CategoryID = Products.CategoryID
LEFT JOIN Order_Details ON Products.ProductID = Order_Details.ProductID
GROUP BY Categories.CategoryName, Products.ProductName;


--(30)Obtener una lista de pedidos junto con los detalles de envío correspondientes, incluyendo la dirección de envío
SELECT Orders.OrderID, Orders.ShipName, Orders.ShipAddress, Orders.ShipCity, Orders.ShipRegion, Orders.ShipPostalCode, Orders.ShipCountry, Shippers.CompanyName, Shippers.Phone
FROM Orders
INNER JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID;


--(31) Producto con el precio máximo en cada categoría
SELECT c.CategoryName, MAX(p.UnitPrice) AS MaxPrice
FROM Categories c
INNER JOIN Products p ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryName;



--(32)Listar los clientes junto con la cantidad total gastada en pedidos por cada uno de ellos, ordenados por la cantidad gastada de manera descendente
SELECT Customers.ContactName, SUM(Order_Details.Quantity * Order_Details.UnitPrice) AS TotalSpent
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
INNER JOIN Order_Details ON Orders.OrderID = Order_Details.OrderID
GROUP BY Customers.ContactName
ORDER BY TotalSpent DESC;


--(33)Cliente con la fecha de pedido más reciente
SELECT c.CustomerID, c.ContactName, MAX(o.OrderDate) AS LatestOrderDate
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.ContactName;



--(34)Listar los productos y las categorías a las que pertenecen, ordenados alfabéticamente por nombre de categoría y nombre de producto
SELECT Products.ProductName, Categories.CategoryName
FROM Products
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID
ORDER BY Categories.CategoryName, Products.ProductName;


--(35)Obtener una lista de pedidos que contengan productos de la categoría "Bebidas" y que hayan sido enviados por un transportista cuyo nombre contiene "Speedy" en su nombre
SELECT Orders.OrderID, Orders.OrderDate, Shippers.CompanyName
FROM Orders
INNER JOIN Order_Details ON Orders.OrderID = Order_Details.OrderID
INNER JOIN Products ON Order_Details.ProductID = Products.ProductID
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID
INNER JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
WHERE Categories.CategoryName = 'Beverages'
  AND Shippers.CompanyName LIKE '%Speedy%';


--(36)Empleado con la fecha de contratación más reciente
SELECT e.EmployeeID, e.FirstName, e.LastName, MAX(e.HireDate) AS LatestHireDate
FROM Employees e
GROUP BY e.EmployeeID, e.FirstName, e.LastName;



--(37)Obtener una lista de empleados y sus correspondientes territorios asignados, incluyendo la descripción del territorio
SELECT Employees.FirstName, Employees.LastName, Territories.TerritoryDescription
FROM Employees
INNER JOIN EmployeeTerritories ON Employees.EmployeeID = EmployeeTerritories.EmployeeID
INNER JOIN Territories ON EmployeeTerritories.TerritoryID = Territories.TerritoryID;


--(38)Listar los clientes junto con sus pedidos y los productos en cada pedido, ordenados por fecha de pedido de manera descendente
SELECT Customers.ContactName, Orders.OrderID, Orders.OrderDate, Products.ProductName
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
INNER JOIN Order_Details ON Orders.OrderID = Order_Details.OrderID
INNER JOIN Products ON Order_Details.ProductID = Products.ProductID
ORDER BY Orders.OrderDate DESC;


--(39)Listar los productos y sus proveedores, incluyendo información de contacto completa de los proveedores
SELECT Products.ProductName, Suppliers.CompanyName, Suppliers.ContactName, Suppliers.ContactTitle, Suppliers.Address, Suppliers.City, Suppliers.Country, Suppliers.Phone
FROM Products
INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID;


--(40)Proveedor con el producto más caro
SELECT s.SupplierID, s.CompanyName, MAX(p.UnitPrice) AS MaxPrice
FROM Suppliers s
INNER JOIN Products p ON s.SupplierID = p.SupplierID
GROUP BY s.SupplierID, s.CompanyName;



--(41)Listar los productos y la cantidad total vendida en el año 1997, ordenados de manera descendente por cantidad vendida
SELECT Products.ProductName, SUM(Order_Details.Quantity) AS TotalSold
FROM Products
INNER JOIN Order_Details ON Products.ProductID = Order_Details.ProductID
INNER JOIN Orders ON Order_Details.OrderID = Orders.OrderID
WHERE YEAR(Orders.OrderDate) = 1997
GROUP BY Products.ProductName
ORDER BY TotalSold DESC;


--(42)Empleado con la cantidad de productos vendidos más alta
SELECT e.EmployeeID, e.FirstName, e.LastName, MAX(od.Quantity) AS MaxQuantitySold
FROM Employees e
INNER JOIN Orders o ON e.EmployeeID = o.EmployeeID
INNER JOIN Order_Details od ON o.OrderID = od.OrderID
GROUP BY e.EmployeeID, e.FirstName, e.LastName;



--(43)Listar los empleados que tienen jefe (gerente) y han procesado al menos un pedido
SELECT E.FirstName AS EmployeeFirstName, E.LastName AS EmployeeLastName
FROM Employees E
INNER JOIN Orders O ON E.EmployeeID = O.EmployeeID
WHERE E.ReportsTo IS NOT NULL;


--(44)Obtener una lista de pedidos junto con los detalles de envío correspondientes, incluyendo la dirección de envío y la fecha de envío, ordenados por fecha de pedido de manera ascendente
SELECT Orders.OrderID, Orders.OrderDate, Orders.ShipName, Orders.ShipAddress, Orders.ShipCity, Orders.ShipRegion, Orders.ShipPostalCode, Orders.ShipCountry, Shippers.CompanyName, Shippers.Phone, Orders.ShippedDate
FROM Orders
INNER JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
ORDER BY Orders.OrderDate ASC;


--(45)Cliente con el pedido más antiguo en cada país(el mas viejon)
SELECT c.Country, MIN(o.OrderDate) AS OldestOrderDate
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.Country;



--(46)Obtener una lista de empleados junto con la cantidad total de productos que han vendido en pedidos, ordenados de manera descendente por la cantidad vendida
SELECT Employees.FirstName, Employees.LastName, SUM(Order_Details.Quantity) AS TotalSold
FROM Employees
INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
INNER JOIN Order_Details ON Orders.OrderID = Order_Details.OrderID
GROUP BY Employees.FirstName, Employees.LastName
ORDER BY TotalSold DESC;


--(47) Proveedor con el producto más barato en cada categoría
SELECT c.CategoryName, s.CompanyName, MIN(p.UnitPrice) AS MinPrice
FROM Categories c
INNER JOIN Products p ON c.CategoryID = p.CategoryID
INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID
GROUP BY c.CategoryName, s.CompanyName;


--(48)Obtener una lista de clientes y sus respectivos pedidos, incluyendo la fecha de pedido y la fecha de envío, ordenados por fecha de pedido de manera descendente
SELECT Customers.ContactName, Orders.OrderID, Orders.OrderDate, Orders.ShippedDate
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Orders.OrderDate DESC;


--(49)Producto con la cantidad mínima en inventario en cada categoría
SELECT c.CategoryName, p.ProductName, MIN(p.UnitsInStock) AS MinUnitsInStock
FROM Categories c
INNER JOIN Products p ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryName, p.ProductName;



--(50)Empleado con el pedido más antiguo
SELECT e.EmployeeID, e.FirstName, e.LastName, MIN(o.OrderDate) AS OldestOrderDate
FROM Employees e
INNER JOIN Orders o ON e.EmployeeID = o.EmployeeID
GROUP BY e.EmployeeID, e.FirstName, e.LastName;




--Left Join
--(51)Listar todos los productos y su categoría, incluyendo los productos que no tienen una categoría asignada
SELECT Products.ProductName, Categories.CategoryName
FROM Products
LEFT JOIN Categories ON Products.CategoryID = Categories.CategoryID;

--(52)Obtener una lista de todos los clientes y sus pedidos, incluyendo aquellos clientes que no han realizado pedidos
SELECT Customers.ContactName, Orders.OrderID, Orders.OrderDate
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;


--(53)Listar los empleados junto con la cantidad total de pedidos que han procesado, incluyendo aquellos empleados que no han procesado ningún pedido
SELECT Employees.FirstName, Employees.LastName, COUNT(Orders.OrderID) AS TotalOrdersProcessed
FROM Employees
LEFT JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY Employees.FirstName, Employees.LastName;


--(54)Obtener una lista de todos los productos y la cantidad total vendida de cada uno, incluyendo productos que nunca se han vendido
SELECT Products.ProductName, SUM(Order_Details.Quantity) AS TotalSold
FROM Products
LEFT JOIN Order_Details ON Products.ProductID = Order_Details.ProductID
GROUP BY Products.ProductName;


--(55)Listar los proveedores y la cantidad total de productos que suministran, incluyendo proveedores que no suministran ningún producto
SELECT Suppliers.CompanyName, COUNT(Products.ProductID) AS TotalProductsSupplied
FROM Suppliers
LEFT JOIN Products ON Suppliers.SupplierID = Products.SupplierID
GROUP BY Suppliers.CompanyName;


--(56)Listar todos los productos y sus proveedores, incluyendo los productos que no tienen proveedores asignados
SELECT Products.ProductName, Suppliers.CompanyName
FROM Products
LEFT JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID;


--(57)Obtener una lista de clientes y la cantidad total de pedidos que han realizado, incluyendo aquellos clientes que no han realizado pedidos
SELECT Customers.ContactName, COUNT(Orders.OrderID) AS TotalOrdersPlaced
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.ContactName;


--(58)Listar todos los empleados y sus territorios asignados, incluyendo empleados que no tienen territorios asignados
SELECT Employees.FirstName, Employees.LastName, Territories.TerritoryDescription
FROM Employees
LEFT JOIN EmployeeTerritories ON Employees.EmployeeID = EmployeeTerritories.EmployeeID
LEFT JOIN Territories ON EmployeeTerritories.TerritoryID = Territories.TerritoryID;


--(59Obtener una lista de productos y la cantidad total de unidades vendidas de cada uno, incluyendo productos que nunca se han vendido
SELECT Products.ProductName, SUM(COALESCE(Order_Details.Quantity, 0)) AS TotalSold
FROM Products
LEFT JOIN Order_Details ON Products.ProductID = Order_Details.ProductID
GROUP BY Products.ProductName;


--(60)Listar todos los proveedores y la cantidad total de productos que suministran, incluyendo proveedores que no suministran ningún producto
SELECT Suppliers.CompanyName, COUNT(Products.ProductID) AS TotalProductsSupplied
FROM Suppliers
LEFT JOIN Products ON Suppliers.SupplierID = Products.SupplierID
GROUP BY Suppliers.CompanyName;



--(61)Listar todos los productos y sus categorías, incluyendo los productos que no tienen una categoría asignada
SELECT Products.ProductName, Categories.CategoryName
FROM Products
LEFT JOIN Categories ON Products.CategoryID = Categories.CategoryID;


--(62)Obtener una lista de clientes y la cantidad total de pedidos que han realizado, incluyendo aquellos clientes que no han realizado pedidos
SELECT Customers.ContactName, COUNT(Orders.OrderID) AS TotalOrdersPlaced
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.ContactName;


--(64)Listar todos los empleados y sus territorios asignados, incluyendo empleados que no tienen territorios asignados:
SELECT Employees.FirstName, Employees.LastName, Territories.TerritoryDescription
FROM Employees
LEFT JOIN EmployeeTerritories ON Employees.EmployeeID = EmployeeTerritories.EmployeeID
LEFT JOIN Territories ON EmployeeTerritories.TerritoryID = Territories.TerritoryID;


--(65)Obtener una lista de productos y la cantidad total de unidades vendidas de cada uno, incluyendo productos que nunca se han vendido
SELECT Products.ProductName, COALESCE(SUM(OrderDetails.Quantity), 0) AS TotalSold
FROM Products
LEFT JOIN Order_Details ON Products.ProductID = Order_Details.ProductID
GROUP BY Products.ProductName;


--(66)Listar todos los proveedores y la cantidad total de productos que suministran, incluyendo proveedores que no suministran ningún producto
SELECT Suppliers.CompanyName, COUNT(Products.ProductID) AS TotalProductsSupplied
FROM Suppliers
LEFT JOIN Products ON Suppliers.SupplierID = Products.SupplierID
GROUP BY Suppliers.CompanyName;


--(67)Listar todos los productos junto con su proveedor y la cantidad total de unidades en stock, incluyendo los productos que no tienen un proveedor asignado
SELECT Products.ProductName, Suppliers.CompanyName, Products.UnitsInStock
FROM Products
LEFT JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID;



--(68)Obtener una lista de empleados y la cantidad total de pedidos que han procesado, incluyendo empleados que no han procesado ningún pedido
SELECT Employees.FirstName, Employees.LastName, COUNT(Orders.OrderID) AS TotalOrdersProcessed
FROM Employees
LEFT JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY Employees.FirstName, Employees.LastName;


--(69)Listar todos los clientes y la cantidad total gastada en pedidos por cada uno, incluyendo aquellos clientes que no han realizado pedidos
SELECT Customers.ContactName, SUM(ISNULL(Order_Details.Quantity * Order_Details.UnitPrice, 0)) AS TotalSpent
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
LEFT JOIN Order_Details ON Orders.OrderID = Order_Details.OrderID
GROUP BY Customers.ContactName;


--(70)Obtener una lista de productos y la cantidad total de unidades vendidas de cada uno en el año 1997, incluyendo productos que nunca se han vendido ese año
SELECT Products.ProductName, COALESCE(SUM(OrderDetails.Quantity), 0) AS TotalSold
FROM Products
LEFT JOIN Order_Details ON Products.ProductID = Order_Details.ProductID
LEFT JOIN Orders ON Order_Details.OrderID = Orders.OrderID
WHERE YEAR(Orders.OrderDate) = 1997
GROUP BY Products.ProductName;


--(71)Listar los empleados y sus jefes (gerentes), incluyendo aquellos empleados que no tienen jefe asignado
SELECT E.EmployeeID, E.FirstName AS EmployeeFirstName, E.LastName AS EmployeeLastName,
       M.FirstName AS ManagerFirstName, M.LastName AS ManagerLastName
FROM Employees E
LEFT JOIN Employees M ON E.ReportsTo = M.EmployeeID;


--(72)Listar todos los productos y su cantidad actual en el inventario, incluyendo los productos que tienen una cantidad en stock igual a cero, ordenados por nombre de producto de manera ascendente
SELECT Products.ProductName, COALESCE(Products.UnitsInStock, 0) AS UnitsInStock
FROM Products
LEFT JOIN Order_Details ON Products.ProductID = Order_Details.ProductID
GROUP BY Products.ProductName, Products.UnitsInStock
ORDER BY Products.ProductName ASC;


--(73)Obtener una lista de clientes y la cantidad total gastada en pedidos por cada uno, incluyendo aquellos clientes que no han realizado pedidos, ordenados por cantidad gastada de manera descendente
SELECT Customers.ContactName, SUM(ISNULL(Order_Details.Quantity * Order_Details.UnitPrice, 0)) AS TotalSpent
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
LEFT JOIN Order_Details ON Orders.OrderID = Order_Details.OrderID
GROUP BY Customers.ContactName
ORDER BY TotalSpent DESC;


--(74)Listar todos los empleados y la cantidad total de pedidos que han procesado, incluyendo empleados que no han procesado ningún pedido, ordenados por cantidad de pedidos de manera descendente
SELECT Employees.FirstName, Employees.LastName, COUNT(Orders.OrderID) AS TotalOrdersProcessed
FROM Employees
LEFT JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY Employees.FirstName, Employees.LastName
ORDER BY TotalOrdersProcessed DESC;


--(75)Obtener una lista de productos y su precio unitario, ordenados por precio unitario de manera ascendente, incluyendo productos que no tienen precio unitario asignado
SELECT Products.ProductName, COALESCE(Products.UnitPrice, 0) AS UnitPrice
FROM Products
LEFT JOIN Order_Details ON Products.ProductID = Order_Details.ProductID
GROUP BY Products.ProductName, Products.UnitPrice
ORDER BY UnitPrice ASC;


--(76)Listar todos los proveedores y la cantidad total de productos que suministran, incluyendo proveedores que no suministran ningún producto, ordenados por cantidad de productos suministrados de manera descendente
SELECT Suppliers.CompanyName, COUNT(Products.ProductID) AS TotalProductsSupplied
FROM Suppliers
LEFT JOIN Products ON Suppliers.SupplierID = Products.SupplierID
GROUP BY Suppliers.CompanyName
ORDER BY TotalProductsSupplied DESC;


--(77)Listar todos los productos y su cantidad actual en el inventario, incluyendo los productos que tienen una cantidad en stock igual a cero, ordenados por cantidad en stock de manera descendente
SELECT Products.ProductName, COALESCE(Products.UnitsInStock, 0) AS UnitsInStock
FROM Products
LEFT JOIN Order_Details ON Products.ProductID = Order_Details.ProductID
GROUP BY Products.ProductName, Products.UnitsInStock
ORDER BY UnitsInStock DESC;



--(78)Obtener una lista de clientes y la cantidad total gastada en pedidos por cada uno, incluyendo aquellos clientes que no han realizado pedidos, ordenados por nombre de cliente de manera ascendente
SELECT Customers.ContactName, SUM(ISNULL(Order_Details.Quantity * Order_Details.UnitPrice, 0)) AS TotalSpent
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
LEFT JOIN Order_Details ON Orders.OrderID = Order_Details.OrderID
GROUP BY Customers.ContactName
ORDER BY Customers.ContactName ASC;


--(79)Listar todos los empleados y la cantidad total de pedidos que han procesado, incluyendo empleados que no han procesado ningún pedido, ordenados por nombre de empleado de manera ascendente
SELECT Employees.FirstName, Employees.LastName, COUNT(Orders.OrderID) AS TotalOrdersProcessed
FROM Employees
LEFT JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY Employees.FirstName, Employees.LastName
ORDER BY Employees.FirstName ASC, Employees.LastName ASC;


--(80)Obtener una lista de productos y su precio unitario, ordenados por precio unitario de manera descendente, incluyendo productos que no tienen precio unitario asignado
SELECT Products.ProductName, COALESCE(Products.UnitPrice, 0) AS UnitPrice
FROM Products
LEFT JOIN Order_Details ON Products.ProductID = Order_Details.ProductID
GROUP BY Products.ProductName, Products.UnitPrice
ORDER BY UnitPrice DESC;


--(81)Listar todos los proveedores y la cantidad total de productos que suministran, incluyendo proveedores que no suministran ningún producto, ordenados por nombre de proveedor de manera ascendente
SELECT Suppliers.CompanyName, COUNT(Products.ProductID) AS TotalProductsSupplied
FROM Suppliers
LEFT JOIN Products ON Suppliers.SupplierID = Products.SupplierID
GROUP BY Suppliers.CompanyName
ORDER BY Suppliers.CompanyName ASC;


--(82)Listar todos los clientes y la cantidad total gastada en pedidos por cada uno, incluyendo aquellos clientes que no han realizado pedidos, ordenados por cantidad gastada de manera ascendente
SELECT Customers.ContactName, SUM(ISNULL(Order_Details.Quantity * Order_Details.UnitPrice, 0)) AS TotalSpent
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
LEFT JOIN Order_Details ON Orders.OrderID = Order_Details.OrderID
GROUP BY Customers.ContactName
ORDER BY TotalSpent ASC;


--(83)Listar todos los productos y su cantidad actual en el inventario, incluyendo los productos que tienen una cantidad en stock igual a cero, ordenados por nombre de producto de manera ascendente
SELECT Products.ProductName, COALESCE(Products.UnitsInStock, 0) AS UnitsInStock
FROM Products
LEFT JOIN Order_Details ON Products.ProductID = Order_Details.ProductID
GROUP BY Products.ProductName, Products.UnitsInStock
ORDER BY Products.ProductName ASC;



--(84)Obtener una lista de clientes y la cantidad total gastada en pedidos por cada uno, incluyendo aquellos clientes que no han realizado pedidos, ordenados por cantidad gastada de manera descendente
SELECT Customers.ContactName, SUM(ISNULL(Order_Details.Quantity * Order_Details.UnitPrice, 0)) AS TotalSpent
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
LEFT JOIN Order_Details ON Orders.OrderID = Order_Details.OrderID
GROUP BY Customers.ContactName
ORDER BY TotalSpent DESC;


--(85)Listar todos los empleados y la cantidad total de pedidos que han procesado, incluyendo empleados que no han procesado ningún pedido, ordenados por nombre de empleado de manera ascendente
SELECT Employees.FirstName, Employees.LastName, COUNT(Orders.OrderID) AS TotalOrdersProcessed
FROM Employees
LEFT JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY Employees.FirstName, Employees.LastName
ORDER BY Employees.FirstName ASC, Employees.LastName ASC;


--(86)Obtener una lista de productos y su precio unitario, ordenados por precio unitario de manera descendente, incluyendo productos que no tienen precio unitario asignado
SELECT Products.ProductName, COALESCE(Products.UnitPrice, 0) AS UnitPrice
FROM Products
LEFT JOIN Order_Details ON Products.ProductID = Order_Details.ProductID
GROUP BY Products.ProductName, Products.UnitPrice
ORDER BY UnitPrice DESC;


--(87)Listar todos los proveedores y la cantidad total de productos que suministran, incluyendo proveedores que no suministran ningún producto, ordenados por nombre de proveedor de manera ascendente
SELECT Suppliers.CompanyName, COUNT(Products.ProductID) AS TotalProductsSupplied
FROM Suppliers
LEFT JOIN Products ON Suppliers.SupplierID = Products.SupplierID
GROUP BY Suppliers.CompanyName
ORDER BY Suppliers.CompanyName ASC;


--(88)Listar todos los clientes y la cantidad total gastada en pedidos por cada uno, incluyendo aquellos clientes que no han realizado pedidos, ordenados por cantidad gastada de manera ascendente
SELECT Customers.ContactName, SUM(ISNULL(OrderDetails.Quantity * OrderDetails.UnitPrice, 0)) AS TotalSpent
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
LEFT JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
GROUP BY Customers.ContactName
ORDER BY TotalSpent ASC;


--(89)Listar todos los productos y su cantidad actual en el inventario, incluyendo los productos que tienen una cantidad en stock igual a cero, ordenados por nombre de producto de manera ascendente
SELECT Products.ProductName, COALESCE(Products.UnitsInStock, 0) AS UnitsInStock
FROM Products
LEFT JOIN Order_Details ON Products.ProductID = Order_Details.ProductID
GROUP BY Products.ProductName, Products.UnitsInStock
ORDER BY Products.ProductName ASC;


--(90)Obtener una lista de clientes y la cantidad total gastada en pedidos por cada uno, incluyendo aquellos clientes que no han realizado pedidos, ordenados por cantidad gastada de manera descendente
SELECT Customers.ContactName, SUM(ISNULL(Order_Details.Quantity * Order_Details.UnitPrice, 0)) AS TotalSpent
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
LEFT JOIN Order_Details ON Orders.OrderID = Order_Details.OrderID
GROUP BY Customers.ContactName
ORDER BY TotalSpent DESC;


--(91)Listar todos los empleados y la cantidad total de pedidos que han procesado, incluyendo empleados que no han procesado ningún pedido, ordenados por nombre de empleado de manera ascendente
SELECT Employees.FirstName, Employees.LastName, COUNT(Orders.OrderID) AS TotalOrdersProcessed
FROM Employees
LEFT JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY Employees.FirstName, Employees.LastName
ORDER BY Employees.FirstName ASC, Employees.LastName ASC;


--(92)Obtener una lista de productos y su precio unitario, ordenados por precio unitario de manera descendente, incluyendo productos que no tienen precio unitario asignado
SELECT Products.ProductName, COALESCE(Products.UnitPrice, 0) AS UnitPrice
FROM Products
LEFT JOIN Order_Details ON Products.ProductID = Order_Details.ProductID
GROUP BY Products.ProductName, Products.UnitPrice
ORDER BY UnitPrice DESC;


--(93)Listar todos los proveedores y la cantidad total de productos que suministran, incluyendo proveedores que no suministran ningún producto, ordenados por nombre de proveedor de manera ascendente
SELECT Suppliers.CompanyName, COUNT(Products.ProductID) AS TotalProductsSupplied
FROM Suppliers
LEFT JOIN Products ON Suppliers.SupplierID = Products.SupplierID
GROUP BY Suppliers.CompanyName
ORDER BY Suppliers.CompanyName ASC;



--(94)Listar todos los clientes y la cantidad total gastada en pedidos por cada uno, incluyendo aquellos clientes que no han realizado pedidos, ordenados por cantidad gastada de manera ascendente
SELECT Customers.ContactName, SUM(ISNULL(Order_Details.Quantity * Order_Details.UnitPrice, 0)) AS TotalSpent
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
LEFT JOIN Order_Details ON Orders.OrderID = Order_Details.OrderID
GROUP BY Customers.ContactName
ORDER BY TotalSpent ASC;


--(95)Listar todos los productos y su cantidad actual en el inventario, incluyendo los productos que tienen una cantidad en stock igual a cero, ordenados por nombre de producto de manera ascendente
SELECT Products.ProductName, COALESCE(Products.UnitsInStock, 0) AS UnitsInStock
FROM Products
LEFT JOIN Order_Details ON Products.ProductID = Order_Details.ProductID
GROUP BY Products.ProductName, Products.UnitsInStock
ORDER BY Products.ProductName ASC;


--(96)Obtener una lista de clientes y la cantidad total gastada en pedidos por cada uno, incluyendo aquellos clientes que no han realizado pedidos, ordenados por nombre de cliente de manera ascendente
SELECT Customers.ContactName, SUM(ISNULL(Order_Details.Quantity * Order_Details.UnitPrice, 0)) AS TotalSpent
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
LEFT JOIN Order_Details ON Orders.OrderID = Order_Details.OrderID
GROUP BY Customers.ContactName
ORDER BY Customers.ContactName ASC;


--(97)Listar todos los empleados y la cantidad total de pedidos que han procesado, incluyendo empleados que no han procesado ningún pedido, ordenados por nombre de empleado de manera ascendente
SELECT Employees.FirstName, Employees.LastName, COUNT(Orders.OrderID) AS TotalOrdersProcessed
FROM Employees
LEFT JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY Employees.FirstName, Employees.LastName
ORDER BY Employees.FirstName ASC, Employees.LastName ASC;


--(98)Obtener una lista de productos y su precio unitario, ordenados por precio unitario de manera descendente, incluyendo productos que no tienen precio unitario asignado
SELECT Products.ProductName, COALESCE(Products.UnitPrice, 0) AS UnitPrice
FROM Products
LEFT JOIN Order_Details ON Products.ProductID = Order_Details.ProductID
GROUP BY Products.ProductName, Products.UnitPrice
ORDER BY UnitPrice DESC;


--(99)Listar todos los proveedores y la cantidad total de productos que suministran, incluyendo proveedores que no suministran ningún producto, ordenados por nombre de proveedor de manera ascendente
SELECT Suppliers.CompanyName, COUNT(Products.ProductID) AS TotalProductsSupplied
FROM Suppliers
LEFT JOIN Products ON Suppliers.SupplierID = Products.SupplierID
GROUP BY Suppliers.CompanyName
ORDER BY Suppliers.CompanyName ASC;


--(100)Listar todos los clientes y la cantidad total gastada en pedidos por cada uno, incluyendo aquellos clientes que no han realizado pedidos, ordenados por cantidad gastada de manera ascendente
SELECT Customers.ContactName, SUM(ISNULL(Order_Details.Quantity * Order_Details.UnitPrice, 0)) AS TotalSpent
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
LEFT JOIN Order_Details ON Orders.OrderID = Order_Details.OrderID
GROUP BY Customers.ContactName
ORDER BY TotalSpent ASC;

--RIGHT JOIN 
--(101)Obtén todos los productos y sus proveedores
SELECT p.ProductName, s.CompanyName
FROM Products p
RIGHT JOIN Suppliers s ON p.SupplierID = s.SupplierID;


--(102)Encuentra todos los clientes que han realizado pedidos y muestra los detalles de los pedidos
SELECT c.CustomerName, o.OrderID, o.OrderDate
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;

--(103)Lista todos los empleados y sus territorios de ventas
SELECT e.FirstName, e.LastName, t.TerritoryDescription
FROM Employees e
RIGHT JOIN EmployeeTerritories et ON e.EmployeeID = et.EmployeeID
RIGHT JOIN Territories t ON et.TerritoryID = t.TerritoryID;


--(104)Muestra los productos que no tienen pedidos
SELECT p.ProductName
FROM Products p
RIGHT JOIN [Order Details] od ON p.ProductID = od.ProductID
WHERE od.ProductID IS NULL;


--(105)Encuentra los clientes que no han realizado pedidos
SELECT c.CustomerName
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.CustomerID IS NULL;

--(106)Encuentra los empleados que han realizado pedidos y muestra la cantidad de pedidos que cada empleado ha realizado
SELECT e.FirstName, e.LastName, COUNT(o.OrderID) AS CantidadPedidos
FROM Employees e
RIGHT JOIN Orders o ON e.EmployeeID = o.EmployeeID
GROUP BY e.FirstName, e.LastName;


--(107)Lista los productos que han sido pedidos al menos una vez y muestra el nombre del cliente que realizó cada pedido
SELECT p.ProductName, c.CustomerName
FROM Products p
RIGHT JOIN [Order Details] od ON p.ProductID = od.ProductID
RIGHT JOIN Orders o ON od.OrderID = o.OrderID
RIGHT JOIN Customers c ON o.CustomerID = c.CustomerID;


--(108)Encuentra los proveedores que no han suministrado productos
SELECT s.CompanyName
FROM Suppliers s
RIGHT JOIN Products p ON s.SupplierID = p.SupplierID
WHERE p.SupplierID IS NULL;


--(109)Muestra los detalles de los pedidos y la información de los productos, incluyendo productos sin detalles de pedidos y detalles de pedidos sin productos
SELECT o.OrderID, p.ProductName, od.Quantity
FROM Orders o
RIGHT JOIN [Order Details] od ON o.OrderID = od.OrderID
RIGHT JOIN Products p ON od.ProductID = p.ProductID;


--(110)Encuentra los clientes que no han realizado ningún pedido después de una fecha específica, y muestra sus datos junto con la fecha límite
SELECT c.CustomerName, c.ContactName, o.OrderDate AS FechaPedido
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderDate IS NULL OR o.OrderDate < '2023-01-01';


--(111)Encuentra la cantidad total de productos suministrados por cada proveedor
SELECT s.CompanyName, COUNT(p.ProductID) AS TotalProductosSuministrados
FROM Suppliers s
RIGHT JOIN Products p ON s.SupplierID = p.SupplierID
GROUP BY s.CompanyName;


--(112)Muestra la cantidad total de productos vendidos por cada categoría de productos
SELECT c.CategoryName, SUM(od.Quantity) AS TotalProductosVendidos
FROM Categories c
RIGHT JOIN Products p ON c.CategoryID = p.CategoryID
RIGHT JOIN [Order Details] od ON p.ProductID = od.ProductID
GROUP BY c.CategoryName;


--(113)Lista el total de ventas realizadas por cada empleado, incluyendo a aquellos empleados que no han realizado ventas
SELECT e.FirstName, e.LastName, SUM(o.TotalPrice) AS TotalVentas
FROM Employees e
RIGHT JOIN Orders o ON e.EmployeeID = o.EmployeeID
GROUP BY e.FirstName, e.LastName;


--(114)Encuentra la cantidad total de pedidos realizados por cada cliente, incluyendo a aquellos clientes que no han realizado pedidos
SELECT c.CustomerName, COUNT(o.OrderID) AS TotalPedidos
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName;


--(115)Muestra el promedio de cantidad de productos por pedido, agrupados por cliente
SELECT c.CustomerName, AVG(od.Quantity) AS PromedioProductosPorPedido
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID
RIGHT JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY c.CustomerName;


--(116)Muestra la cantidad total de unidades vendidas de cada producto por año
SELECT YEAR(o.OrderDate) AS Año, p.ProductName, SUM(od.Quantity) AS TotalUnidadesVendidas
FROM Orders o
RIGHT JOIN [Order Details] od ON o.OrderID = od.OrderID
RIGHT JOIN Products p ON od.ProductID = p.ProductID
GROUP BY YEAR(o.OrderDate), p.ProductName
ORDER BY Año, TotalUnidadesVendidas DESC;


--(117)Encuentra la cantidad total de ventas realizadas por cada empleado por año
SELECT YEAR(o.OrderDate) AS Año, e.FirstName, e.LastName, SUM(o.TotalPrice) AS TotalVentas
FROM Employees e
RIGHT JOIN Orders o ON e.EmployeeID = o.EmployeeID
GROUP BY YEAR(o.OrderDate), e.FirstName, e.LastName
ORDER BY Año, TotalVentas DESC;


--(118)Lista los productos que nunca se han vendido
SELECT p.ProductName
FROM Products p
RIGHT JOIN [Order Details] od ON p.ProductID = od.ProductID
WHERE od.ProductID IS NULL;


--(119)Encuentra los clientes que han realizado pedidos en cada mes del año actual
SELECT MONTH(o.OrderDate) AS Mes, c.CustomerName, COUNT(o.OrderID) AS TotalPedidos
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE YEAR(o.OrderDate) = YEAR(GETDATE())
GROUP BY MONTH(o.OrderDate), c.CustomerName
ORDER BY Mes, TotalPedidos DESC;


--(120)Muestra la cantidad total de productos vendidos por cada categoría de productos por año
SELECT YEAR(o.OrderDate) AS Año, c.CategoryName, SUM(od.Quantity) AS TotalUnidadesVendidas
FROM Categories c
RIGHT JOIN Products p ON c.CategoryID = p.CategoryID
RIGHT JOIN [Order Details] od ON p.ProductID = od.ProductID
RIGHT JOIN Orders o ON od.OrderID = o.OrderID
GROUP BY YEAR(o.OrderDate), c.CategoryName
ORDER BY Año, TotalUnidadesVendidas DESC;


--(121)Muestra la cantidad total de unidades vendidas por cada producto y categoría de productos, ordenadas por categoría y producto
SELECT c.CategoryName, p.ProductName, SUM(od.Quantity) AS TotalUnidadesVendidas
FROM Categories c
RIGHT JOIN Products p ON c.CategoryID = p.CategoryID
RIGHT JOIN [Order Details] od ON p.ProductID = od.ProductID
GROUP BY c.CategoryName, p.ProductName
ORDER BY c.CategoryName, p.ProductName;


--(122)Encuentra los proveedores que no han suministrado productos y muestra el total de productos suministrados por cada proveedor que ha suministrado productos
SELECT s.CompanyName, COALESCE(COUNT(p.ProductID), 0) AS TotalProductosSuministrados
FROM Suppliers s
RIGHT JOIN Products p ON s.SupplierID = p.SupplierID
GROUP BY s.CompanyName;


--(123)Lista los territorios de ventas que no están asignados a ningún empleado y muestra el número de empleados asignados a cada territorio que está asignado
SELECT t.TerritoryDescription, COALESCE(COUNT(e.EmployeeID), 0) AS NumeroEmpleadosAsignados
FROM Territories t
RIGHT JOIN EmployeeTerritories et ON t.TerritoryID = et.TerritoryID
RIGHT JOIN Employees e ON et.EmployeeID = e.EmployeeID
GROUP BY t.TerritoryDescription;


--(124)Encuentra los clientes que no han realizado pedidos en el último año y muestra la cantidad de pedidos realizados por cada cliente que ha realizado pedidos en el último año
SELECT c.CustomerName, COALESCE(COUNT(o.OrderID), 0) AS TotalPedidosUltimoAño
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderDate >= DATEADD(YEAR, -1, GETDATE())
GROUP BY c.CustomerName;


--(125)Muestra la cantidad total de productos vendidos por cada empleado, incluyendo a aquellos empleados que no han realizado ventas, y ordena los resultados por la cantidad total de productos vendidos de manera descendente
SELECT e.FirstName, e.LastName, COALESCE(SUM(od.Quantity), 0) AS TotalProductosVendidos
FROM Employees e
RIGHT JOIN Orders o ON e.EmployeeID = o.EmployeeID
RIGHT JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY e.FirstName, e.LastName
ORDER BY TotalProductosVendidos DESC;

--(126)Encuentra la cantidad total de productos vendidos por cada cliente durante el último año, incluyendo a aquellos clientes que no han realizado compras en ese período
SELECT c.CustomerName, COALESCE(SUM(od.Quantity), 0) AS TotalProductosVendidos
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID
RIGHT JOIN [Order Details] od ON o.OrderID = od.OrderID
WHERE o.OrderDate >= DATEADD(YEAR, -1, GETDATE())
GROUP BY c.CustomerName;


--(127)Muestra la cantidad total de productos vendidos por cada empleado durante el último año, incluyendo a aquellos empleados que no han realizado ventas en ese período
SELECT e.FirstName, e.LastName, COALESCE(SUM(od.Quantity), 0) AS TotalProductosVendidos
FROM Employees e
RIGHT JOIN Orders o ON e.EmployeeID = o.EmployeeID
RIGHT JOIN [Order Details] od ON o.OrderID = od.OrderID
WHERE o.OrderDate >= DATEADD(YEAR, -1, GETDATE())
GROUP BY e.FirstName, e.LastName;


--(128)Lista los productos que han sido vendidos al menos una vez en cada año desde 2020 hasta el presente
SELECT YEAR(o.OrderDate) AS Año, p.ProductName
FROM Products p
RIGHT JOIN [Order Details] od ON p.ProductID = od.ProductID
RIGHT JOIN Orders o ON od.OrderID = o.OrderID
WHERE YEAR(o.OrderDate) BETWEEN 2020 AND YEAR(GETDATE())
GROUP BY YEAR(o.OrderDate), p.ProductName;


--(129)Muestra la cantidad total de ventas realizadas por cada cliente durante el último año, incluyendo a aquellos clientes que no han realizado compras en ese período
SELECT c.CustomerName, COALESCE(SUM(o.TotalPrice), 0) AS TotalVentas
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderDate >= DATEADD(YEAR, -1, GETDATE())
GROUP BY c.CustomerName;


--(130)Encuentra los empleados que no tienen ningún pedido registrado y muestra la cantidad de pedidos realizados por cada empleado que tiene al menos un pedido
SELECT e.FirstName, e.LastName, COALESCE(COUNT(o.OrderID), 0) AS TotalPedidos
FROM Employees e
RIGHT JOIN Orders o ON e.EmployeeID = o.EmployeeID
GROUP BY e.FirstName, e.LastName;


--(131)Lista los clientes que no han realizado pedidos durante el último año y muestra la cantidad de pedidos realizados por cada cliente que ha realizado pedidos en ese período
SELECT c.CustomerName, COALESCE(COUNT(o.OrderID), 0) AS TotalPedidos
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderDate >= DATEADD(YEAR, -1, GETDATE())
GROUP BY c.CustomerName;


--(132)Muestra la cantidad total de unidades vendidas de cada producto por cada cliente durante el último año
SELECT c.CustomerName, p.ProductName, COALESCE(SUM(od.Quantity), 0) AS TotalUnidadesVendidas
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID
RIGHT JOIN [Order Details] od ON o.OrderID = od.OrderID
RIGHT JOIN Products p ON od.ProductID = p.ProductID
WHERE o.OrderDate >= DATEADD(YEAR, -1, GETDATE())
GROUP BY c.CustomerName, p.ProductName;


--(133)Encuentra los productos que no han sido vendidos durante el último año y muestra la cantidad de unidades vendidas de cada producto que ha sido vendido en ese período
SELECT p.ProductName, COALESCE(SUM(od.Quantity), 0) AS TotalUnidadesVendidas
FROM Products p
RIGHT JOIN [Order Details] od ON p.ProductID = od.ProductID
RIGHT JOIN Orders o ON od.OrderID = o.OrderID
WHERE o.OrderDate >= DATEADD(YEAR, -1, GETDATE())
GROUP BY p.ProductName;


--(134)Muestra la cantidad total de productos vendidos por cada categoría de productos durante el último año
SELECT c.CategoryName, COALESCE(SUM(od.Quantity), 0) AS TotalUnidadesVendidas
FROM Categories c
RIGHT JOIN Products p ON c.CategoryID = p.CategoryID
RIGHT JOIN [Order Details] od ON p.ProductID = od.ProductID
RIGHT JOIN Orders o ON od.OrderID = o.OrderID
WHERE o.OrderDate >= DATEADD(YEAR, -1, GETDATE())
GROUP BY c.CategoryName;


--(135)Encuentra los clientes que realizaron pedidos después de la fecha de inicio de un período específico, pero antes de la fecha de finalización de ese período, y muestra la cantidad de pedidos realizados por cada cliente en ese período
SELECT c.CustomerName, COUNT(o.OrderID) AS TotalPedidos
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderDate >= '2023-01-01' AND o.OrderDate <= '2023-06-30'
GROUP BY c.CustomerName;


--(136)Muestra la cantidad total de productos vendidos por cada cliente durante el último año, ordenando los resultados por nombre de cliente de manera ascendente
SELECT c.CustomerName, COALESCE(SUM(od.Quantity), 0) AS TotalProductosVendidos
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID
RIGHT JOIN [Order Details] od ON o.OrderID = od.OrderID
WHERE o.OrderDate >= DATEADD(YEAR, -1, GETDATE())
GROUP BY c.CustomerName
ORDER BY c.CustomerName ASC;


--(137)Encuentra los productos que no han sido vendidos durante el último año y muestra la cantidad de unidades vendidas de cada producto que ha sido vendido en ese período, ordenando los resultados por cantidad de unidades vendidas de manera descendente
SELECT p.ProductName, COALESCE(SUM(od.Quantity), 0) AS TotalUnidadesVendidas
FROM Products p
RIGHT JOIN [Order Details] od ON p.ProductID = od.ProductID
RIGHT JOIN Orders o ON od.OrderID = o.OrderID
WHERE o.OrderDate >= DATEADD(YEAR, -1, GETDATE())
GROUP BY p.ProductName
ORDER BY TotalUnidadesVendidas DESC;


--(138)Lista los empleados que no tienen pedidos durante el último año y muestra la cantidad de pedidos realizados por cada empleado que ha realizado pedidos en ese período, ordenando los resultados por cantidad de pedidos de manera descendente
SELECT e.FirstName, e.LastName, COALESCE(COUNT(o.OrderID), 0) AS TotalPedidos
FROM Employees e
RIGHT JOIN Orders o ON e.EmployeeID = o.EmployeeID
WHERE o.OrderDate >= DATEADD(YEAR, -1, GETDATE())
GROUP BY e.FirstName, e.LastName
ORDER BY TotalPedidos DESC;


--(139)Muestra la cantidad total de ventas realizadas por cada cliente durante el último año, ordenando los resultados por cantidad total de ventas de manera descendente
SELECT c.CustomerName, COALESCE(SUM(o.TotalPrice), 0) AS TotalVentas
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderDate >= DATEADD(YEAR, -1, GETDATE())
GROUP BY c.CustomerName
ORDER BY TotalVentas DESC;


--(140)Encuentra los productos que no han sido vendidos durante el último año y muestra la cantidad de unidades vendidas de cada producto que ha sido vendido en ese período, ordenando los resultados por nombre de producto de manera ascendente
SELECT p.ProductName, COALESCE(SUM(od.Quantity), 0) AS TotalUnidadesVendidas
FROM Products p
RIGHT JOIN [Order Details] od ON p.ProductID = od.ProductID
RIGHT JOIN Orders o ON od.OrderID = o.OrderID
WHERE o.OrderDate >= DATEADD(YEAR, -1, GETDATE())
GROUP BY p.ProductName
ORDER BY p.ProductName ASC;


--(141)Lista los clientes que no han realizado ningún pedido y muestra la cantidad de pedidos realizados por cada cliente que ha realizado al menos un pedido, ordenando los resultados por cantidad de pedidos de manera descendente
SELECT c.CustomerName, COALESCE(COUNT(o.OrderID), 0) AS TotalPedidos
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName
ORDER BY TotalPedidos DESC;


--(142)Muestra la cantidad total de productos vendidos por cada empleado durante el último año, ordenando los resultados por nombre de empleado de manera ascendente
SELECT e.FirstName, e.LastName, COALESCE(SUM(od.Quantity), 0) AS TotalProductosVendidos
FROM Employees e
RIGHT JOIN Orders o ON e.EmployeeID = o.EmployeeID
RIGHT JOIN [Order Details] od ON o.OrderID = od.OrderID
WHERE o.OrderDate >= DATEADD(YEAR, -1, GETDATE())
GROUP BY e.FirstName, e.LastName
ORDER BY e.FirstName ASC, e.LastName ASC;


--(143)Encuentra los productos que no han sido vendidos durante el último año y muestra la cantidad de unidades vendidas de cada producto que ha sido vendido en ese período, ordenando los resultados por cantidad de unidades vendidas de manera ascendente
SELECT p.ProductName, COALESCE(SUM(od.Quantity), 0) AS TotalUnidadesVendidas
FROM Products p
RIGHT JOIN [Order Details] od ON p.ProductID = od.ProductID
RIGHT JOIN Orders o ON od.OrderID = o.OrderID
WHERE o.OrderDate >= DATEADD(YEAR, -1, GETDATE())
GROUP BY p.ProductName
ORDER BY TotalUnidadesVendidas ASC;


--(144)Muestra la cantidad total de ventas realizadas por cada cliente durante el último año, ordenando los resultados por nombre de cliente de manera descendente
SELECT c.CustomerName, COALESCE(SUM(o.TotalPrice), 0) AS TotalVentas
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderDate >= DATEADD(YEAR, -1, GETDATE())
GROUP BY c.CustomerName
ORDER BY c.CustomerName DESC;


--(145)Encuentra los clientes que realizaron pedidos después de la fecha de inicio de un período específico, pero antes de la fecha de finalización de ese período, y muestra la cantidad de pedidos realizados por cada cliente en ese período, ordenando los resultados por nombre de cliente de manera ascendente
SELECT c.CustomerName, COUNT(o.OrderID) AS TotalPedidos
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderDate >= '2023-01-01' AND o.OrderDate <= '2023-06-30'
GROUP BY c.CustomerName
ORDER BY c.CustomerName ASC;


--(146)Encuentra los productos que no han sido vendidos durante el último año y muestra la cantidad de unidades vendidas de cada producto que ha sido vendido en ese período, ordenando los resultados por cantidad de unidades vendidas de manera descendente y limitando los resultados a los 10 productos más vendidos
SELECT p.ProductName, COALESCE(SUM(od.Quantity), 0) AS TotalUnidadesVendidas
FROM Products p
RIGHT JOIN [Order Details] od ON p.ProductID = od.ProductID
RIGHT JOIN Orders o ON od.OrderID = o.OrderID
WHERE o.OrderDate >= DATEADD(YEAR, -1, GETDATE())
GROUP BY p.ProductName
ORDER BY TotalUnidadesVendidas DESC
LIMIT 10;


--(147)Lista los clientes que no han realizado ningún pedido y muestra la cantidad de pedidos realizados por cada cliente que ha realizado al menos un pedido, ordenando los resultados por nombre de cliente de manera ascendente
SELECT c.CustomerName, COALESCE(COUNT(o.OrderID), 0) AS TotalPedidos
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName
ORDER BY c.CustomerName ASC;


--(148)Muestra la cantidad total de productos vendidos por cada empleado durante el último año, ordenando los resultados por cantidad total de productos vendidos de manera descendente y limitando los resultados a los 10 empleados con las ventas más altas
SELECT e.FirstName, e.LastName, COALESCE(SUM(od.Quantity), 0) AS TotalProductosVendidos
FROM Employees e
RIGHT JOIN Orders o ON e.EmployeeID = o.EmployeeID
RIGHT JOIN [Order Details] od ON o.OrderID = od.OrderID
WHERE o.OrderDate >= DATEADD(YEAR, -1, GETDATE())
GROUP BY e.FirstName, e.LastName
ORDER BY TotalProductosVendidos DESC
LIMIT 10;


--(149)Encuentra los productos que no han sido vendidos durante el último año y muestra la cantidad de unidades vendidas de cada producto que ha sido vendido en ese período, ordenando los resultados por nombre de producto de manera ascendente y limitando los resultados a los 10 productos menos vendidos
SELECT p.ProductName, COALESCE(SUM(od.Quantity), 0) AS TotalUnidadesVendidas
FROM Products p
RIGHT JOIN [Order Details] od ON p.ProductID = od.ProductID
RIGHT JOIN Orders o ON od.OrderID = o.OrderID
WHERE o.OrderDate >= DATEADD(YEAR, -1, GETDATE())
GROUP BY p.ProductName
ORDER BY TotalUnidadesVendidas ASC
LIMIT 10;


--(150)Muestra la cantidad total de ventas realizadas por cada cliente durante el último año, ordenando los resultados por cantidad total de ventas de manera descendente y limitando los resultados a los 10 clientes con las ventas más altas.
SELECT c.CustomerName, COALESCE(SUM(o.TotalPrice), 0) AS TotalVentas
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderDate >= DATEADD(YEAR, -1, GETDATE())
GROUP BY c.CustomerName
ORDER BY TotalVentas DESC
LIMIT 10;

--FULL OUTER

--(151)Muestra todos los productos y sus proveedores correspondientes, incluyendo aquellos productos que no tienen un proveedor asignado y los proveedores que no tienen productos asociados.
SELECT p.ProductName, s.CompanyName
FROM Products p
FULL OUTER JOIN Suppliers s ON p.SupplierID = s.SupplierID;


--(152)Lista todos los empleados y sus pedidos correspondientes, incluyendo aquellos empleados que no han realizado pedidos y los pedidos que no tienen empleados asignados
SELECT e.FirstName, e.LastName, o.OrderID
FROM Employees e
FULL OUTER JOIN Orders o ON e.EmployeeID = o.EmployeeID;


--(153)Muestra todos los clientes y sus pedidos correspondientes, incluyendo aquellos clientes que no han realizado pedidos y los pedidos que no tienen clientes asignados
SELECT c.CustomerName, o.OrderID
FROM Customers c
FULL OUTER JOIN Orders o ON c.CustomerID = o.CustomerID;


--(154)Encuentra todos los productos que han sido vendidos al menos una vez y muestra la cantidad de unidades vendidas de cada producto, incluyendo aquellos productos que no tienen ventas registradas
SELECT p.ProductName, COALESCE(SUM(od.Quantity), 0) AS TotalUnidadesVendidas
FROM Products p
FULL OUTER JOIN [Order Details] od ON p.ProductID = od.ProductID
GROUP BY p.ProductName;


--(155)Muestra todos los empleados y la cantidad total de ventas realizadas por cada empleado, incluyendo aquellos empleados que no han realizado ventas
SELECT e.FirstName, e.LastName, COALESCE(SUM(o.TotalPrice), 0) AS TotalVentas
FROM Employees e
FULL OUTER JOIN Orders o ON e.EmployeeID = o.EmployeeID
GROUP BY e.FirstName, e.LastName;


--(156)Muestra todos los productos y la cantidad total de unidades vendidas de cada producto, incluyendo aquellos productos que no tienen ventas registradas
SELECT p.ProductName, COALESCE(SUM(od.Quantity), 0) AS TotalUnidadesVendidas
FROM Products p
FULL OUTER JOIN [Order Details] od ON p.ProductID = od.ProductID
GROUP BY p.ProductName;


--(157)Lista todos los clientes y la cantidad total de pedidos realizados por cada cliente, incluyendo aquellos clientes que no han realizado pedidos
SELECT c.CustomerName, COALESCE(COUNT(o.OrderID), 0) AS TotalPedidos
FROM Customers c
FULL OUTER JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName;


--(158)Encuentra todos los empleados y la cantidad total de productos vendidos por cada empleado, incluyendo aquellos empleados que no han realizado ventas
SELECT e.FirstName, e.LastName, COALESCE(SUM(od.Quantity), 0) AS TotalProductosVendidos
FROM Employees e
FULL OUTER JOIN Orders o ON e.EmployeeID = o.EmployeeID
FULL OUTER JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY e.FirstName, e.LastName;


--(159)Muestra todos los proveedores y la cantidad total de productos suministrados por cada proveedor, incluyendo aquellos proveedores que no tienen productos asociados
SELECT s.CompanyName, COALESCE(COUNT(p.ProductID), 0) AS TotalProductosSuministrados
FROM Suppliers s
FULL OUTER JOIN Products p ON s.SupplierID = p.SupplierID
GROUP BY s.CompanyName;


--(160)Lista todos los territorios de ventas y la cantidad total de empleados asignados a cada territorio, incluyendo aquellos territorios que no tienen empleados asignados
SELECT t.TerritoryDescription, COALESCE(COUNT(e.EmployeeID), 0) AS NumeroEmpleadosAsignados
FROM Territories t
FULL OUTER JOIN EmployeeTerritories et ON t.TerritoryID = et.TerritoryID
FULL OUTER JOIN Employees e ON et.EmployeeID = e.EmployeeID
GROUP BY t.TerritoryDescription;


--(161)Muestra todos los clientes y sus pedidos correspondientes, incluyendo aquellos clientes que no han realizado pedidos y los pedidos que no tienen clientes asignados
SELECT c.CustomerName, o.OrderID
FROM Customers c
FULL OUTER JOIN Orders o ON c.CustomerID = o.CustomerID;


--(162)Encuentra todos los productos y sus categorías correspondientes, incluyendo aquellos productos que no tienen una categoría asignada y las categorías que no tienen productos asociados
SELECT p.ProductName, c.CategoryName
FROM Products p
FULL OUTER JOIN Categories c ON p.CategoryID = c.CategoryID;


--(163)Lista todos los empleados y sus informes directos correspondientes, incluyendo aquellos empleados que no tienen informes directos y los informes que no tienen empleados asignados
SELECT e1.FirstName AS Empleado, e2.FirstName AS ReportaA
FROM Employees e1
FULL OUTER JOIN Employees e2 ON e1.ReportsTo = e2.EmployeeID;


--(164)Muestra todos los productos que han sido vendidos al menos una vez y sus respectivas categorías, incluyendo aquellos productos que no tienen ventas registradas y las categorías que no tienen productos asociados
SELECT p.ProductName, c.CategoryName
FROM Products p
FULL OUTER JOIN [Order Details] od ON p.ProductID = od.ProductID
FULL OUTER JOIN Orders o ON od.OrderID = o.OrderID
FULL OUTER JOIN Categories c ON p.CategoryID = c.CategoryID;


--(165)Encuentra todos los empleados y la cantidad total de ventas realizadas por cada empleado, incluyendo aquellos empleados que no han realizado ventas
SELECT e.FirstName, e.LastName, COALESCE(SUM(o.TotalPrice), 0) AS TotalVentas
FROM Employees e
FULL OUTER JOIN Orders o ON e.EmployeeID = o.EmployeeID
GROUP BY e.FirstName, e.LastName;


--(166)Muestra todos los clientes y sus pedidos correspondientes, incluyendo aquellos clientes que no han realizado pedidos y los pedidos que no tienen clientes asignados, ordenados por nombre de cliente de manera ascendente
SELECT c.CustomerName, o.OrderID
FROM Customers c
FULL OUTER JOIN Orders o ON c.CustomerID = o.CustomerID
ORDER BY c.CustomerName ASC;


--(167)Lista todos los empleados y sus informes directos correspondientes, incluyendo aquellos empleados que no tienen informes directos y los informes que no tienen empleados asignados, ordenados por nombre de empleado de manera ascendente
SELECT e1.FirstName AS Empleado, e2.FirstName AS ReportaA
FROM Employees e1
FULL OUTER JOIN Employees e2 ON e1.ReportsTo = e2.EmployeeID
ORDER BY Empleado ASC;


--(168)Encuentra todos los productos y sus categorías correspondientes, incluyendo aquellos productos que no tienen una categoría asignada y las categorías que no tienen productos asociados, ordenados por nombre de producto de manera ascendente
SELECT p.ProductName, c.CategoryName
FROM Products p
FULL OUTER JOIN Categories c ON p.CategoryID = c.CategoryID
ORDER BY p.ProductName ASC;


--(169)Muestra todos los clientes y la cantidad total de pedidos realizados por cada cliente, incluyendo aquellos clientes que no han realizado pedidos, ordenados por cantidad total de pedidos de manera descendente
SELECT c.CustomerName, COALESCE(COUNT(o.OrderID), 0) AS TotalPedidos
FROM Customers c
FULL OUTER JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName
ORDER BY TotalPedidos DESC;


--(171)Muestra todos los productos y la cantidad total de unidades vendidas de cada producto, incluyendo aquellos productos que no tienen ventas registradas, y ordena los resultados por cantidad de unidades vendidas de manera descendente
SELECT p.ProductName, COALESCE(SUM(od.Quantity), 0) AS TotalUnidadesVendidas
FROM Products p
FULL OUTER JOIN [Order Details] od ON p.ProductID = od.ProductID
GROUP BY p.ProductName
ORDER BY TotalUnidadesVendidas DESC;


--(172)Lista todos los clientes y sus pedidos correspondientes, incluyendo aquellos clientes que no han realizado pedidos y los pedidos que no tienen clientes asignados, y ordena los resultados por nombre de cliente de manera ascendente
SELECT c.CustomerName, o.OrderID
FROM Customers c
FULL OUTER JOIN Orders o ON c.CustomerID = o.CustomerID
ORDER BY c.CustomerName ASC;


--(173)Encuentra todos los empleados y la cantidad total de productos vendidos por cada empleado, incluyendo aquellos empleados que no han realizado ventas, y ordena los resultados por cantidad total de productos vendidos de manera descendente
SELECT e.FirstName, e.LastName, COALESCE(SUM(od.Quantity), 0) AS TotalProductosVendidos
FROM Employees e
FULL OUTER JOIN Orders o ON e.EmployeeID = o.EmployeeID
FULL OUTER JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY e.FirstName, e.LastName
ORDER BY TotalProductosVendidos DESC;


--(174)Muestra todos los proveedores y la cantidad total de productos suministrados por cada proveedor, incluyendo aquellos proveedores que no tienen productos asociados, y ordena los resultados por cantidad total de productos suministrados de manera descendente
SELECT s.CompanyName, COALESCE(COUNT(p.ProductID), 0) AS TotalProductosSuministrados
FROM Suppliers s
FULL OUTER JOIN Products p ON s.SupplierID = p.SupplierID
GROUP BY s.CompanyName
ORDER BY TotalProductosSuministrados DESC;


--(175)Lista todos los territorios de ventas y la cantidad total de empleados asignados a cada territorio, incluyendo aquellos territorios que no tienen empleados asignados, y ordena los resultados por cantidad total de empleados de manera descendente
SELECT t.TerritoryDescription, COALESCE(COUNT(e.EmployeeID), 0) AS NumeroEmpleadosAsignados
FROM Territories t
FULL OUTER JOIN EmployeeTerritories et ON t.TerritoryID = et.TerritoryID
FULL OUTER JOIN Employees e ON et.EmployeeID = e.EmployeeID
GROUP BY t.TerritoryDescription
ORDER BY NumeroEmpleadosAsignados DESC;


--(176)Muestra todos los productos y sus categorías correspondientes, incluyendo aquellos productos que no tienen una categoría asignada y las categorías que no tienen productos asociados, y ordena los resultados por nombre de categoría de manera ascendente
SELECT p.ProductName, c.CategoryName
FROM Products p
FULL OUTER JOIN Categories c ON p.CategoryID = c.CategoryID
ORDER BY c.CategoryName ASC;


--(177)Encuentra todos los empleados y sus informes directos correspondientes, incluyendo aquellos empleados que no tienen informes directos y los informes que no tienen empleados asignados, y ordena los resultados por nombre de empleado de manera ascendente
SELECT e1.FirstName AS Empleado, e2.FirstName AS ReportaA
FROM Employees e1
FULL OUTER JOIN Employees e2 ON e1.ReportsTo = e2.EmployeeID
ORDER BY Empleado ASC;


--(178)Muestra todos los clientes y la cantidad total de pedidos realizados por cada cliente, incluyendo aquellos clientes que no han realizado pedidos, y ordena los resultados por cantidad total de pedidos de manera descendente
SELECT c.CustomerName, COALESCE(COUNT(o.OrderID), 0) AS TotalPedidos
FROM Customers c
FULL OUTER JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName
ORDER BY TotalPedidos DESC;


--(179)Encuentra todos los productos y sus proveedores correspondientes, incluyendo aquellos productos que no tienen un proveedor asignado y los proveedores que no tienen productos asociados, y ordena los resultados por nombre de producto de manera ascendente
SELECT p.ProductName, s.CompanyName
FROM Products p
FULL OUTER JOIN Suppliers s ON p.SupplierID = s.SupplierID
ORDER BY p.ProductName ASC;


--(180)Muestra todos los clientes y la cantidad total de pedidos realizados por cada cliente, incluyendo aquellos clientes que no han realizado pedidos, y ordena los resultados por nombre de cliente de manera descendente
SELECT c.CustomerName, COALESCE(COUNT(o.OrderID), 0) AS TotalPedidos
FROM Customers c
FULL OUTER JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName
ORDER BY c.CustomerName DESC;


--(181)Encuentra todos los productos y sus proveedores correspondientes, incluyendo aquellos productos que no tienen un proveedor asignado y los proveedores que no tienen productos asociados, y ordena los resultados por nombre de proveedor de manera ascendente
SELECT p.ProductName, s.CompanyName
FROM Products p
FULL OUTER JOIN Suppliers s ON p.SupplierID = s.SupplierID
ORDER BY s.CompanyName ASC;


--(182)Lista todos los empleados y la cantidad total de ventas realizadas por cada empleado, incluyendo aquellos empleados que no han realizado ventas, y ordena los resultados por cantidad total de ventas de manera descendente
SELECT e.FirstName, e.LastName, COALESCE(SUM(o.TotalPrice), 0) AS TotalVentas
FROM Employees e
FULL OUTER JOIN Orders o ON e.EmployeeID = o.EmployeeID
GROUP BY e.FirstName, e.LastName
ORDER BY TotalVentas DESC;


--(183)Muestra todos los productos y sus categorías correspondientes, incluyendo aquellos productos que no tienen una categoría asignada y las categorías que no tienen productos asociados, y ordena los resultados por nombre de producto de manera ascendente
SELECT p.ProductName, c.CategoryName
FROM Products p
FULL OUTER JOIN Categories c ON p.CategoryID = c.CategoryID
ORDER BY p.ProductName ASC;


--(184)Encuentra todos los empleados y sus informes directos correspondientes, incluyendo aquellos empleados que no tienen informes directos y los informes que no tienen empleados asignados, y ordena los resultados por nombre de empleado de manera ascendente
SELECT e1.FirstName AS Empleado, e2.FirstName AS ReportaA
FROM Employees e1
FULL OUTER JOIN Employees e2 ON e1.ReportsTo = e2.EmployeeID
ORDER BY Empleado ASC;


--(185)Muestra todos los productos y la cantidad total de unidades vendidas de cada producto, incluyendo aquellos productos que no tienen ventas registradas, y ordena los resultados por cantidad de unidades vendidas de manera descendente
SELECT p.ProductName, COALESCE(SUM(od.Quantity), 0) AS TotalUnidadesVendidas
FROM Products p
FULL OUTER JOIN [Order Details] od ON p.ProductID = od.ProductID
GROUP BY p.ProductName
ORDER BY TotalUnidadesVendidas DESC;


--(186)Lista todos los clientes y sus pedidos correspondientes, incluyendo aquellos clientes que no han realizado pedidos y los pedidos que no tienen clientes asignados, y ordena los resultados por nombre de cliente de manera ascendente
SELECT c.CustomerName, o.OrderID
FROM Customers c
FULL OUTER JOIN Orders o ON c.CustomerID = o.CustomerID
ORDER BY c.CustomerName ASC;


--(187)Muestra todos los productos y sus proveedores correspondientes, incluyendo aquellos productos que no tienen un proveedor asignado y los proveedores que no tienen productos asociados, y ordena los resultados por nombre de proveedor de manera descendente
SELECT p.ProductName, s.CompanyName
FROM Products p
FULL OUTER JOIN Suppliers s ON p.SupplierID = s.SupplierID
ORDER BY s.CompanyName DESC;


--(188)Encuentra todos los productos que han sido vendidos al menos una vez y sus respectivas categorías, incluyendo aquellos productos que no tienen ventas registradas y las categorías que no tienen productos asociados, y ordena los resultados por nombre de categoría de manera ascendente
SELECT p.ProductName, c.CategoryName
FROM Products p
FULL OUTER JOIN [Order Details] od ON p.ProductID = od.ProductID
FULL OUTER JOIN Orders o ON od.OrderID = o.OrderID
FULL OUTER JOIN Categories c ON p.CategoryID = c.CategoryID
ORDER BY c.CategoryName ASC;


--(189)Muestra todos los empleados y la cantidad total de ventas realizadas por cada empleado, incluyendo aquellos empleados que no han realizado ventas, y ordena los resultados por nombre de empleado de manera descendente
SELECT e.FirstName, e.LastName, COALESCE(SUM(o.TotalPrice), 0) AS TotalVentas
FROM Employees e
FULL OUTER JOIN Orders o ON e.EmployeeID = o.EmployeeID
GROUP BY e.FirstName, e.LastName
ORDER BY e.FirstName DESC, e.LastName DESC;


--(190)Lista todos los clientes y la cantidad total de pedidos realizados por cada cliente, incluyendo aquellos clientes que no han realizado pedidos, y ordena los resultados por cantidad total de pedidos de manera ascendente
SELECT c.CustomerName, COALESCE(COUNT(o.OrderID), 0) AS TotalPedidos
FROM Customers c
FULL OUTER JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName
ORDER BY TotalPedidos ASC;


--(191)Muestra todos los productos y sus categorías correspondientes, incluyendo aquellos productos que no tienen una categoría asignada y las categorías que no tienen productos asociados, y ordena los resultados por nombre de producto de manera descendente
SELECT p.ProductName, c.CategoryName
FROM Products p
FULL OUTER JOIN Categories c ON p.CategoryID = c.CategoryID
ORDER BY p.ProductName DESC;


--(192)Muestra todos los empleados y la cantidad total de productos vendidos por cada empleado, incluyendo aquellos empleados que no han realizado ventas, y ordena los resultados por cantidad total de productos vendidos de manera ascendente
SELECT e.FirstName, e.LastName, COALESCE(SUM(od.Quantity), 0) AS TotalProductosVendidos
FROM Employees e
FULL OUTER JOIN Orders o ON e.EmployeeID = o.EmployeeID
FULL OUTER JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY e.FirstName, e.LastName
ORDER BY TotalProductosVendidos ASC;


--(193)Encuentra todos los productos y sus proveedores correspondientes, incluyendo aquellos productos que no tienen un proveedor asignado y los proveedores que no tienen productos asociados, y ordena los resultados por nombre de producto de manera ascendente
SELECT p.ProductName, s.CompanyName
FROM Products p
FULL OUTER JOIN Suppliers s ON p.SupplierID = s.SupplierID
ORDER BY p.ProductName ASC;


--(194)Muestra todos los clientes y sus pedidos correspondientes, incluyendo aquellos clientes que no han realizado pedidos y los pedidos que no tienen clientes asignados, y ordena los resultados por nombre de cliente de manera descendente
SELECT c.CustomerName, o.OrderID
FROM Customers c
FULL OUTER JOIN Orders o ON c.CustomerID = o.CustomerID
ORDER BY c.CustomerName DESC;


--(195)Encuentra todos los productos que han sido vendidos al menos una vez y sus respectivas categorías, incluyendo aquellos productos que no tienen ventas registradas y las categorías que no tienen productos asociados, y ordena los resultados por nombre de producto de manera ascendente
SELECT p.ProductName, c.CategoryName
FROM Products p
FULL OUTER JOIN [Order Details] od ON p.ProductID = od.ProductID
FULL OUTER JOIN Orders o ON od.OrderID = o.OrderID
FULL OUTER JOIN Categories c ON p.CategoryID = c.CategoryID
ORDER BY p.ProductName ASC;


--(196)Lista todos los empleados y la cantidad total de ventas realizadas por cada empleado, incluyendo aquellos empleados que no han realizado ventas, y ordena los resultados por nombre de empleado de manera ascendente
SELECT e.FirstName, e.LastName, COALESCE(SUM(o.TotalPrice), 0) AS TotalVentas
FROM Employees e
FULL OUTER JOIN Orders o ON e.EmployeeID = o.EmployeeID
GROUP BY e.FirstName, e.LastName
ORDER BY e.FirstName ASC, e.LastName ASC;


--(197)Muestra todos los productos y sus categorías correspondientes, incluyendo aquellos productos que no tienen una categoría asignada y las categorías que no tienen productos asociados, y ordena los resultados por nombre de categoría de manera ascendente
SELECT p.ProductName, c.CategoryName
FROM Products p
FULL OUTER JOIN Categories c ON p.CategoryID = c.CategoryID
ORDER BY c.CategoryName ASC;


--(198)Lista todos los clientes y la cantidad total de pedidos realizados por cada cliente, incluyendo aquellos clientes que no han realizado pedidos, y ordena los resultados por cantidad total de pedidos de manera descendente
SELECT c.CustomerName, COALESCE(COUNT(o.OrderID), 0) AS TotalPedidos
FROM Customers c
FULL OUTER JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName
ORDER BY TotalPedidos DESC;


--(199)Muestra todos los productos y sus proveedores correspondientes, incluyendo aquellos productos que no tienen un proveedor asignado y los proveedores que no tienen productos asociados, y ordena los resultados por nombre de proveedor de manera ascendente
SELECT p.ProductName, s.CompanyName
FROM Products p
FULL OUTER JOIN Suppliers s ON p.SupplierID = s.SupplierID
ORDER BY s.CompanyName ASC;


--(200)Encuentra todos los productos que han sido vendidos al menos una vez y sus respectivas categorías, incluyendo aquellos productos que no tienen ventas registradas y las categorías que no tienen productos asociados, y ordena los resultados por nombre de producto de manera ascendente
SELECT p.ProductName, c.CategoryName
FROM Products p
FULL OUTER JOIN [Order Details] od ON p.ProductID = od.ProductID
FULL OUTER JOIN Orders o ON od.OrderID = o.OrderID
FULL OUTER JOIN Categories c ON p.CategoryID = c.CategoryID
ORDER BY p.ProductName ASC;




 
