-- ============================================
-- Initial Query: Bookings + User + Property + Payment
-- ============================================

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

-- ============================================
-- Performance Analysis
-- ============================================

-- Run EXPLAIN ANALYZE to check execution plan
EXPLAIN ANALYZE
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

-- ============================================
-- Expected Inefficiencies
-- ============================================

-- 1. Sequential scans on users, properties, or bookings
--    if indexes on (user_id, property_id, booking_id) are missing.

-- 2. Nested loop joins
--    which can become expensive as data grows.

-- 3. Full table scan on payments
--    if no index exists on booking_id.

-- 4. Wide SELECT *
--    (selecting many unnecessary columns) increases row size and memory use.
