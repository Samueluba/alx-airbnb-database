-- INNER JOIN: All bookings with respective users
SELECT b.id AS booking_id, b.booking_date, u.id AS user_id, u.name, u.email
FROM Bookings b
INNER JOIN Users u ON b.user_id = u.id;

-- LEFT JOIN: All properties and their reviews (including no reviews)
SELECT p.id AS property_id, p.title, r.id AS review_id, r.rating, r.comment
FROM Properties p
LEFT JOIN Reviews r ON p.id = r.property_id;

-- FULL OUTER JOIN: All users and all bookings
SELECT u.id AS user_id, u.name, b.id AS booking_id, b.booking_date
FROM Users u
FULL OUTER JOIN Bookings b ON u.id = b.user_id;
