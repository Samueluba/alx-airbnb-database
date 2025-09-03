# Query Optimization Report

## 1. Initial Query

```sql
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
EXPLAIN ANALYZE
SELECT ...
SELECT 
    b.id AS booking_id,
    b.booking_date,
    b.check_in_date,
    b.check_out_date,
    b.status AS booking_status,

    u.username,
    u.email,

    p.title AS property_title,
    p.location,
    p.price,

    pay.amount,
    pay.payment_status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON b.id = pay.booking_id;
-- Join keys
CREATE INDEX idx_booking_user_id ON bookings(user_id);
CREATE INDEX idx_booking_property_id ON bookings(property_id);
CREATE INDEX idx_payment_booking_id ON payments(booking_id);

-- For filtering/sorting
CREATE INDEX idx_booking_date ON bookings(booking_date);
**
---

👉 Do you want me to also include a **before vs. after EXPLAIN output snippet** in `opt.md` so readers can visually see the difference in execution plans?
**
