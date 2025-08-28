-- =========================================================
-- Airbnb Clone Database Schema
-- =========================================================

-- Drop existing tables if they exist (for a clean setup)
DROP TABLE IF EXISTS Payments CASCADE;
DROP TABLE IF EXISTS Reviews CASCADE;
DROP TABLE IF EXISTS Bookings CASCADE;
DROP TABLE IF EXISTS Listings CASCADE;
DROP TABLE IF EXISTS Users CASCADE;

-- =========================================================
-- 1. Users Table
-- =========================================================
CREATE TABLE Users (
    user_id UUID PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    role ENUM('guest', 'host', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Index for faster lookups by email
CREATE INDEX idx_users_email ON Users(email);

-- =========================================================
-- 2. Listings Table
-- =========================================================
CREATE TABLE Listings (
    listing_id UUID PRIMARY KEY,
    host_id UUID NOT NULL,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    location VARCHAR(100) NOT NULL,
    price_per_night DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_host FOREIGN KEY (host_id) REFERENCES Users(user_id)
);

-- Index for faster searches
CREATE INDEX idx_listings_location ON Listings(location);
CREATE INDEX idx_listings_price ON Listings(price_per_night);

-- =========================================================
-- 3. Bookings Table
-- =========================================================
CREATE TABLE Bookings (
    booking_id UUID PRIMARY KEY,
    listing_id UUID NOT NULL,
    guest_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status ENUM('pending', 'confirmed', 'cancelled') NOT NULL,

    CONSTRAINT fk_booking_listing FOREIGN KEY (listing_id) REFERENCES Listings(listing_id),
    CONSTRAINT fk_booking_guest FOREIGN KEY (guest_id) REFERENCES Users(user_id)
);

-- Index for faster queries
CREATE INDEX idx_bookings_guest ON Bookings(guest_id);
CREATE INDEX idx_bookings_status ON Bookings(status);

-- =========================================================
-- 4. Reviews Table
-- =========================================================
CREATE TABLE Reviews (
    review_id UUID PRIMARY KEY,
    booking_id UUID NOT NULL,
    guest_id UUID NOT NULL,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_review_booking FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id),
    CONSTRAINT fk_review_guest FOREIGN KEY (guest_id) REFERENCES Users(user_id)
);

-- Index for quick lookups
CREATE INDEX idx_reviews_guest ON Reviews(guest_id);

-- =========================================================
-- 5. Payments Table
-- =========================================================
CREATE TABLE Payments (
    payment_id UUID PRIMARY KEY,
    booking_id UUID NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('pending', 'completed', 'failed') NOT NULL,

    CONSTRAINT fk_payment_booking FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

-- Index for filtering payments
CREATE INDEX idx_payments_status ON Payments(status);
