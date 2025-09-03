-- bookings_with_details.sql

SELECT 
    b.id AS booking_id,
    b.booking_date,
    b.check_in_date,
    b.check_out_date,
    b.status AS booking_status,

    u.id AS user_id,
    u.username,
    u.email,

    p.id AS property_id,
    p.title AS property_title,
    p.location,
    p.price,
    p.rating,

    pay.id AS payment_id,
    pay.amount,
    pay.payment_date,
    pay.payment_status

FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON b.id = pay.booking_id;
