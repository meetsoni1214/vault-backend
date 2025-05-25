# Authentication Endpoints

## Setup

1. Make sure you have a PostgreSQL database running
2. Set up your environment variables (create a `.env` file):
   ```
   DATABASE_URL="postgresql://username:password@localhost:5432/vault_db?schema=public"
   JWT_SECRET="your-super-secret-jwt-key-change-this-in-production"
   PORT=3000
   ```
3. Run database migrations: `npx prisma migrate dev`
4. Start the server: `pnpm run start:dev`

## Available Endpoints

### 1. User Registration

**POST** `/auth/signup`

**Request Body:**

```json
{
  "email": "user@example.com",
  "password": "password123",
  "name": "John Doe"
}
```

**Response:**

```json
{
  "message": "User created successfully",
  "user": {
    "id": "uuid",
    "email": "user@example.com",
    "name": "John Doe",
    "createdAt": "2024-01-01T00:00:00.000Z"
  },
  "token": "jwt-token-here"
}
```

### 2. User Login

**POST** `/auth/login`

**Request Body:**

```json
{
  "email": "user@example.com",
  "password": "password123"
}
```

**Response:**

```json
{
  "message": "Login successful",
  "user": {
    "id": "uuid",
    "email": "user@example.com",
    "name": "John Doe"
  },
  "token": "jwt-token-here"
}
```

### 3. Get User Profile (Protected)

**GET** `/auth/profile`

**Headers:**

```
Authorization: Bearer <jwt-token>
```

**Response:**

```json
{
  "message": "Profile retrieved successfully",
  "user": {
    "id": "uuid",
    "email": "user@example.com",
    "name": "John Doe"
  }
}
```

## Features Implemented

- ✅ User registration with email validation
- ✅ Password hashing using bcrypt
- ✅ JWT token generation and validation
- ✅ Protected routes using JWT authentication
- ✅ Input validation using class-validator
- ✅ Prisma ORM integration
- ✅ Proper error handling for duplicate users and invalid credentials

## Security Features

- Passwords are hashed using bcrypt with salt rounds
- JWT tokens expire in 24 hours
- Input validation prevents malformed requests
- Unique email constraint in database
- Protected routes require valid JWT tokens
