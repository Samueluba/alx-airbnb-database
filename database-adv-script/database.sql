-- User table indexes
CREATE INDEX idx_user_email ON users (email);
CREATE INDEX idx_user_created_at ON users (created_at);
CREATE INDEX idx_user_status ON users (status);
CREATE INDEX idx_user_last_login ON users (last_login);

-- Booking table indexes
CREATE INDEX idx_booking_user_id ON bookings (user_id);
CREATE INDEX idx_booking_property_id ON bookings (property_id);
CREATE INDEX idx_booking_start_date ON bookings (start_date);
CREATE INDEX idx_booking_status ON bookings (status);

-- Property table indexes
CREATE INDEX idx_property_user_id ON properties (user_id);
CREATE INDEX idx_property_location ON properties (location);
CREATE INDEX idx_property_price_per_night ON properties (price_per_night);
CREATE INDEX idx_property_availability ON properties (availability_status);

