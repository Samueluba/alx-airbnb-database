# SQL JOIN Queries

This repository contains sample SQL queries demonstrating different types of JOIN operations using a simplified database schema for an Airbnb-style application.  

---

## 📂 Project Structure

---

## 📊 Database Schema (Simplified)

- **Users** (`id`, `name`, `email`)  
- **Bookings** (`id`, `user_id`, `property_id`, `booking_date`)  
- **Properties** (`id`, `title`, `location`)  
- **Reviews** (`id`, `property_id`, `user_id`, `rating`, `comment`)  

---

## 🔑 Queries Included

### 1. INNER JOIN
Retrieve all bookings and the respective users who made those bookings.  
```sql
SELECT b.id AS booking_id, b.booking_date, u.id AS user_id, u.name, u.email
FROM Bookings b
INNER JOIN Users u ON b.user_id = u.id;
