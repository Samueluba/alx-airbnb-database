-- ======================================
-- Partitioning the Bookings Table
-- ======================================

-- 1. Rename the original table (backup reference)
ALTER TABLE bookings RENAME TO bookings_old;

-- 2. Create the new parent partitioned table
CREATE TABLE bookings (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL,
    property_id BIGINT NOT NULL,
    booking_date DATE NOT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    status VARCHAR(50),
    -- additional columns if needed
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id),
    CONSTRAINT fk_property FOREIGN KEY (property_id) REFERENCES properties(id)
) PARTITION BY RANGE (check_in_date);

-- 3. Create partitions by year (can be monthly/quarterly as needed)

-- Partition for bookings in 2024
CREATE TABLE bookings_2024 PARTITION OF bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

-- Partition for bookings in 2025
CREATE TABLE bookings_2025 PARTITION OF bookings
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Default partition for future bookings
CREATE TABLE bookings_default PARTITION OF bookings DEFAULT;

-- 4. (Optional) Reinsert data from old table
INSERT INTO bookings
SELECT * FROM bookings_old;

-- 5. (Optional) Drop old table after verifying migration
-- DROP TABLE bookings_old;
