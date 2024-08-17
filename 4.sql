USE mydb;

-- 4.1 - total count of records
SELECT COUNT(empl.employee_id)
FROM employees as empl
INNER JOIN orders as ord ON empl.employee_id = ord.employee_id
INNER JOIN order_details as ord_details ON ord_details.order_id = ord.id
INNER JOIN customers as cust ON cust.Id = ord.customer_id
INNER JOIN products as prod ON prod.id = ord_details.product_id
INNER JOIN categories as cat ON cat.Id = prod.category_id
INNER JOIN shippers as ship ON ship.Id = ord.shipper_id
INNER JOIN suppliers as suppl ON suppl.Id = prod.supplier_id;

-- 4.2 - count of records after changing INNER to LEFT for each join 
SELECT COUNT(empl.employee_id)
FROM employees as empl
LEFT JOIN orders as ord ON empl.employee_id = ord.employee_id
LEFT JOIN order_details as ord_details ON ord_details.order_id = ord.id
LEFT JOIN customers as cust ON cust.Id = ord.customer_id
LEFT JOIN products as prod ON prod.id = ord_details.product_id
LEFT JOIN categories as cat ON cat.Id = prod.category_id
LEFT JOIN shippers as ship ON ship.Id = ord.shipper_id
LEFT JOIN suppliers as suppl ON suppl.Id = prod.supplier_id;

-- 4.3 - filter by employee ids
SELECT 
	ord.*,
    ord_details.*,
    cust.*,
    prod.*,
    cat.*,
    empl.*,
    ship.*,
    suppl.*
FROM employees as empl
INNER JOIN orders as ord ON empl.employee_id = ord.employee_id
INNER JOIN order_details as ord_details ON ord_details.order_id = ord.id
INNER JOIN customers as cust ON cust.Id = ord.customer_id
INNER JOIN products as prod ON prod.id = ord_details.product_id
INNER JOIN categories as cat ON cat.Id = prod.category_id
INNER JOIN shippers as ship ON ship.Id = ord.shipper_id
INNER JOIN suppliers as suppl ON suppl.Id = prod.supplier_id
WHERE empl.employee_id between 4 AND 10;

-- 4.4 - grouping and aggregations
SELECT 
	cat.name, COUNT(ord_details.id), AVG(ord_details.quantity)
FROM employees as empl
INNER JOIN orders as ord ON empl.employee_id = ord.employee_id
INNER JOIN order_details as ord_details ON ord_details.order_id = ord.id
INNER JOIN customers as cust ON cust.Id = ord.customer_id
INNER JOIN products as prod ON prod.id = ord_details.product_id
INNER JOIN categories as cat ON cat.Id = prod.category_id
INNER JOIN shippers as ship ON ship.Id = ord.shipper_id
INNER JOIN suppliers as suppl ON suppl.Id = prod.supplier_id
WHERE empl.employee_id between 4 AND 10
GROUP BY cat.name;

-- 4.5 - filter by average quantity > 21
SELECT 
	cat.name, COUNT(ord_details.id), AVG(ord_details.quantity)
FROM employees as empl
INNER JOIN orders as ord ON empl.employee_id = ord.employee_id
INNER JOIN order_details as ord_details ON ord_details.order_id = ord.id
INNER JOIN customers as cust ON cust.Id = ord.customer_id
INNER JOIN products as prod ON prod.id = ord_details.product_id
INNER JOIN categories as cat ON cat.Id = prod.category_id
INNER JOIN shippers as ship ON ship.Id = ord.shipper_id
INNER JOIN suppliers as suppl ON suppl.Id = prod.supplier_id
WHERE empl.employee_id between 4 AND 10
GROUP BY cat.name
HAVING AVG(ord_details.quantity) > 21;

-- 4.6 - sort by descending rows count
SELECT 
	cat.name, COUNT(ord_details.id), AVG(ord_details.quantity)
FROM employees as empl
INNER JOIN orders as ord ON empl.employee_id = ord.employee_id
INNER JOIN order_details as ord_details ON ord_details.order_id = ord.id
INNER JOIN customers as cust ON cust.Id = ord.customer_id
INNER JOIN products as prod ON prod.id = ord_details.product_id
INNER JOIN categories as cat ON cat.Id = prod.category_id
INNER JOIN shippers as ship ON ship.Id = ord.shipper_id
INNER JOIN suppliers as suppl ON suppl.Id = prod.supplier_id
WHERE empl.employee_id between 4 AND 10
GROUP BY cat.name
HAVING AVG(ord_details.quantity) > 21
ORDER BY COUNT(ord_details.id) DESC;

-- 4.7 - limit and offset
SELECT 
	cat.name, COUNT(ord_details.id), AVG(ord_details.quantity)
FROM employees as empl
INNER JOIN orders as ord ON empl.employee_id = ord.employee_id
INNER JOIN order_details as ord_details ON ord_details.order_id = ord.id
INNER JOIN customers as cust ON cust.Id = ord.customer_id
INNER JOIN products as prod ON prod.id = ord_details.product_id
INNER JOIN categories as cat ON cat.Id = prod.category_id
INNER JOIN shippers as ship ON ship.Id = ord.shipper_id
INNER JOIN suppliers as suppl ON suppl.Id = prod.supplier_id
WHERE empl.employee_id between 4 AND 10
GROUP BY cat.name
HAVING AVG(ord_details.quantity) > 21
ORDER BY COUNT(ord_details.id) DESC
LIMIT 4
OFFSET 1;

