-- v_Product_Enriched

CREATE OR REPLACE VIEW v_Product_Enriched AS
SELECT
    p.product_id AS "Product ID",
    p.product_name AS "Product Name",
    c.category_name AS "Category Name",
    s.company_name AS "Supplier",
    p.unit_price AS "Unit Price"
FROM products p
LEFT JOIN categories c ON p.category_id = c.category_id
LEFT JOIN suppliers s ON p.supplier_id = s.supplier_id;

-- v_Order_Sales

CREATE OR REPLACE VIEW v_Order_Sales AS
SELECT
    o.order_id       AS "Order ID",
    o.customer_id    AS "Customer ID",
    o.employee_id    AS "Employee ID",
    o.order_date     AS "Order Date",
    o.required_date  AS "Required Date",
    o.shipped_date   AS "Shipped Date",
    o.ship_via       AS "Shipper ID",
    o.freight        AS "Freight",
    od.product_id    AS "Product ID",
    od.unit_price    AS "Unit Price",
    od.quantity      AS "Quantity",
    od.discount      AS "Discount",
    ROUND((od.unit_price * od.quantity * (1 - od.discount))::numeric, 2) AS "Total Line Amount"
FROM orders o
INNER JOIN order_details od ON o.order_id = od.order_id;

-- v_Customer_Geo

CREATE OR REPLACE VIEW v_Customer_Geo AS
SELECT
    customer_id    AS "Customer ID",
    company_name   AS "Company Name",
    contact_name   AS "Contact Name",
    city           AS "City",
    country        AS "Country"
FROM customers;
