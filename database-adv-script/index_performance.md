# Index Performance Analysis

This document summarizes how indexing improved performance for our database queries.

---

## ✅ Step 1: High-Usage Columns Identified

### Users Table
- `email`, `created_at`, `status`, `last_login`

### Bookings Table
- `user_id`, `property_id`, `start_date`, `end_date`, `status`, `total_price`

### Properties Table
- `user_id`, `location`, `price_per_night`, `availability_status`, `rating`

---

## ✅ Step 2: Index Creation

All index commands are saved in [`database_index.sql`](./database_index.sql).

Example:
```sql
CREATE INDEX idx_booking_start_date ON bookings (start_date);
CREATE INDEX idx_user_status ON users (status);
