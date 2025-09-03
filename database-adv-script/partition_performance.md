# Partitioning Optimization Report

## 1. Motivation
The `bookings` table grows very large over time, making queries that filter by date (`check_in_date`) increasingly slow.  
Partitioning helps by splitting the table into smaller, more manageable pieces so queries only scan the relevant partitions.

---

## 2. Implementation (Range Partitioning)

We partitioned the `bookings` table by `check_in_date`:

```sql
CREATE TABLE bookings (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL,
    property_id BIGINT NOT NULL,
    booking_date DATE NOT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    status VARCHAR(50),
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id),
    CONSTRAINT fk_property FOREIGN KEY (property_id) REFERENCES properties(id)
) PARTITION BY RANGE (check_in_date);

-- Yearly partitions
CREATE TABLE bookings_2024 PARTITION OF bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Default partition (future dates)
CREATE TABLE bookings_default PARTITION OF bookings DEFAULT;
