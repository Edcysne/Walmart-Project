# This was the final query used to gather all of the data and form the final database
# It uses the previous query "missing_items" to make a complete join 

SELECT
    o.date,
    o.order_id,
    o.order_amount,
    o.region,
    o.items_delivered,
    o.items_missing,
    o.delivery_hour,
    c.customer_id,
    c.customer_name,
    c.customer_age,
    d.driver_id,
    d.driver_name,
    d.age AS driver_age,
    d.trips AS driver_trips,
    p.product_name,
    p.category,
    p.price
FROM orders_data o
JOIN customers_data c 
  ON c.customer_id = o.customer_id
JOIN drivers_data d 
  ON d.driver_id = o.driver_id
LEFT JOIN (
  SELECT
      mi.order_id,
      pr.produc_id,
      pr.product_name,
      pr.category,
      pr.price
  FROM (
      SELECT order_id, product_id_1 AS produc_id
      FROM missing_items_data
      WHERE product_id_1 IS NOT NULL
      UNION ALL
      SELECT order_id, product_id_2 AS produc_id
      FROM missing_items_data
      WHERE product_id_2 IS NOT NULL
      UNION ALL
      SELECT order_id, product_id_3 AS produc_id
      FROM missing_items_data
      WHERE product_id_3 IS NOT NULL
  ) AS mi
  JOIN products_data_cleaned AS pr
    ON pr.produc_id = mi.produc_id
) AS p
  ON p.order_id = o.order_id;
