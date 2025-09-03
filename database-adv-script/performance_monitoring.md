# Database Performance Report

## 1. Performance Monitoring

We monitored frequently used queries with `EXPLAIN ANALYZE` (Postgres) / `SHOW PROFILE` (MySQL) to understand execution plans and timing.

### Example Query 1: Fetch bookings with user and property details
```sql
EXPLAIN ANALYZE
SELECT b.id, b.booking_date, u.username, p.title, p.location
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
WHERE u.email = 'test@example.com'
ORDER BY b.booking_date DESC;
