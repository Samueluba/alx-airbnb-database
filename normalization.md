# Database Normalization – Airbnb Clone

## Step 1: First Normal Form (1NF)
- Each table has atomic values (no repeating groups or arrays).
- ✅ Already satisfied.

## Step 2: Second Normal Form (2NF)
- All non-key attributes depend fully on the primary key.
- Since all tables use UUIDs or single-column primary keys, there are no partial dependencies.
- ✅ Already satisfied.

## Step 3: Third Normal Form (3NF)
- Non-key attributes must not depend on other non-key attributes.
- Identified Issues:
  1. **Users.role** stored as ENUM → redundant role names across records.
  2. **Bookings.status** and **Payments.status** stored as ENUM → repeating text values.
  3. **Listings.location** stored as free-text city names → redundancy if multiple listings share the same city.

## Adjustments for 3NF
- **Created Roles table** → Users reference role_id.
- **Created BookingStatus and PaymentStatus tables** → Bookings and Payments reference status_id.
- **Created Locations table** → Listings reference location_id instead of storing raw text.

## Benefits of 3NF
- Reduces redundancy (cities, roles, status values stored once).
- Enforces consistency (cannot have a typo in "confirmed" vs "confrimed").
- Improves maintainability and scalability.

✅ The schema is now fully in 3NF.
