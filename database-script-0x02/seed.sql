-- =========================================================
-- Sample Data for Airbnb Clone
-- =========================================================

-- ========================
-- Users
-- ========================
INSERT INTO Users (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
('11111111-1111-1111-1111-111111111111', 'John', 'Doe', 'john.doe@example.com', 'hashed_pw1', '08012345678', 'guest', NOW()),
('22222222-2222-2222-2222-222222222222', 'Alice', 'Smith', 'alice.smith@example.com', 'hashed_pw2', '08087654321', 'host', NOW()),
('33333333-3333-3333-3333-333333333333', 'David', 'Brown', 'david.brown@example.com', 'hashed_pw3', '08111111111', 'guest', NOW()),
('44444444-4444-4444-4444-444444444444', 'Admin', 'User', 'admin@example.com', 'hashed_pw4', NULL, 'admin', NOW());

-- ========================
-- Listings (Properties)
-- ========================
INSERT INTO Listings (listing_id, host_id, title, description, location, price_per_night, created_at)
VALUES
('aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '22222222-2222-2222-2222-222222222222', 'Cozy Apartment in Lagos', '2-bedroom flat close to city center', 'Lagos', 45.00, NOW()),
('aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '22222222-2222-2222-2222-222222222222', 'Beach House PH', '3-bedroom house with sea view', 'Port Harcourt', 120.00, NOW()),
('aaaaaaa3-aaaa-aaaa-aaaa-aaaaaaaaaaa3', '22222222-2222-2222-2222-222222222222', 'Abuja Luxury Suite', 'Modern apartment in Maitama', 'Abuja', 80.00, NOW());

-- ========================
-- Bookings
-- ========================
INSERT INTO Bookings (booking_id, listing_id, guest_id, start_date, end_date, total_price, status)
VALUES
('bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '11111111-1111-1111-1111-111111111111', '2025-09-01', '2025-09-05', 180.00, 'confirmed'),
('bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbb2', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '11111111-1111-1111-1111-111111111111', '2025-09-10', '2025-09-12', 240.00, 'pending'),
('bbbbbbb3-bbbb-bbbb-bbbb-bbbbbbbbbbb3', 'aaaaaaa3-aaaa-aaaa-aaaa-aaaaaaaaaaa3', '33333333-3333-3333-3333-333333333333', '2025-09-15', '2025-09-18', 240.00, 'confirmed');

-- ========================
-- Reviews
-- ========================
INSERT INTO Reviews (review_id, booking_id, guest_id, rating, comment, created_at)
VALUES
('ccccccc1-cccc-cccc-cccc-ccccccccccc1', 'bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbb1', '11111111-1111-1111-1111-111111111111', 5, 'Great place, very comfortable stay!', NOW()),
('ccccccc2-cccc-cccc-cccc-ccccccccccc2', 'bbbbbbb3-bbbb-bbbb-bbbb-bbbbbbbbbbb3', '33333333-3333-3333-3333-333333333333', 4, 'Nice apartment, but check-in was a bit slow.', NOW());

-- ========================
-- Payments
-- ========================
INSERT INTO Payments (payment_id, booking_id, amount, payment_date, status)
VALUES
('ddddddd1-dddd-dddd-dddd-ddddddddddd1', 'bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 180.00, NOW(), 'completed'),
('ddddddd2-dddd-dddd-dddd-ddddddddddd2', 'bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbb2', 240.00, NOW(), 'pending'),
('ddddddd3-dddd-dddd-dddd-ddddddddddd3', 'bbbbbbb3-bbbb-bbbb-bbbb-bbbbbbbbbbb3', 240.00, NOW(), 'completed');
