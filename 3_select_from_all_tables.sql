USE mydb;

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
INNER JOIN suppliers as suppl ON suppl.Id = prod.supplier_id;
