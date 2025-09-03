SELECT p.id, p.title, p.location
FROM Properties p
WHERE p.id IN (
    SELECT r.property_id
    FROM Reviews r
    GROUP BY r.property_id
    HAVING AVG(r.rating) > 4.0
);
SELECT u.id, u.name, u.email
FROM Users u
WHERE (
    SELECT COUNT(*)
    FROM Bookings b
    WHERE b.user_id = u.id
) > 3;
