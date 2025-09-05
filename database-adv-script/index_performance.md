CREATE INDEX idx_user_id ON users (user_id);
CREATE INDEX idx_user_email ON users (email);
CREATE INDEX idx_user_created_at ON users (created_at);
CREATE INDEX idx_user_status ON users (status);
CREATE INDEX idx_user_last_login ON users (last_login);
CREATE INDEX idx_booking_id ON bookings (booking_id);
CREATE INDEX idx_booking_user_id ON bookings (user_id);
CREATE INDEX idx_booking_property_id ON bookings (property_id);
CREATE INDEX idx_booking_start_date ON bookings (start_date);
CREATE INDEX idx_booking_end_date ON bookings (end_date);
CREATE INDEX idx_booking_status ON bookings (status);
CREATE INDEX idx_booking_total_price ON bookings (total_price);
CREATE INDEX idx_property_id ON properties (property_id);
CREATE INDEX idx_property_user_id ON properties (user_id);
CREATE INDEX idx_property_location ON properties (location);
CREATE INDEX idx_property_price_per_night ON properties (price_per_night);
CREATE INDEX idx_property_availability_status ON properties (availability_status);
CREATE INDEX idx_property_rating ON properties (rating);
EXPLAIN ANALYZE
SELECT * 
FROM bookings
JOIN users ON bookings.user_id = users.user_id
WHERE bookings.start_date BETWEEN '2023-01-01' AND '2023-12-31'
AND users.status = 'active'
ORDER BY bookings.start_date;
EXPLAIN ANALYZE
SELECT * 
FROM bookings
JOIN users ON bookings.user_id = users.user_id
WHERE bookings.start_date BETWEEN '2023-01-01' AND '2023-12-31'
AND users.status = 'active'
ORDER BY bookings.start_date;
