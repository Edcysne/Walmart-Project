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
    d.trips AS driver_trips
FROM orders_data o
JOIN customers_data c ON c.customer_id = o.customer_id
JOIN drivers_data d ON d.driver_id = o.driver_id;
