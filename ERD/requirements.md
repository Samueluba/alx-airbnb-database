# Airbnb Database Requirements

## Entities and Attributes

### 1. User
- **user_id**: Primary Key, UUID, Indexed
- **first_name**: VARCHAR, NOT NULL
- **last_name**: VARCHAR, NOT NULL
- **email**: VARCHAR, UNIQUE, NOT NULL
- **password_hash**: VARCHAR, NOT NULL
- **phone_number**: VARCHAR, NULL
- **role**: ENUM (guest, host, admin), NOT NULL
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

### 2. Property
- **property_id**: Primary Key, UUID, Indexed
- **host_id**: Foreign Key → User(user_id)
- **name**: VARCHAR, NOT NULL
- **description**: TEXT, NOT NULL
- **location**: VARCHAR, NOT NULL
- **price_per_night**: DECIMAL, NOT NULL
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- **updated_at**: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

---

### 3. Booking
- **booking_id**: Primary Key, UUID, Indexed
- **property_id**: Foreign Key → Property(property_id)
- **user_id**: Foreign Key → User(user_id)
- **start_date**: DATE, NOT NULL
- **end_date**: DATE, NOT NULL
- **total_price**: DECIMAL, NOT NULL
- **status**: ENUM (pending, confirmed, canceled), NOT NULL
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

### 4. Payment
- **payment_id**: Primary Key, UUID, Indexed
- **booking_id**: Foreign Key → Booking(booking_id)
- **amount**: DECIMAL, NOT NULL
- **payment_date**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- **payment_method**: ENUM (credit_card, paypal, stripe), NOT NULL

---

### 5. Review
- **review_id**: Primary Key, UUID, Indexed
- **property_id**: Foreign Key → Property(property_id)
- **user_id**: Foreign Key → User(user_id)
- **rating**: INTEGER (1–5), NOT NULL
- **comment**: TEXT, NOT NULL
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

### 6. Message
- **message_id**: Primary Key, UUID, Indexed
- **sender_id**: Foreign Key → User(user_id)
- **recipient_id**: Foreign Key → User(user_id)
- **message_body**: TEXT, NOT NULL
- **sent_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

## Relationships
- **User → Property**: 1 user (host) can host many properties.
- **User → Booking**: 1 user can make many bookings.
- **Property → Booking**: 1 property can have many bookings.
- **Booking → Payment**: 1 booking has 1 payment.
- **User → Review**: 1 user can write many reviews.
- **Property → Review**: 1 property can have many reviews.
- **User → Message**: Users can send/receive many messages.

---

## Constraints
- **User**: Unique email, required fields NOT NULL.
- **Property**: host_id must reference an existing user.
- **Booking**: property_id and user_id must exist, status ENUM constraint.
- **Payment**: booking_id must reference an existing booking.
- **Review**: rating must be between 1–5.
- **Message**: sender_id and recipient_id must be valid users.

---

## Indexing
- Primary Keys: Indexed automatically.
- Additional Indexes:
  - `email` in User
  - `property_id` in Property, Booking
  - `booking_id` in Booking, Payment
