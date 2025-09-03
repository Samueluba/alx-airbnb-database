-- ============================
-- Indexes for User Table
-- ============================
CREATE INDEX idx_user_email ON users(email);
CREATE INDEX idx_user_username ON users(username);

-- ============================
-- Indexes for Booking Table
-- ============================
CREATE INDEX idx_booking_user_id ON bookings(user_id);
CREATE INDEX idx_booking_property_id ON bookings(property_id);
CREATE INDEX idx_booking_date ON bookings(booking_date);

-- ============================
-- Indexes for Property Table
-- ============================
CREATE INDEX idx_property_host_id ON properties(host_id);
CREATE INDEX idx_property_location ON properties(location);
CREATE INDEX idx_property_price ON properties(price);
CREATE INDEX idx_property_rating ON properties(rating);
EXPLAIN ANALYZE
SELECT b.*
FROM bookings b
JOIN users u ON b.user_id = u.id
WHERE u.email = 'test@example.com'
ORDER BY b.booking_date DESC;
EXPLAIN ANALYZE
SELECT b.*
FROM bookings b
JOIN users u ON b.user_id = u.id
WHERE u.email = 'test@example.com'
ORDER BY b.booking_date DESC;
