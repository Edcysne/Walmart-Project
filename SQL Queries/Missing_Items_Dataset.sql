# Since we had three columns with the same purpose: list the missing products...
# We gathered all of the 3 columns into a single one.

SELECT
  o.order_id,
  p.produc_id,
  p.product_name,
  p.category,
  p.price
FROM (
  SELECT order_id, product_id_1 AS product_id
  FROM missing_items_data
  WHERE product_id_1 IS NOT NULL
  UNION ALL
  SELECT order_id, product_id_2
  FROM missing_items_data
  WHERE product_id_2 IS NOT NULL
  UNION ALL
  SELECT order_id, product_id_3
  FROM missing_items_data
  WHERE product_id_3 IS NOT NULL
) AS o
JOIN products_data AS p
  ON p.produc_id = o.product_id;
